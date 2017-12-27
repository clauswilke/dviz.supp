#' Flight delays for flights departing Newark airport in 2013
#' 
#' This is a subset of the `flights` dataset provided by the `nycflights13` package. It has been filtered
#' to contain only departures from "EWR" and it only contains the departure time and departure delay of
#' each flight. Flights with delay time of `NA` have been removed.
#'   
#' @examples 
#' library(lubridate)
#' 
#' # break points along the x axis
#' breaks_x <- c("0:00", "6:00", "12:00", "18:00", "24:00")
#' 
#' ggplot(flight_delays, aes(`departure time`, `departure delay (minutes)`)) + 
#'   geom_abline(slope = 0, intercept = 0, color="grey80") +
#'   geom_bin2d(bins = 50) +
#'   scale_fill_distiller(type = 'seq', palette = 'YlGnBu') +
#'   scale_x_time(breaks = hm(breaks_x),
#'                labels = breaks_x) +
#'   theme_half_open()
"flight_delays"