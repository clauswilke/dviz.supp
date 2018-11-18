#' United States median income and population numbers per state
#' 
#' The data frame `us_income` provides median income, population number, and
#' population density for each state, as well as the state's geometry. The data
#' frame `us_income_cartogram` holds the same information but the geometries
#' have been adjusted so that their area is proportional to the population
#' number of the state.
#' 
#' Data was obtained from the US Census, 2015 ACS.
#' @examples
#' ggplot(US_income, aes(fill = population)) + 
#'   geom_sf(color = "grey30", size = 0.3, alpha = 0.5) + 
#'   scale_fill_viridis_c()
#' 
#' US_income %>% 
#'   filter(GEOID != "11") %>% # remove DC, since it has atypical population density
#'   mutate(popdens = as.numeric(popdens)) %>%
#'   ggplot(aes(fill = log(popdens))) + 
#'   geom_sf(color = "grey30", size = 0.3, alpha = 0.5) + 
#'   scale_fill_viridis_c()
#' 
#' ggplot(US_income, aes(fill = population)) + 
#'   geom_sf(color = "grey30", size = 0.3, alpha = 0.5) + 
#'   scale_fill_viridis_c()
#' 
#' p1 <- ggplot(US_income, aes(fill = median_income)) + 
#'   geom_sf(color = "grey30", size = 0.3, alpha = 0.7) + 
#'   scale_fill_viridis_c()
#' 
#' p2 <- ggplot(US_income_cartogram, aes(fill = median_income)) + 
#'   geom_sf(color = "grey30", size = 0.3, alpha = 0.7) + 
#'   scale_fill_viridis_c()
#' 
#' plot_grid(p1, p2, ncol = 1)
#' 
#' library(statebins)
#' filter(US_income, name != "Puerto Rico", GEOID != "11") %>%
#'   ggplot(aes(state = name, fill = median_income)) +
#'   geom_statebins(family = dviz.supp::dviz_font_family,
#'                  lbl_size = 14/.pt) +
#'   coord_equal() +
#'   scale_fill_viridis_c() +
#'   theme_statebins(base_family = dviz.supp::dviz_font_family)
"US_income"

#' @rdname US_income
"US_income_cartogram"


