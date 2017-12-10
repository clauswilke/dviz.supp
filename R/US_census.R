#' US census data at the county level
#' 
#' Data for 3143 counties in the United States. This dataset is equivalent to `countyComplete` from the `openintro` package.
#'
#' @examples
#' library(dplyr)
#' library(ggplot2)
#' 
#' data <- left_join(US_census, US_regions) %>%
#'  group_by(region, division, state) %>%
#'  summarize(pop2000 = sum(pop2000, na.rm = TRUE),
#'            pop2010 = sum(pop2010, na.rm = TRUE),
#'            popgrowth = (pop2010-pop2000)/pop2000,
#'            area = sum(area)) %>%
#'  arrange(popgrowth) %>%
#'  ungroup() %>%
#'  mutate(state = factor(state, levels = state),
#'         region = factor(region, levels = c("West", "South", "Midwest", "Northeast")))
#'
#'
#' ggplot(data, aes(x = state, y = popgrowth, fill = region)) + geom_col() + coord_flip()
#' @seealso [US_regions]
"US_census"