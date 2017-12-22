library(readr)
library(tidyr)
library(dplyr)
library(here)

df <- read_csv(here("data-raw", "women_parliaments", "women_wide.csv"))
gather(df, year, perc_women, `1960`:`2016`) %>%
  select(country = `Country Name`, country_code = `Country Code`, year, perc_women) %>%
  na.omit() %>%
  arrange(country, year) -> women_tidy

write.csv(women_tidy, here("data-raw", "women_parliaments", "women_tidy.csv"), row.names = FALSE)

women_parliaments <- read.csv(here("data-raw", "women_parliaments", "women_tidy.csv"), stringsAsFactors = FALSE)
devtools::use_data(women_parliaments, overwrite = TRUE)
