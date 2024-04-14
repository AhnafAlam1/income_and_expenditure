# An investigation into disposable income and food expenditure

## Overview

Using data from Federal Reserve Economic Data ([FRED](https://fred.stlouisfed.org/)), we look to find how expenditure in food changes as disposable income goes up. Our investigation suggests that food expenditure does increase when disposable increases, however, the effects are modest as best. 

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from X.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

Aspects of the code were written with the help of ChatGPT, specifically the usage of `testthat` library in testing data and creating Figure 2 in the main paper. The entire chat history is available in `other/llms/usage.txt`.
