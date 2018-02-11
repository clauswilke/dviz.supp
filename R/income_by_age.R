#' U.S. median income by age
#' 
#' 2016 median income by age, and reported for all races and broken down by race. In general,
#' the non-exclusive data value (alone or in combination, "a.o.i.c.") was chosen.
#' 
#' @references
#' United States Census Bureau
#' 
#' Downloaded on 02/11/2018 from: https://www.census.gov/data/tables/time-series/demo/income-poverty/historical-income-households.html
#' @examples
#'
#' 
#' library(tidyverse)
#' 
#' income_by_age %>% filter(race == "all") %>%
#'   ggplot(aes(x = age, y = median_income)) +
#'     geom_col()
#'
#' income_by_age %>% filter(race == "all") %>%
#'   ggplot(aes(x = fct_reorder(age, desc(median_income)), y = median_income)) +
#'     geom_col()
#'
#' income_by_age %>% filter(race %in% c("white", "asian", "black", "hispanic")) %>%
#'   mutate(race = fct_relevel(race, c("asian", "white", "hispanic", "black"))) -> income_df
#' ggplot(income_df, aes(x = age, y = median_income, fill = race)) +
#'   geom_col(position = "dodge") +
#'   scale_fill_brewer(name = NULL) + theme_minimal_hgrid()
#'
#' ggplot(income_df, aes(x = race, y = median_income, fill = age)) +
#'   geom_col(position = "dodge") +
#'   scale_fill_brewer(name = NULL) + theme_minimal_hgrid()
#' 
#' ggplot(income_df, aes(x = age, y = median_income)) +
#'   geom_col(position = "dodge") +
#'   facet_wrap(~race) + theme_minimal_hgrid()
"income_by_age"




         