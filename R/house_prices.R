#' House Price Index and unemployment, by state
#' 
#' This data set combines the Freddie Mac House Price Index with
#' unemployment data.
#' 
#' Data columns:
#' - `date` Date (year and month only)
#' - `state` The state
#' - `unemploy_perc` Unemployment, in percent
#' - `house_price_index` House Price Index, not seasonally adjusted
#' - `house_price_perc` Year-over-year percent change in House Price Index.
#' 
#' @source
#' House Price Index: \url{http://www.freddiemac.com/research/docs/states.xls}
#' 
#' Unemployment: \url{https://download.bls.gov/pub/time.series/la/la.txt}
#' 
#' @examples
#' library(lubridate)
#' ggplot(filter(house_prices, state == "California", year(date) > 2000),
#'        aes(unemploy_perc, house_price_perc)) + geom_path()
"house_prices"