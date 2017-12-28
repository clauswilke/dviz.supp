#' Draw labels in log-10 format
#' 
#' @param x The value to turn into a label
#' @examples
#' library(ggplot2)
#' 
#' ggplot(US_census, aes(pop2000, pop2010)) + 
#'   geom_point() + 
#'   scale_x_log10(labels = label_log10) +
#'   scale_y_log10(labels = label_log10)
#'   
#' # the function also works for linear scales
#' ggplot(US_census, aes(pop2000, pop2010)) + 
#'   geom_point() + 
#'   scale_x_continuous(limits = c(-1e6, 1e6), labels = label_log10) +
#'   scale_y_log10(labels = label_log10)
#' @export
label_log10 <- function(x) {
  NAs <- is.na(x)
  x[NAs] <- 1 # remove NAs
  neg <- x < 0
  x[neg] <- -1*x[neg] # remove negative numbers
  zero <- x == 0
  x[zero] <- 1 # remove zeros
  exp <- floor(log10(x))
  coef <- signif(x / 10^exp, 2)
  sign_str <- ifelse(neg, "-", "")
  zero_str <- ifelse(zero, "0", "")
  coef_str <- ifelse(coef == 1, "", paste0(coef, " %*% "))
  exp_str <- ifelse(zero, "", paste0("10^", exp))
  labels <- paste0(sign_str, zero_str, coef_str, exp_str)
  labels[NAs] <- "NULL"

  parse(text = labels)
}
