library(dplyr)
library(tidyr)
library(lubridate)
library(readr)
library(here)

# file preprint_data.txt downloaded from:
# https://raw.githubusercontent.com/OmnesRes/prepub/master/analyses/preprint_data.txt
# data source: Jordan Anaya, http://www.prepubmed.org/
df <- read_tsv(here("data-raw", "preprints", "preprint_data.txt"))

# remove last column, it doesn't contain data
df <- df[,-ncol(df)]

# rename first column
names(df)[1] <- "archive"

df %>% gather(date, count, -archive) %>% 
  mutate(date = ymd(paste0(date, "-1"))) -> preprint_growth

devtools::use_data(preprint_growth, overwrite = TRUE)
