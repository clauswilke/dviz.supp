library(tidycensus)
library(tidyverse)

options(tigris_use_cache = TRUE)


# Explanation of ACS margin of error:
# https://www.census.gov/content/dam/Census/programs-surveys/acs/guidance/training-presentations/20180418_MOE.pdf
# It's a standard 90% confidence interval of the mean

income <- get_acs(
  geography = "county",
  year = 2015,
  variables = "B19013_001",
  geometry = FALSE
) %>%
  extract(NAME, "state", regex = ", (.*)") %>%
  select(GEOID, state, income = estimate, income.moe = moe)

age <- get_acs(
  geography = "county",
  year = 2015,
  variables = "B01002_001",
  geometry = FALSE
) %>%
  select(GEOID, age = estimate, age.moe = moe)

US_income_age <- left_join(income, age)

devtools::use_data(US_income_age, overwrite = TRUE)

