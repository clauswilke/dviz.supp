library(dplyr)
library(tidyr)
library(readr)
library(here)

# tidy data
df <- read_csv(here("data-raw/BA_degrees/tabn322.10.csv"))

df %>% gather(year_str, count, -`Field of study`) %>%
  extract(`Field of study`, "field", regex = "(.*) \\.+") %>%
  extract(year_str, "year", regex = "(\\d+)-\\d+", remove = FALSE) %>%
  mutate(year = as.numeric(year) + 1) %>%
  group_by(year) %>%
  mutate(perc = count/sum(count)) %>%
  ungroup() -> BA_degrees

devtools::use_data(BA_degrees, overwrite = TRUE)
