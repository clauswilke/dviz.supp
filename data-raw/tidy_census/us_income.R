library(tidycensus)
library(sf)
library(dplyr)
library(here)
library(ggplot2)

options(tigris_use_cache = TRUE)

## projections
# ESRI:102003
# https://epsg.io/102003
crs_lower48 <- "+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"

# EPSG:3338
# https://epsg.io/3338
crs_alaska <- "+proj=aea +lat_1=55 +lat_2=65 +lat_0=50 +lon_0=-154 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs "

# ESRI:102007
# https://epsg.io/102007
crs_hawaii <- "+proj=aea +lat_1=8 +lat_2=18 +lat_0=13 +lon_0=-157 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs"

## read shapefiles
# shapefiles from:
# https://www.census.gov/geo/maps-data/data/cbf/cbf_counties.html
us_counties_sp <- rgdal::readOGR(
  dsn = here::here("data-raw", "tidy_census", "US_shapes"),
  layer = "cb_2017_us_county_20m"
)

# aggregate individual counties into states
us_states_sp <- rgeos::gUnaryUnion(us_counties_sp, us_counties_sp$STATEFP)
# collect fips codes; they are the names of the objects after aggregation
us_states_sp$GEOID <- names(us_states_sp)
us_states_sp$GEOID <- as.character(us_states_sp$GEOID)
# convert to sf
us_states <- as(us_states_sp, "sf") %>%
  st_transform(crs_lower48) %>%
  filter(GEOID != "72") # remove Puerto Rico

us_lower48 <- filter(us_states, !GEOID %in% c("02", "15"))

## helper function to move geometries
place_geometry <- function(geometry, position, scale = 1) {
  (geometry - st_centroid(geometry)) * scale + 
    st_sfc(st_point(position))
}

bb <- st_bbox(us_lower48)

us_alaska <- filter(us_states, GEOID == "02")
# Alaska scaled down
us_alaska2 <- st_transform(us_alaska, crs_alaska)
st_geometry(us_alaska2) <- place_geometry(
  st_geometry(us_alaska2),
  c(bb$xmin + 0.08*(bb$xmax - bb$xmin),
    bb$ymin + 0.07*(bb$ymax - bb$ymin)),
  scale = 0.35
)
st_crs(us_alaska2) <- crs_lower48

# Alaska not scaled
us_alaska3 <- st_transform(us_alaska, crs_alaska)
st_geometry(us_alaska3) <- place_geometry(
  st_geometry(us_alaska3),
#  c(bb$xmin - 0.2*(bb$xmax - bb$xmin),
#    bb$ymin + 0.4*(bb$ymax - bb$ymin))
  c(bb$xmin + 0.2*(bb$xmax - bb$xmin),
    bb$ymin - 0.13*(bb$ymax - bb$ymin))
)
st_crs(us_alaska3) <- crs_lower48


us_hawaii <- filter(us_states, GEOID == "15")
us_hawaii2 <- st_transform(us_hawaii, crs_hawaii)
st_geometry(us_hawaii2) <- place_geometry(
  st_geometry(us_hawaii2),
  c(bb$xmin + 0.3*(bb$xmax - bb$xmin),
    bb$ymin + 0.*(bb$ymax - bb$ymin))
)
st_crs(us_hawaii2) <- crs_lower48

us_hawaii3 <- st_transform(us_hawaii, crs_hawaii)
st_geometry(us_hawaii3) <- place_geometry(
  st_geometry(us_hawaii3),
  c(bb$xmin + 0.7*(bb$xmax - bb$xmin),
    bb$ymin - 0.2*(bb$ymax - bb$ymin))
)
st_crs(us_hawaii3) <- crs_lower48

us_albers <- rbind(us_lower48, us_alaska2, us_hawaii2)
us_albers2 <- rbind(us_lower48, us_alaska3, us_hawaii3)

us_states_geoms <- list(
  lower48 = us_lower48,
  true_albers = us_states,
  us_albers = us_albers,
  albers_revised = us_albers2
)

devtools::use_data(us_states_geoms, overwrite = TRUE)

ggplot(us_lower48) + geom_sf(fill = "#56B4E9", color = "grey30", size = 0.3, alpha = 0.5)
ggplot(us_states) + geom_sf(fill = "#56B4E9", color = "grey30", size = 0.3, alpha = 0.5)
ggplot(us_albers) + geom_sf(fill = "#56B4E9", color = "grey30", size = 0.3, alpha = 0.5)
ggplot(us_albers2) + geom_sf(fill = "#56B4E9", color = "grey30", size = 0.3, alpha = 0.5)


##****************
## Median income
##****************

# get median income
income_acs <- get_acs(
  geography = "state", year = 2015,
  variables = "B19013_001", geometry = FALSE
) %>%
  rename(name = NAME, median_income = estimate, median_income_moe = moe) %>%
  select(-variable)

# get population
population_acs <- get_acs(
  geography = "state", year = 2015,
  variables = "B01003_001", geometry = FALSE
) %>%
  rename(name = NAME, population = estimate) %>% 
  select(-variable, -moe)

income_acs <- left_join(income_acs, population_acs)

left_join(us_albers2, income_acs) %>%
  ggplot(aes(fill = population)) + 
  geom_sf(color = "grey30", size = 0.3, alpha = 0.5) + 
  scale_fill_viridis_c()


library(cartogram)
us_albers2_cartogram <- cartogram_cont(left_join(us_albers2, income_acs), 'population')

p1 <- ggplot(left_join(us_albers2, income_acs), aes(fill = median_income)) + 
  geom_sf(color = "grey30", size = 0.3, alpha = 0.7) + 
  scale_fill_viridis_c()


p2 <- ggplot(us_albers2_cartogram, aes(fill = median_income)) + 
  geom_sf(color = "grey30", size = 0.3, alpha = 0.7) + 
  scale_fill_viridis_c()

cowplot::plot_grid(p1, p2, ncol = 1)

library(statebins)
filter(income_acs, name != "Puerto Rico") %>%
ggplot(aes(state = name, fill = median_income)) +
  geom_statebins(family = dviz.supp::dviz_font_family,
                 lbl_size = 14/.pt) +
  coord_equal() +
  scale_fill_viridis_c() +
  theme_statebins(base_family = dviz.supp::dviz_font_family)



