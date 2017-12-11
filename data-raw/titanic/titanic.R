data(Titanic, package = "Stat2Data")

library(dplyr)

Titanic %>%
  select(-SexCode) %>%
  rename(name = Name, class = PClass, age = Age, sex = Sex, survived = Survived) %>%
  mutate(name = as.character(name),
         class = as.character(class),
         sex = as.character(sex)) -> titanic_all 
devtools::use_data(titanic_all, overwrite = TRUE)

titanic_all %>%
  select(-name) %>%
  na.omit() -> titanic
devtools::use_data(titanic, overwrite = TRUE)
