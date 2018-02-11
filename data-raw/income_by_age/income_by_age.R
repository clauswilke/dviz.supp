library(tidyverse)
library(here)

income_by_age <- read_csv(here("data-raw", "income_by_age", "income_by_age.csv"))

income_by_age <- income_by_age %>% 
  mutate(age = fct_recode(age, "> 74" = "75 and over"),
         age = fct_relevel(age, c("15 to 24", "25 to 34", "35 to 44", "45 to 54",
                                  "55 to 64", "65 to 74", "> 74")))

devtools::use_data(income_by_age, overwrite = TRUE)
