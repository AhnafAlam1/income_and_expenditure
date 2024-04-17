library(dplyr)
library(plotly)
library(shiny)


data <- read_csv(here::here("data/analysis_data/data.csv"))


p <- plot_ly(data, x = ~date) %>%
  add_lines(y = ~durable_expenditure, name = "Durable Expenditure", line = list(color = '#17BECF')) %>%
  add_lines(y = ~nondurable_expenditure, name = "Nondurable Expenditure", line = list(color = '#7cfc00')) %>%
  add_lines(y = ~food_expenditure, name = "Food Expenditure", line = list(color = '#FF7F0E')) %>%
  add_lines(y = ~income_expenditure, name = "Disposable income", line = list(color = '#a52a2a')) %>%
  add_lines(y = ~healthcare_expenditure, name = "Healthcare Expenditure", line = list(color = '#00008b')) %>%
  layout(
    title = "Time Series Plot (2007-2022)",
    xaxis = list(title = "Date"),
    yaxis = list(title = "Expenditure (in billions of 2017 USD)"),
    hovermode = "x unified"
  )

p

save_html(p, file = "other/sketches/interactive_time_series.html")

ui <- fluidPage(
  includeHTML("interactive_time_series.html")
)


server <- function(input, output, session) {}


shinyApp(ui, server)
