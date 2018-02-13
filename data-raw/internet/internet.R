library(tidyverse)
library(here)

d <- read_csv(here("data-raw", "internet", "Internet user per 100.csv"), col_types = "ccccddddddddddddddddddddddddddd")

internet <- select(d, -country_code, -indicator, -indicator_code) %>%
  gather(year, users, -country) %>%
  mutate(year = as.numeric(year))

devtools::use_data(internet, overwrite = TRUE)
