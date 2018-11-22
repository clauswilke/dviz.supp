library(tidyverse)
library(here)

CO2 <- read_table2(here::here("data-raw", "CO2", "co2.txt")) %>%
  mutate(
    co2_ave = ifelse(co2_ave < 0, NA, co2_ave),
    ndays = ifelse(ndays < 0, NA, ndays)
  )

devtools::use_data(CO2, overwrite = FALSE)
