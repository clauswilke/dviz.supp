#' Median income in Texas counties
#' 
#' Median income in Texas counties, from the 2015 five-year American Community Survey.
#' 
#' @examples 
#' library(sf)
#' 
#' # B19013_001: Median household income in the past 12 months (in 2015 Inflation-adjusted dollars)
#' 
#' texas_income %>%
#'   ggplot(aes(fill = estimate)) + 
#'   geom_sf(color = "white") + 
#'   coord_sf(datum = NA) +
#'   theme_map() + 
#'   scale_fill_continuous_sequential(palette = "Teal", rev = TRUE, 
#'                                    na.value = "grey50", end = 0.9,
#'                                    name = "income",
#'                                    limits = c(18000, 90000),
#'                                    breaks = 20000*c(1:4),
#'                                    labels = c("$20,000", "$40,000", "$60,000", "$80,000")) +
#'   theme(legend.title.align = 0.5,
#'         legend.text.align = 0)
"texas_income"


#' Racial composition in Texas counties
#' 
#' Percent (`pct`) of White, Black, Asian, and Hispanic inhabitants in Texas counties.
#' Data were obtained from the 2010 decennial US Census.
#' 
#' @examples 
#' library(sf)
#' 
#' texas_race %>%
#' filter(variable == "White") %>%
#'   ggplot(aes(fill = pct)) +
#'   geom_sf(color = "white") +
#'   coord_sf(datum = NA) + 
#'   theme_map() +
#'   #scale_fill_continuous_diverging(palette = "Blue-Red 3", # uncomment for alternative color scale
#'   scale_fill_continuous_carto(palette = "Earth",
#'                               mid = 50,
#'                               limits = c(0, 100),
#'                               breaks = 25*(0:4),
#'                               name = "% White") +
#'   theme(legend.title.align = 0.5,
#'         legend.text.align = 0)
"texas_race"

#' Median income in Hawaii counties
#' 
#' Median income in Hawaii counties for 2010 and 2015, from the 2010 and 2015 five-year American Community Survey.
#' 
#' @examples 
#' hawaii_income_diff <- select(hawaii_income, -median_income_moe) %>%
#'   spread(year, median_income) %>%
#'   mutate(income_diff = `2015` - `2010`)
#' 
#' ggplot(hawaii_income_diff, aes(county, income_diff)) + geom_col()
"hawaii_income"
