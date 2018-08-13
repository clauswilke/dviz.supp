# data downloaded from: https://research.stlouisfed.org/econ/mccracken/fred-databases/
# and lightly cleaned (removed a few columns with missing values)

library(readr)
library(lubridate)
library(dplyr)
library(here)

fred_md <- read_csv(here("data-raw", "fred_md", "2018-06_cleaned.csv")) %>%
  mutate(
    date = mdy(gsub("(.*/)([^01]\\d)", "\\119\\2", sasdate, perl = TRUE))
  )
  

devtools::use_data(fred_md, overwrite = TRUE)
