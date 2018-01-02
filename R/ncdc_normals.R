#' Daily average temperature normals across the U.S.
#' 
#' This dataset provides daily average temperature normals from NOAA'S 1981-2010
#' climate normals dataset.
#' 
#' @source
#' ftp://ftp.ncdc.noaa.gov/pub/data/normals/1981-2010/
#' 
#' @examples 
#' library(lubridate)
#' 
#' temps <- filter(ncdc_normals,
#'                 station_id %in% c(
#'                   "USW00014819", # Chicago, IL 60638
#'                   "USC00516128", # Honolulu, HI 96813
#'                   "USW00027502", # Barrow, AK 99723, coldest point in the US
#'                   "USC00042319" # Death Valley, CA 92328 hottest point in the US
#'                 ))
#' 
#' ggplot(temps, aes(x = date, y = temperature, color = station_id)) +
#'   geom_line() +
#'   scale_x_date(name="date", expand=c(0, 0)) + 
#'   theme_minimal()
#' 
#' ggplot(temps, aes(x = date, y = temperature, color = station_id)) +
#'   geom_line() +
#'   scale_x_date(name="date", expand=c(0, 0)) + 
#'   scale_y_continuous(limits = c(-30, 110)) +
#'   theme_minimal() +
#'   coord_polar(theta = "x")
"ncdc_normals"