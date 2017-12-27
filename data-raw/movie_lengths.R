library(ggplot2movies)
library(dplyr)

movie_lengths <- filter(movies, year > 1912) %>%
  select(length, year)

devtools::use_data(movie_lengths)
