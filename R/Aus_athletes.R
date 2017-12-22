#' Australian athletes
#' 
#' This dataset is equivalent to `ais` from the `DAAG` package.
#' 
#' @references 
#' Telford, R.D. and Cunningham, R.B. 1991. Sex, sport and body-size dependency of hematology in
#' highly trained athletes. Medicine and Science in Sports and Exercise 23: 788-794.
#' 
#' @examples 
#' library(dplyr)
#' library(ggplot2)
#' library(colorblindr)
#' 
#' male_Aus <- filter(Aus_athletes, sex=="m") %>%
#'   filter(sport %in% c("basketball", "field", "swimming", "track (400m)",
#'                       "track (sprint)", "water polo")) %>%
#'   mutate(sport = case_when(sport == "track (400m)" ~ "track",
#'                            sport == "track (sprint)" ~ "track",
#'                            TRUE ~ sport))
#' 
#' male_Aus$sport <- factor(male_Aus$sport,
#'   levels = c("field", "water polo", "basketball", "swimming", "track"))
#' 
#' ggplot(male_Aus, aes(x=height, y=pcBfat, color=sport, fill=sport, shape=sport)) +
#'   geom_point(size = 3) +
#'   scale_shape_manual(values = 21:25) +
#'   scale_color_OkabeIto(order=c(2, 1, 3, 4, 5), darken = 0.3) +
#'   scale_fill_OkabeIto(order=c(2, 1, 3, 4, 5), darken = 0.1, alpha = 0.5) +
#'   ylab("% bodyfat") +
#'   theme_minimal()
#' 
"Aus_athletes"