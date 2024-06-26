#### Preamble ####
# Purpose: Running tests on the clean data
# Author: Ahnaf Alam
# Date: March 13, 2024
# Contact: ahnaf.alam@mil.utoronto.ca
# Pre-requisites: Clean the data and save it under analysis folder


#### Workspace setup ####
library(tidyverse)
library(testthat)
library(lubridate)


#### Test data ####

data <- read_csv("data/analysis_data/data.csv")

#1. Making sure all the columns are numeric/double

test_that("Check class", {
  expect_type(data$durable_expenditure, "double")
  expect_type(data$nondurable_expenditure, "double")
  expect_type(data$food_expenditure, "double")
  expect_type(data$income_expenditure, "double")
  expect_type(data$healthcare_expenditure, "double")
  expect_type(data$services_expenditure, "double")
})

#2. Making sure there are no missing values

if(anyNA(data)) {
  print("There are missing values")
} else {
  print("There are no missing values")
}

#3. Making sure there are no non-negative numbers

if(!any(data <0)) {
  print("There are no negative numbers in the data set")
} else{
  print("There are negative numbers in the data set")
}

#4. Making sure the date column type is "Date"
if(all(class(data$date) == "Date")) {
  print("The date is a 'Date' column")
} else{
  print("The data is not a 'Date' column")
}

#5. Making sure the dates are in chronological order

if (all(diff(data$date) > 0)) {
  print("Dates are in chronological order.")
} else {
  print("Dates are not in chronological order.")
}


#6.Test to see if all the quarterly data are in quarter months or not i.e. January, April, August, December

q_dates <- function(dates) {
  months <- month(dates)
  q_months <-  c(1,4,8,12)
  all(months %in% q_months)
}

test_that("Check quarterly dates", {
  expect_true(q_dates(data$date))
})

#7. We check there are data for 4 distinct months for each year

check_four_months <- function(data) {
  data %>%
    mutate(year = lubridate::year(date), 
           month = lubridate::month(date)) |>
    group_by(year) |>
    summarise(num_months = n_distinct(month)) |>
    mutate(check = num_months == 4)
}
















