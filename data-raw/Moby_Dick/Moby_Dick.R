library(here)
library(readr)

Moby_Dick <- read_csv(here("data-raw", "Moby_Dick", "Moby_Dick_word_counts.csv"))

devtools::use_data(Moby_Dick, overwrite = TRUE)
