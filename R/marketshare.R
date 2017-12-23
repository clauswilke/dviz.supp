#' Fictitional marketshare of five companies
#' 
#' Fictitional marketshare of five companies, made up to demonstrate how pie charts can be misleading.
#' 
#' @references
#' Source: \url{https://en.wikipedia.org/wiki/File:Piecharts.svg}
#' 
#' @examples
#' library(dplyr)
#' library(ggplot2)
#' library(ggforce)
#' library(colorblindr)
#' 
#' # calculate the start and end angles for each pie
#' market_pie <- marketshare %>%
#'   group_by(year) %>%
#'   mutate(total = sum(percent),
#'          end_angle = 2*pi*cumsum(percent)/total,      # ending angle for each pie slice
#'          start_angle = lag(end_angle, default = 0),   # starting angle for each pie slice
#'          mid_angle = 0.5*(start_angle + end_angle),   # middle of each pie slice, for the text label
#'          hjust = ifelse(mid_angle>pi, 1, 0),
#'          vjust = ifelse(mid_angle<pi/2 | mid_angle>3*pi/2, 0, 1))
#' 
#' rpie = 1
#' rlabel = 1.05 * rpie
#' 
#' ggplot(market_pie) + 
#'   geom_arc_bar(aes(x0 = 0, y0 = 0, r0 = 0, r = rpie,
#'                    start = start_angle, end = end_angle, fill = company), color = NA) +
#'   geom_text(aes(x = rlabel*sin(mid_angle), y = rlabel*cos(mid_angle), label = company,
#'                 hjust = hjust, vjust = vjust)) +
#'   coord_fixed() +
#'   facet_wrap(~year) +
#'   scale_x_continuous(limits = c(-1.2, 1.2), expand = c(0, 0), name = "", breaks = NULL, labels = NULL) +
#'   scale_y_continuous(limits = c(-1.2, 1.2), expand = c(0, 0),name = "", breaks = NULL, labels = NULL) +
#'   scale_fill_OkabeIto(order = c(1:3, 5, 4)) + 
#'   guides(fill = "none") +
#'   theme_void()
"marketshare"