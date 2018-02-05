#' Corruption Perceptions Index (CPI) and Human Development Index (HDI)
#' 
#' Corruption Perceptions Index (CPI) and Human Development Index (HDI) for 176 countries,
#' from 2012 to 2015.
#' 
#' @references
#' Corruption Perceptions Index: \url{https://www.transparency.org/news/feature/corruption_perceptions_index_2016#table}
#' 
#' Human Development Index: \url{http://hdr.undp.org/en/data#}
#' 
#' Original figure idea: \url{https://www.economist.com/blogs/dailychart/2011/12/corruption-and-development}
#' 
#' @examples
#' library(dplyr)
#' library(ggplot2)
#'
#' corruption %>% filter(year == 2015) %>% na.omit() %>%
#'   ggplot(aes(cpi, hdi)) + geom_point(aes(color = region)) + 
#'   geom_smooth(method = 'lm', formula = y~log(x), se = FALSE) +
#'   scale_color_OkabeIto(name = NULL) +
#'   theme_minimal_hgrid() +
#'   theme(legend.position = "top")
"corruption"