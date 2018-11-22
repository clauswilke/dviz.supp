#' Monthly CO2 concentrations in parts per million (ppm)
#' 
#' This data set provides monthly mean CO2 concentrations measured 
#' at Mauna Loa.
#'
#' @references 
#' Dr. Pieter Tans, NOAA/ESRL (\url{https://www.esrl.noaa.gov/gmd/ccgg/trends/}) 
#' and Dr. Ralph Keeling, Scripps Institution of Oceanography (\url{http://scrippsco2.ucsd.edu/}).
#' @source
#' \url{ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_mm_mlo.txt}
#' @examples
#' # use complete years only
#' CO2_complete <- filter(CO2, year >= 1959, year < 2018)
#' # convert to time series object
#' CO2_ts <- ts(data = CO2_complete$co2_interp, start = 1959, end = c(2017, 12), frequency = 12)
#' # detrend via STL method
#' CO2_stl <- stl(CO2_ts, s.window = 7)
#' CO2_detrended <- mutate(
#'   CO2_complete,
#'   seasonal = t(CO2_stl$time.series)[1, ],
#'   trend = t(CO2_stl$time.series)[2, ],
#'   remainder = t(CO2_stl$time.series)[3, ]
#' )
#' 
#' # plot
#' p1 <- ggplot(CO2_detrended, aes(date_dec, co2_interp)) + 
#'   geom_line()
#' p2 <- ggplot(CO2_detrended, aes(date_dec, seasonal)) + 
#'   geom_line()
#' p3 <- ggplot(CO2_detrended, aes(date_dec, trend)) + 
#'   geom_line()
#' p4 <- ggplot(CO2_detrended, aes(date_dec, remainder)) + 
#'   geom_line()
#' 
#' plot_grid(p1, p2, p3, p4, ncol = 1, align = 'v')
"CO2"
