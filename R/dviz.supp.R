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

#' @noRd
#' @usage NULL
#' @export
dviz_font_family <- "Myriad Pro"

#' @noRd
#' @usage NULL
#' @export
dviz_font_family_bold <- "Myriad Pro Semibold"

#' @noRd
#' @usage NULL
#' @export
dviz_font_family_condensed <- "Myriad Pro Condensed"

#' @noRd
#' @usage NULL
#' @export
dviz_font_family_bold_condensed <- "Myriad Pro Bold Condensed"
