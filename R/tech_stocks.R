#' Stock prices of four major tech companies
#' 
#' This dataset contains several years of daily closing prices for four major
#' tech companies, Apple, Google, Microsoft, and Facebook. Data was downloaded
#' from Yahoo finance.
#' 
#' @source
#' \url{finance.yahoo.com}
#' @examples 
#' ggplot(tech_stocks, aes(x=date, y=price_indexed, color=ticker)) +
#'   geom_line() +
#'   scale_color_manual(values=c("#000000", "#E69F00", "#56B4E9", "#009E73"),
#'                      name="",
#'                      breaks=c("FB", "GOOG", "MSFT", "AAPL"),
#'                      labels=c("Facebook", "Alphabet", "Microsoft", "Apple")) +
#'   scale_x_date(name="year",
#'                limits=c(ymd("2012-06-01"), ymd("2017-05-31")),
#'                expand=c(0,0)) + 
#'   scale_y_continuous(name="stock price, indexed",
#'                      limits = c(0, 560),
#'                      expand=c(0,0)) +
#'   theme_minimal_hgrid()
"tech_stocks"
