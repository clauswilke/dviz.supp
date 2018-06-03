#' CO2 emissions per capita (metric tons of CO2)
#'
#' Average CO2 emission in metric tons per person during the given year, calculated from deviding the total CO2 with the total population of the countries.
#' 
#' @source
#' CDIAC (Carbon Dioxide Information Analysis Center)
#' http://cdiac.ess-dive.lbl.gov/
#' 
#' Gapminder project, https://www.gapminder.org/
#' @examples 
#' CO2_emissions %>% filter(year %in% c(1970, 1980, 1990, 2000, 2010)) %>%
#'   spread(year, emissions) %>% na.omit() -> emissions_1970_2010
#' ggplot(emissions_1970_2010, aes(`1970`, `2010`)) + geom_point() + scale_x_log10() + scale_y_log10() +
#'   geom_abline(slope = 1)
#' 
#' emissions_1970_2010 %>% mutate(diff = `2010` - `1970`) %>%
#'   arrange(desc(abs(diff))) -> emissions_diff
#' 
#' emissions_diff[1:10,] %>% select(-diff) %>% 
#'   gather(year, emissions, `1970`:`2010`) %>%
#'   mutate(year = as.numeric(year)) -> emissions_top_ten
#' 
#' ggplot(emissions_top_ten, aes(x = year, y = emissions, group = country)) + geom_point() + geom_line()
#' 
#' CO2_2010 <- gather(emissions_1970_2010, year, emissions, `1970`:`2010`) %>%
#'   filter(year == "2010") %>%
#'   select(-year) %>%
#'   rename(emissions2010 = emissions) %>% top_n(20)
#' 
#' CO2_ref2010 <- filter(CO2_emissions, year %in% c(1970, 1980, 1990, 2000, 2010)) %>%
#'   right_join(CO2_2010)
#' 
#' ggplot(CO2_ref2010, aes(x = year, y = emissions, group = country, color = emissions2010)) + 
#'   geom_point() + geom_line() + scale_color_viridis_c(option = "E", begin = 0.2, end = 0.9)
"CO2_emissions"