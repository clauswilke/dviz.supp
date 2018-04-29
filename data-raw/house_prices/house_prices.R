library(dplyr)
library(tidyr)
library(readr)
library(readxl)
library(lubridate)
library(here)

# unemployment rates
all_data <- read_tsv(here::here("data-raw", "house_prices", "la.data.1.CurrentS"))

ur_series <- read_tsv(here::here("data-raw", "house_prices", "la.series"))
ur_series <- ur_series %>% 
  filter(area_type_code == "A" &   # get states
         measure_code == "03"  &    # get unemployment rate
         seasonal == "S") %>%      # get seasonally adjusted data
  select(series_id, area_code, series_title)

# extract specific series from all data, create date column
ur_data <- left_join(ur_series, all_data) %>%
  mutate(date = ymd(paste0(year, substr(period, 2, 3), "01")))

# area names
ur_area <- read_tsv(here::here("data-raw", "house_prices", "la.area"), skip = 1,
                    col_names = c("area_type_code", "area_code", "area_text",
                                  "display_level", "selectable", "sort_sequence",
                                  "blank")) %>%
  select(area_code, area_text)
ur_data <- left_join(ur_data, ur_area) %>%
  select(date, area_text, value) %>%
  rename(state = area_text, unemploy_perc = value)

# housing prices
hpi <- read_excel(here::here("data-raw", "house_prices", "states.xls"), 
                  sheet = "State Indices",
                  range="A6:AZ522" ) %>%
  extract(Month, c("year", "month"), "(\\d+)M(\\d+)") %>%
  mutate(date = ymd(paste0(year, month, "01"))) %>%
  select(-year, -month) %>%
  gather(statecode, hpi, -date)

states <- read_tsv(here::here("data-raw", "house_prices", "region.txt"))

hpi <- left_join(hpi, states) %>%
  select(date, statename, hpi) %>%
  mutate(hpa = hpi/lag(hpi, 12) - 1) %>%
  rename(state = statename, house_price_index = hpi, house_price_perc = hpa) %>%
  na.omit()

house_prices <- inner_join(ur_data, hpi)

devtools::use_data(house_prices, overwrite = TRUE)
