library(tidyverse)
library(here)

df <- read_csv(here("data-raw", "income_by_age", "income_by_age.csv"))

ggplot(df, aes(x = age, y = median_income)) +
  geom_col()

ggplot(df, aes(x = fct_reorder(age, desc(median_income)), y = median_income)) +
  geom_col()
