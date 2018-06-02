#' Random variates with specific correlation coefficients
#'
#' This dataset contains six sets of 50 x-y pairs with correlation coefficients
#' 0.2, 0.6, 0.9, -0.2, -0.6, -0.9. Each x and y variable is drawn from a standard
#' normal distribution. 
#' 
#' @examples 
#' ggplot(correlation_examples, aes(x, y)) + 
#'   geom_point() + facet_wrap(~r)
"correlation_examples"