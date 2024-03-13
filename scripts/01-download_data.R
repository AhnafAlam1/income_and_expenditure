#### Preamble ####
# Purpose: Downloads and saves the data 
# Author: Ahnaf Alam
# Date: March 13, 2024
# Contact: ahnaf.alam@mail.utoronto.ca
# Pre-requisites: none required


#### Workspace setup ####
library(tidyverse)
library(fredr)
library(ggplot2)


#### Download data ####

fredr_set_key("1824c04bc58bc40b1729367e513497f1")


services<- fredr(
  series_id = "A797RX0Q048SBEA",
  observation_start = as.Date("2000-01-01"),
  observation_end = as.Date("2020-01-01"),
  frequency = "q"
)

food<- fredr(
  series_id = "DFXARX1M020SBEA",
  observation_start = as.Date("2000-01-01"),
  observation_end = as.Date("2020-01-01"),
  frequency = "q"
)

income<- fredr(
  series_id = "DSPIC96",
  observation_start = as.Date("2000-01-01"),
  observation_end = as.Date("2020-01-01"),
  frequency = "q"
)

healthcare<- fredr(
  series_id = "DHLCRX1Q020SBEA",
  observation_start = as.Date("2000-01-01"),
  observation_end = as.Date("2020-01-01"),
  frequency = "q"
)

durable<- fredr(
  series_id = "PCEDGC96",
  observation_start = as.Date("2000-01-01"),
  observation_end = as.Date("2020-01-01"),
  frequency = "q"
)

nondurable <- fredr(
  series_id = "PCENDC96",
  observation_start = as.Date("2000-01-01"),
  observation_end = as.Date("2020-01-01"),
  frequency = "q"
)


#### Save data ####
write_csv(services, "data/raw_data/services.csv") 
write_csv(food, "data/raw_data/food.csv")
write_csv(income, "data/raw_data/income.csv")
write_csv(healthcare, "data/raw_data/healthcare.csv")
write_csv(durable, "data/raw_data/durable.csv")
write_csv(nondurable, "data/raw_data/nondurable.csv")

         
