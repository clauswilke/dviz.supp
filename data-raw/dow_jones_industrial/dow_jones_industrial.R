library(tidyverse)
library(lubridate)

dow_jones_industrial <- read_csv(here::here("data-raw", "Dow_Jones", "DJI.csv")) %>%
  mutate(
    date = mdy(Date),
    open = Open,
    high = High,
    low = Low,
    close = Close,
    volume = Volume
  ) %>%
  select(date, open, high, low, close, volume)

devtools::use_data(dow_jones_industrial, overwrite = TRUE)
