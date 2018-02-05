library(here)
library(dplyr)
library(tidyr)
library(readr)

df_cpi <- read_delim(here("data-raw", "corruption", "CPI_raw.txt"),
                     delim = "\t", col_types = "iccccccc")

df_cpi %>% select(-`2016 Rank`) %>%
  gather(year, score, `2016 Score`:`2012 Score`) %>%
  extract(year, "year", regex = "(.+) Score") %>%
  mutate(year = as.numeric(year),
         score = as.numeric(score)) %>%
  rename(country = Country,
         region = Region,
         cpi = score) -> df_cpi_tidy


df_hdi <- read_csv(here("data-raw", "corruption", "HDI_raw.csv"),
                   col_types = "icd-d-d-d-d-d-d-d-d-d-d-d-d-d-d-d-d-d-d-d-d-d-d-d-d-d-")

df_hdi %>% select(-`HDI Rank (2015)`) %>%
  gather(year, score, `1990`:`2015`) %>%
  mutate(year = as.numeric(year)) %>%
  rename(country = Country,
         hdi = score) -> df_hdi_tidy

corruption <- left_join(df_cpi_tidy, df_hdi_tidy, by = c("country", "year")) %>%
  filter(year != 2016)  
devtools::use_data(corruption, overwrite = TRUE)
