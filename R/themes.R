#' Half-open theme
#' 
#' Plain theme with left and bottom axis lines and no grid lines.
#' 
#' @param font_size Theme font size
#' @param font_family Theme font family
#' @param line_size Theme line size
#' @export
theme_half_open <- function(font_size = 14, font_family = "", line_size = 0.5){
  theme_cowplot(font_size = font_size, font_family = font_family, line_size = line_size)
}

#' Theme with horizontal grid lines
#' 
#' Minimal theme with horizontal grid lines. Useful for plots where the main
#' comparison of interest happens along the y axis.
#' 
#' @param font_size Theme font size
#' @param font_family Theme font family
#' @param line_size Theme line size
#' @export
theme_minimal_hgrid <- function(font_size = 14, font_family = "", line_size = 0.5) {
  color = "grey90"

  # Starts with theme_cowplot and then modify some parts
  theme_cowplot(font_size = font_size, font_family = font_family, line_size = line_size) %+replace%
    theme(
      # make horizontal grid lines
      panel.grid.major   = element_line(colour = color,
                                        size = line_size),
      panel.grid.major.x = element_blank(),

      # adjust axis tickmarks
      axis.ticks        = element_line(colour = color, size = line_size),

      # adjust x axis
      axis.line.x       = element_line(colour = color, size = line_size),
      # no y axis line
      axis.line.y       = element_blank()
      )
}

#' Theme with vertical grid lines
#' 
#' Minimal theme with vertical grid lines. Useful for plots where the main
#' comparison of interest happens along the x axis.
#' 
#' @param font_size Theme font size
#' @param font_family Theme font family
#' @param line_size Theme line size
#' @export
theme_minimal_vgrid <- function(font_size = 14, font_family = "", line_size = 0.5) {
  color = "grey90"

  # Starts with theme_cowplot and then modify some parts
  theme_cowplot(font_size = font_size, font_family = font_family, line_size = line_size) %+replace%
    theme(
      # make vertical grid lines
      panel.grid.major   = element_line(colour = color,
                                        size = line_size),
      panel.grid.major.y = element_blank(),

      # adjust axis tickmarks
      axis.ticks        = element_line(colour = color, size = line_size),

      # adjust y axis
      axis.line.y       = element_line(colour = color, size = line_size),
      # no x axis line
      axis.line.x       = element_blank()
    )
}

#' Theme with horizontal and vertical grid lines
#' 
#' Minimal theme with horizontal and vertical grid lines.
#' 
#' @param font_size Theme font size
#' @param font_family Theme font family
#' @param line_size Theme line size
#' @export
theme_minimal_grid <- function(font_size = 14, font_family = "", line_size = 0.5) {
  color = "grey90"
  line_size = 0.5

  # Starts with theme_cowplot and then modify some parts
  theme_cowplot(font_size = font_size, font_family = font_family, line_size = line_size) %+replace%
    theme(
      # make horizontal grid lines
      panel.grid.major   = element_line(colour = color,
                                        size = line_size),

      # adjust axis tickmarks
      axis.ticks        = element_line(colour = color, size = line_size),

      # no x or y axis lines
      axis.line.x       = element_blank(),
      axis.line.y       = element_blank(),
    )
}

