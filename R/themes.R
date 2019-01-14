#' Themes for data viz book
#'
#' The themes used in the data visualization book. The default font for these
#' themes is Myriad Pro, which needs to be installed on the target system for
#' these themes to work.
#'
#' @param font_size Overall font size
#' @param font_family Font family for plot title, axis titles and labels, legend texts, etc.
#' @param line_size Line size for axis lines
#' @param rel_small Relative size of small text (e.g., axis tick labels)
#' @param rel_tiny Relative size of tiny text (e.g., caption)
#' @param rel_large Relative size of large text (e.g., title)
#' @export
theme_dviz_open <- function(font_size = 14, font_family = dviz_font_family, line_size = .5,
                          rel_small = 12/14, rel_tiny = 11/14, rel_large = 16/14) {
  half_line <- font_size / 2
  
  cowplot::theme_half_open(font_size = font_size, font_family = font_family, line_size = line_size,
                           rel_small = rel_small, rel_tiny = rel_tiny, rel_large = rel_large)  %+replace%
    theme(
      plot.margin = margin(half_line/2, 1.5, half_line/2, 1.5),
      complete = TRUE
    )
}

#' @rdname theme_dviz_open
#' @param colour Color of grid lines
#' @export
theme_dviz_grid <- function(font_size = 14, font_family = dviz_font_family, line_size = .5,
                            rel_small = 12/14, rel_tiny = 11/14, rel_large = 16/14,
                            colour = "grey90") {
  half_line <- font_size / 2
  
  cowplot::theme_minimal_grid(font_size = font_size, font_family = font_family, line_size = line_size,
                              rel_small = rel_small, rel_tiny = rel_tiny, rel_large = rel_large,
                              colour = colour)  %+replace%
    theme(
      plot.margin = margin(half_line/2, 1.5, half_line/2, 1.5),
      complete = TRUE
    )
}

#' @rdname theme_dviz_open
#' @export
theme_dviz_hgrid <- function(font_size = 14, font_family = dviz_font_family, line_size = .5,
                            rel_small = 12/14, rel_tiny = 11/14, rel_large = 16/14,
                            colour = "grey90") {
  half_line <- font_size / 2
  
  cowplot::theme_minimal_hgrid(font_size = font_size, font_family = font_family, line_size = line_size,
                              rel_small = rel_small, rel_tiny = rel_tiny, rel_large = rel_large,
                              colour = colour)  %+replace%
    theme(
      plot.margin = margin(half_line/2, 1.5, half_line/2, 1.5),
      complete = TRUE
    )
}

#' @rdname theme_dviz_open
#' @export
theme_dviz_vgrid <- function(font_size = 14, font_family = dviz_font_family, line_size = .5,
                            rel_small = 12/14, rel_tiny = 11/14, rel_large = 16/14,
                            colour = "grey90") {
  half_line <- font_size / 2
  
  cowplot::theme_minimal_vgrid(font_size = font_size, font_family = font_family, line_size = line_size,
                              rel_small = rel_small, rel_tiny = rel_tiny, rel_large = rel_large,
                              colour = colour)  %+replace%
    theme(
      plot.margin = margin(half_line/2, 1.5, half_line/2, 1.5),
      complete = TRUE
    )
}

#' @rdname theme_dviz_open
#' @export
theme_dviz_map <- function(font_size = 14, font_family = dviz_font_family, line_size = .5,
                            rel_small = 12/14, rel_tiny = 11/14, rel_large = 16/14) {
  half_line <- font_size / 2
  
  cowplot::theme_map(font_size = font_size, font_family = font_family, line_size = line_size,
                           rel_small = rel_small, rel_tiny = rel_tiny, rel_large = rel_large)  %+replace%
    theme(
      plot.margin = margin(half_line/2, 1.5, half_line/2, 1.5),
      complete = TRUE
    )
}
