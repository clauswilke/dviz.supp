#' Locations of wind turbines in the U.S.
#' 
#' Data were obtained from the United States Wind Turbine Database.
#'
#' @source
#' United States Wind Turbine Database (USWTDB)
#' \url{https://eerscmap.usgs.gov/uswtdb/data/}
#' @examples
#' library(sf)
#'
#' m <- cbind(wind_turbines$xlong, wind_turbines$ylat)
#' mproj <- rgdal::project(m, proj = "+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs")
#' wind_turbines$x <- mproj[,1]
#' wind_turbines$y <- mproj[,2]
#' 
#' lower48 <- us_states_geoms$lower48
#' ggplot(lower48) + 
#'   geom_sf(fill = "#56B4E9", color = "grey30", size = 0.3, alpha = 0.5) +
#'   geom_point(
#'     data = filter(wind_turbines, xlong > -130, ylat > 20),
#'     aes(x = x, y = y),
#'     color = "black",
#'     size = 0.1
#'   )
"wind_turbines"

#' Maps of the bay area in California
#' 
#' Map tiles obtained from maps.stamen.com and from openstreetmap.org.
#' @examples 
#' library(ggmap)
#' 
#' ggmap(sfbay_maps$sfbay_bg) + inset_ggmap(sfbay_maps$sfbay_lines)
#' ggmap(sfbay_maps$shiloh_osm)
"sfbay_maps"