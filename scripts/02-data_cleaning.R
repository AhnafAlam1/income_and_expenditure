#### Preamble ####
# Purpose: Cleans the raw data and combine them to create one dataframe
# Author: Ahnaf Alam
# Date: March 13, 2024
# Contact: ahnaf.alam@mail.utoronto.ca
# Pre-requisites: download the data in the "data" folder

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
durable <- read_csv("data/raw_data/durable.csv")
nondurable <- read_csv("data/raw_data/nondurable.csv")
food <- read_csv("data/raw_data/food.csv")
income <- read_csv("data/raw_data/income.csv")
healthcare <- read_csv("data/raw_data/healthcare.csv")
services<- read_csv("data/raw_data/services.csv")


durables <- merge(durable,
              nondurable,
              by = "date") |>
  select("date", "value.x", "value.y") |>
  rename(durable_expenditure = value.x,
         nondurable_expenditure = value.y)


food_income <- merge(food,
                  income,
                  by = "date") |>
  select("date", "value.x", "value.y") |>
  rename(food_expenditure = value.x,
         income_expenditure = value.y)

healthcare_services <- merge(healthcare,
                             services,
                             by = "date") |>
  select("date", "value.x", "value.y") |>
  rename(healthcare_expenditure = value.x,
         services_expenditure = value.y)

d_f_i <- merge(durables,
               food_income,
               by = "date") 

data <- merge(d_f_i, healthcare_services,
              by = "date")



#### Save data ####
write_csv(data, "data/analysis_data/data.csv")
