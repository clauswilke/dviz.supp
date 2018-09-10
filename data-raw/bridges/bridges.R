library(here)
library(tidyverse)

bridges <- read_csv(here("data-raw", "bridges", "bridges.version2.csv"))

devtools::use_data(bridges, overwrite = TRUE)
