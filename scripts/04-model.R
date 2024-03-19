#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
analysis_data <- read_csv(here::here("data/analysis_data/data.csv"))

### Model data ####
model_1 <-
  stan_glm(
    formula = food_expenditure ~ income_expenditure,
    data = analysis_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 485
  )


model_2 <-
  stan_glm(
    formula = food_expenditure ~ income_expenditure + durable_expenditure + nondurable_expenditure +
      healthcare_expenditure + services_expenditure,
    data = analysis_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 485
  )



#### Save model ####
saveRDS(
  model_1,
  file = "models/model_1.rds"
)

saveRDS(
  model_2,
  file = "models/model_2.rds"
)




