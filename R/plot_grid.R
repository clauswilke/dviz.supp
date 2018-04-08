#' Arrange plots in a grid.
#' 
#' Like [`cowplot::plot_grid()`], but with defaults modified.
#' @usage NULL
#' @export
plot_grid <- function(..., label_fontfamily = dviz_font_family,
                      label_fontface = "plain", hjust = 0, vjust = 1) {
  cowplot::plot_grid(..., label_fontfamily = label_fontfamily,
                     label_fontface = label_fontface,
                     hjust = hjust, vjust = vjust)
}