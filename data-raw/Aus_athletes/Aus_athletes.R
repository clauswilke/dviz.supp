library(DAAG)
library(dplyr)

DAAG::ais %>% mutate(sp = as.character(sport)) %>%
  mutate(sport = case_when(sp=="B_Ball" ~ "basketball",
                           sp=="Field" ~ "field",
                           sp=="Gym" ~ "gymnastics",
                           sp=="Netball" ~ "netball",
                           sp=="Row" ~ "rowing",
                           sp=="Swim" ~ "swimming",
                           sp=="T_400m" ~ "track (400m)",
                           sp=="T_Sprnt" ~ "track (sprint)",
                           sp=="Tennis" ~ "tennis",
                           sp=="W_Polo" ~ "water polo")) %>%
  select(-sp) %>%
  rename(height = ht,
         weight = wt) -> Aus_athletes

devtools::use_data(Aus_athletes, overwrite = TRUE)
