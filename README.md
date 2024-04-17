# An investigation into disposable income and food expenditure

## Overview

Using data from Federal Reserve Economic Data ([FRED](https://fred.stlouisfed.org/)), we look to find how expenditure in food changes as disposable income goes up. Our investigation suggests that food expenditure does increase when disposable increases, however, the effects are modest as best. 

We created an interactive plot displaying how the expenditure modules compare to one another between 2007 to 2022. The plot can be found [here](https://posit.cloud/content/8038593). Please note that you need a Posit Cloud account to access this graph. 

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from FRED.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. It also includes datasheet for the cleaned data. 
-   `scripts` contains the R scripts used to simulate, download and clean data, as well as testing data.


## Statement on LLM usage

Aspects of the code were written with the help of ChatGPT, specifically the usage of `testthat` library in testing data, creating Figure 2 and Table 2 in the main paper and the interactive graph. We also used ChatGPT for editing for part of "Model" section. The entire chat history is available in `other/llms/usage.txt`.
