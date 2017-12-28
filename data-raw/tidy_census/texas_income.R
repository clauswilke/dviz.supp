library(tidycensus)
library(tidyverse)
library(cowplot)
library(colorspace)

options(tigris_use_cache = TRUE)
census_api_key("458c6de2dc2470e308c285e4aa64d84a2d5ae3a1")

##****************
## Median income
##****************

# get median income
texas_income <- get_acs(state = "TX",  geography = "county", year = 2015,
                        variables = "B19013_001", geometry = TRUE)

devtools::use_data(texas_income, overwrite = TRUE)
