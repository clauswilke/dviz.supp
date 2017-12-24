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
#' @export
label_log10 <- function(x) parse(text = paste0('10^', log10(x)))
