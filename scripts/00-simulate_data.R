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

set.seed(37373) # For replication purposes



# As discussion in the main paper, we look quaterly economic data from 2007 to 2022, which is a 15-year span, 
# with 60 months totals. FRED releases quaterly data on the first on each quater months, hence, all dates being on the 1st.

dates <- seq(as.Date("2007-01-01"), by = "quarter", length.out = 60) 

# We simulate the primary outcome and predictor variables, food and income. We simulate with data ~ N(950,150). These are 
# arbitrary values. 
sim_data <- tibble(
  Date = dates,
  food = rnorm(60, mean = 950, sd = 150),
  income = rnorm(60, mean = 1350, sd = 150)
)

# We simulate the control variables. these include disposable/disposable, services and healthcare spending.
# Again, these normal distribution and the values do not signify the actual data. 

sim_data_controls <- tibble(
  Date = dates,
  food = rnorm(60, mean = 950, sd = 150),
  income = rnorm(60, mean = 1350, sd = 150),
  disposable = rnorm(60, mean = 2500, sd = 150),
  nondisposable = rnorm(60, mean = 2350, sd = 150),
  service = rnorm(60, mean = 2700, sd = 150),
  health = rnorm(60, mean = 1900, sd = 150)
)



