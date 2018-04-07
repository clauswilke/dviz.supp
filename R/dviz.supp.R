#' dviz.supp
#'
#' Supporting materials for Claus Wilke's data visualization book.
#' @name dviz.supp
#' @docType package
#' @import dplyr
#' @import cowplot
#' @import colorspace
#' @import colorblindr
NULL


# *************************************************
#                     Setup
# *************************************************

.onAttach <- function(libname, pkgname) {
  # switch the cowplot null device
  cowplot::set_null_device("png")
}