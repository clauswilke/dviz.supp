# US regions and divisions downloaded from census.gov here:
#  https://www2.census.gov/geo/pdfs/maps-data/maps/reference/us_regdiv.pdf

US_regions <- read.csv("data-raw/US_regions/US_regions.csv", stringsAsFactors = FALSE)
devtools::use_data(US_regions, overwrite = TRUE)
