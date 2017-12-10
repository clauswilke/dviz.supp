women_parliaments <- read.csv("data-raw/women_parliaments/women_tidy.csv", stringsAsFactors = FALSE)
devtools::use_data(women_parliaments, overwrite = TRUE)
