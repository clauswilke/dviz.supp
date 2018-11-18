#' Various projections of the states of the USA
#' 
#' All geometries were obtained from the US Census website (low resolution, 
#' 20m = 1:20,000,000) and subsequently processed as needed.
#' @source
#' Shapefiles from: \url{https://www.census.gov/geo/maps-data/data/cbf/cbf_counties.html}
#' 
#' @examples
#' library(ggplot2)
#' 
#' # lower 48 states only
#' ggplot(US_states_geoms$lower48) + geom_sf(fill = "#56B4E9", color = "grey30", size = 0.3, alpha = 0.5)
#' # true Albers projection, with AK and HI in their correct locations
#' ggplot(US_states_geoms$true_albers) + geom_sf(fill = "#56B4E9", color = "grey30", size = 0.3, alpha = 0.5)
#' # standard US Albers map, with AK artificially small
#' ggplot(US_states_geoms$us_albers) + geom_sf(fill = "#56B4E9", color = "grey30", size = 0.3, alpha = 0.5)
#' # revised US Albers map, with AK at its original size
#' ggplot(US_states_geoms$albers_revised) + geom_sf(fill = "#56B4E9", color = "grey30", size = 0.3, alpha = 0.5)
"US_states_geoms"