library(tidycensus)
library(tidyverse)

##****************
## Median income
##****************

# get median income and total population size for 2010 and 2015
vars <- c("B19013_001", # Median Household Income past 12 months
          "B01003_001"  # Total Population
          )


HI_2010 <- get_acs(state = "HI",  geography = "county", year = 2010, variables = vars, geometry = FALSE)
HI_2015 <- get_acs(state = "HI",  geography = "county", year = 2015, variables = vars, geometry = FALSE)

hawaii_income <- rbind(mutate(HI_2010, year = 2010),
                       mutate(HI_2015, year = 2015)) %>%
  select(county = NAME, variable, estimate, year, GEOID) %>%
  spread(variable, estimate) %>%
  extract(county, "county", regex = "(.+) County, Hawaii") %>%
  rename(population = B01003_001, median_income = B19013_001)

devtools::use_data(hawaii_income, overwrite = TRUE)
