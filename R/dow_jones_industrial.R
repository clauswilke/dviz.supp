#' Dow Jones industrial average
#' 
#' This dataset contains daily opening, high, low, and closing prices of the
#' Dow Jones Industrial Average from 1985 to 2018. Data was downloaded
#' from Yahoo finance on 11/7/2018.
#' 
#' @source
#' \url{finance.yahoo.com}
#' @examples
#' ggplot(dow_jones_industrial, aes(date, close)) + geom_line()
"dow_jones_industrial"
