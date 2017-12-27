library(dplyr)
library(stringr)
library(lubridate)
library(nycflights13)


flights %>% filter(origin == "EWR") %>%
  mutate(`departure time` = hm(sprintf("%02d:%02d", dep_time %/% 100, dep_time %% 100 ))) %>%
  select(`departure time`, `departure delay (minutes)` = dep_delay) %>%
  na.omit() -> flight_delays

devtools::use_data(flight_delays)
