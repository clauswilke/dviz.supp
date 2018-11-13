#' Calculate date-based moving average
#' 
#' This function calculates a vector moving averages based on moving date ranges. 
#' The result is a vector containing one average per input value, or `NA` if the
#' full range doesn't exist for a given input value. Not every day within a date
#' range needs to be present.
#' 
#' @param date Vector of dates
#' @param value Vector of values to average
#' @param range Number of days to average over
#' @param center Boolean, indicates whether the resulting average should
#'   be centered in the range (default) or placed at the end of the range
#' @examples
#' library(lubridate)
#' 
#' dow_jones_industrial %>% filter(date >= ymd("2009/01/01") & date <= ymd("2010/01/01")) %>%
#'   mutate(
#'     close_20d_ave = moving_ave(date, close, 20, center = FALSE),
#'     close_50d_ave = moving_ave(date, close, 50, center = FALSE),
#'     close_100d_ave = moving_ave(date, close, 100, center = FALSE)
#'   ) %>%
#'   ggplot(aes(date, close)) + 
#'   geom_line(aes(color = "closing"), size = .25) +
#'   geom_line(aes(date, close_20d_ave, color = "20d"), size = .75, na.rm = TRUE) +
#'   geom_line(aes(date, close_50d_ave, color = "50d"), size = .75, na.rm = TRUE) +
#'   geom_line(aes(date, close_100d_ave, color = "100d"), size = .75, na.rm = TRUE) +
#'   scale_color_manual(
#'     values = c(
#'       closing = "black", 
#'       `20d` = "#009e73",
#'       `50d` = "#d55e00",
#'       `100d` = "#0072b2"
#'     ),
#'     breaks = c("closing", "20d", "50d", "100d"),
#'     labels = c("closing price", "20 day average", "50 day average", "100 day average"),
#'     name = NULL,
#'     guide = guide_legend(override.aes = list(size = c(0.25, 0.75, 0.75, 0.75)))
#'   ) + 
#'   theme_dviz_grid()
#' 
#' # moving ave vs. LOESS (locally estimated scatterplot smoothing)
#' 
#' dow_jones_industrial %>% filter(date >= ymd("2009/01/01") & date <= ymd("2010/01/01")) %>%
#'   mutate(
#'     close_100d_ave = moving_ave(date, close, 100)
#'   ) %>%
#'   ggplot(aes(date, close)) + 
#'   geom_line(aes(color = "closing"), size = .25) +
#'   geom_line(aes(date, close_100d_ave, color = "100d"), size = .75, na.rm = TRUE) +
#'   geom_smooth(aes(color = "smooth"), size = .75, na.rm = TRUE, se = FALSE) +
#'   scale_color_manual(
#'     values = c(
#'       closing = "black", 
#'       `100d` = "#d55e00",
#'       smooth = "#0072b2"
#'     ),
#'     breaks = c("closing", "smooth", "100d"),
#'     labels = c("closing price", "LOESS smoother", "100 day average"),
#'     name = NULL,
#'     guide = guide_legend(override.aes = list(size = c(0.25, 0.75, 0.75)))
#'   ) + 
#'   theme_dviz_grid()
#' @export
moving_ave <- function(date, value, range, center = TRUE) {
  if (isTRUE(center)) {
    offset <- ceiling(range/2)
  } else {
    offset <- range
  }
  vapply(
    1:length(value),
    function(i, date, value) {
      focal_day <- date[i]
      first_day <- focal_day - offset + 1
      last_day <- focal_day - offset + range
      idx <- date >= first_day & date <= last_day
      if (head(date, 1L) > first_day || tail(date, 1L) < last_day) {
        NA_real_
      } else {
        mean(value[idx])
      }
    },
    double(1),
    date,
    value
  )
}




