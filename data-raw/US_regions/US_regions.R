# US regions and divisions downloaded from census.gov here:
#  https://www2.census.gov/geo/pdfs/maps-data/maps/reference/us_regdiv.pdf

# Two-letter abbreviations taken from here:
# https://pe.usps.com/text/pub28/28apb.htm

US_regions <- read.csv("data-raw/US_regions/US_regions.csv", stringsAsFactors = FALSE)
devtools::use_data(US_regions, overwrite = TRUE)
