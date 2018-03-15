#' Pad figure
#' 
#' Place whitespace to left and right of figure so that the figure spans the entire page width.
#' 
#' @export
pad_figure <- function(p, fig.width = 5.5, page.width = 8.5, unit = "in") {
  pad <- (page.width - fig.width)/2
  if (pad < 0) {
    stop("Cannot make figure wider than page width!")
  }
  
  if (pad == 0) return(p)
  ggdraw(gtable::gtable_row(name = NULL,
                    grobs = list(grid::nullGrob(), plot_to_gtable(p), grid::nullGrob()),
                    widths = grid::unit(c(1, fig.width, 1), c("null", unit, "null")),
                    height = grid::unit(1, "null")))
}
