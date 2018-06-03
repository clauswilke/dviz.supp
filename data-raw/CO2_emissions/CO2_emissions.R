library(here)
library(tidyverse)

d <- read_csv(here("data-raw", "CO2_emissions", "CO2_emissions_per_capita.csv"))
names(d)[1] <- "country"

CO2_emissions <- d %>%
  gather(year, emissions, -country) %>%
  mutate(year = as.numeric(year)) %>%
  filter(year >= 1950) %>%
  na.omit()

devtools::use_data(CO2_emissions, overwrite = TRUE)
