#### Preamble ####
# Purpose: Simulates the clean FRED dataset
# Author: Ahnaf Alam
# Date: March 29, 2024
# Contact: ahnaf.alam@mail.utoronto.ca
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####

set.seed(37373)

dates <- seq(as.Date("2007-01-01"), by = "quarter", length.out = 60)

# Without controls
sim_data <- tibble(
  Date = dates,
  food = rnorm(60, mean = 950, sd = 150),
  income = rnorm(60, mean = 1350, sd = 150)
)

# Adding in controls

sim_data_controls <- tibble(
  Date = dates,
  food = rnorm(60, mean = 950, sd = 150),
  income = rnorm(60, mean = 1350, sd = 150),
  disposable = rnorm(60, mean = 2500, sd = 150),
  nondisposable = rnorm(60, mean = 2350, sd = 150),
  service = rnorm(60, mean = 2700, sd = 150),
  health = rnorm(60, mean = 1900, sd = 150)
)



