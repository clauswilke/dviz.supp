library(readr)
library(here)
library(dplyr)
library(tidyr)
library(lubridate)

ncdc_normals <- read_fwf(here::here("data-raw", "ncdc_normals", "dly-tavg-normal.txt"),
                         fwf_positions(c(1, 13, 19 + 7*(0:30)),
                                       c(11, 14, 24 + 7*(0:30)),
                                       c("station_id", "month", paste0("day", 1:31)))) %>%
  gather(day, value, -station_id, -month) %>%
  extract(day, "day", regex = "([[:digit:]]+)") %>%
  extract(value, c("temperature", "flag"), regex = "(-*[[:digit:]]+)([[:alpha:]]*)") %>%
  mutate(temperature = ifelse(temperature == "-8888", NA, as.numeric(temperature))/10) %>%
  na.omit() %>%
  mutate(date = ymd(paste("0000", month, day, sep = '-'))) %>%
  arrange(station_id, as.numeric(month), as.numeric(day))

devtools::use_data(ncdc_normals, overwrite = TRUE)
