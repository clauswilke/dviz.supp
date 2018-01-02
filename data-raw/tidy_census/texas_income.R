library(tidycensus)
library(tidyverse)

options(tigris_use_cache = TRUE)

##****************
## Median income
##****************

# get median income
texas_income <- get_acs(state = "TX",  geography = "county", year = 2015,
                        variables = "B19013_001", geometry = TRUE)

devtools::use_data(texas_income, overwrite = TRUE)
