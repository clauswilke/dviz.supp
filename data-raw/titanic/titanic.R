# File "Titanic.csv" downloaded on 12/10/2017 from 
# https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/datasets/Titanic.csv

library(dplyr)
read.csv("data-raw/titanic/Titanic.csv", stringsAsFactors = FALSE) %>%
  select(-X, -SexCode) %>%
  rename(name = Name, class = PClass, age = Age, sex = Sex, survived = Survived) -> titanic_all 
devtools::use_data(titanic_all, overwrite = TRUE)

titanic_all %>%
  select(-name) %>%
  na.omit() -> titanic
devtools::use_data(titanic, overwrite = TRUE)
