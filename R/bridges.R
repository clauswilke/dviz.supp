#' Pittsburgh bridges
#' 
#' Data on Pittsburgh bridges, collected by Yoram Reich and Steven J. Fenves, Carnegie Mellon University.
#' 
#' @references
#' Provided by the UCI Machine Learning Repository at: \url{https://archive.ics.uci.edu/ml/datasets/Pittsburgh+Bridges}
#' 
#' @examples
#' library(tidyverse)
#' 
#' select(bridges, MATERIAL, ERECTED) %>%
#'   table() %>% 
#'   reshape2::melt() %>% 
#'   ggplot(aes(ERECTED, value, fill = MATERIAL)) + geom_col(position = "stack")
"bridges"