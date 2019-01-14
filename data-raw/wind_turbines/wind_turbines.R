library(tidyverse)
library(ggmap)
source(here::here("data-raw", "wind_turbines", "get_osm_tiled_map.R"))

wind_turbines <- read_csv(here::here("data-raw", "wind_turbines", "us_wind.csv"))

devtools::use_data(wind_turbines, overwrite = TRUE)

sfbay_bbox <- c(left = -122.88, bottom = 37.20, right = -120.88, top = 38.31)
zoom <- 10

sfbay_bg <- get_stamenmap(sfbay_bbox, zoom = zoom, maptype = c("terrain-background"))
sfbay_labels <- get_stamenmap(sfbay_bbox, zoom = zoom, maptype = c("terrain-labels"))
sfbay_lines <- get_stamenmap(sfbay_bbox, zoom = zoom, maptype = c("terrain-lines"))

shiloh_bbox <- c(left = -121.9, bottom = 38.06, right = -121.71, top = 38.20)
zoom <- 12

shiloh_terrain <- get_stamenmap(shiloh_bbox, zoom = zoom, maptype = c("terrain"))
shiloh_osm <- get_osm_tiled_map(
  shiloh_bbox, zoom = zoom, base_url = "https://c.tile.openstreetmap.org/")

sf_bbox <- c(left = -122.54, bottom = 37.812, right = -122.47, top = 37.865)
zoom <- 14
sf_bg <- get_stamenmap(sf_bbox, zoom = zoom, maptype = c("terrain-background"))
sf_lines <- get_stamenmap(sf_bbox, zoom = zoom, maptype = c("terrain-lines"))

sfbay_maps <- list(
  sfbay_bg = sfbay_bg,
  sfbay_labels = sfbay_labels,
  sfbay_lines = sfbay_lines,
  shiloh_terrain = shiloh_terrain,
  shiloh_osm = shiloh_osm,
  sf_bg = sf_bg,
  sf_lines = sf_lines
)

devtools::use_data(sfbay_maps, overwrite = TRUE)
