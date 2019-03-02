#' Make combined figure of color-vision deficiency simulations
#' 
#' The function `cvd_sim()` shows the original figure and three color-blind simulated versions. The function `cvd_sim2()`
#' only shows the color-blind simulated versions and adds a desaturated version also.
#' 
#' @param p The figure on which to perform the simulation
#' @param severity The severity of the simulation
#' @param label_x,label_y The x and y position of the labels relative to each figure
#' @param label_size The size of the labels
#' @param label_fontface The fontface of the labels
#' @param scale The scale reduction of the figures
#' @param hjust,vjust Label justification
#' @examples
#' 
#' viridis_scale <- gg_color_gradient(
#'   plot_margin = margin(12, 0, 0, 0),
#'   ymargin = 0.05
#' ) + scale_fill_viridis_c()
#' 
#' cvd_sim(viridis_scale)
#' cvd_sim2(viridis_scale)
#' @importFrom colorspace deutan protan tritan
#' @importFrom cowplot plot_grid
#' @importFrom colorblindr edit_colors
#' @export
cvd_sim <- function(p, severity = 1, scale = 0.9, hjust = 0, vjust = 1,
                    label_x = 0, label_y = 1, label_size = 14, label_fontface = "plain")
{
  deut <- function(c) deutan(c, severity)
  p1 <- edit_colors(p, deut)
  
  prot <- function(c) protan(c, severity)
  p2 <- edit_colors(p, prot)
  
  trit <- function(c) tritan(c, severity)
  p3 <- edit_colors(p, trit)
  
  plot_grid(
    p, NULL, p1,
    NULL, NULL, NULL,
    p2, NULL, p3,
    scale = 1, hjust = hjust, vjust = vjust,
    labels = c(
      "original", "", "deuteranomaly",
      "", "", "",
      "protanomaly", "", "tritanomaly"
    ),
    rel_widths = c(scale, 1-scale, scale),
    rel_heights = c(scale, 1-scale, scale),
    label_x = label_x, label_y = label_y, label_size = label_size,
    label_fontface = label_fontface
  )
}


#' @rdname cvd_sim
#' @export
cvd_sim2 <- function(p, severity = 1, scale = 0.9, hjust = 0, vjust = 1,
                     label_x = 0, label_y = 1, label_size = 14, label_fontface = "plain")
{
  deut <- function(c) deutan(c, severity)
  p1 <- edit_colors(p, deut)
  
  prot <- function(c) protan(c, severity)
  p2 <- edit_colors(p, prot)
  
  trit <- function(c) tritan(c, severity)
  p3 <- edit_colors(p, trit)
  
  desat <- function(c) desaturate(c, severity)
  p4 <- edit_colors(p, desat)
  
  plot_grid(
    p1, NULL, p2,
    NULL, NULL, NULL,
    p3, NULL, p4,
    scale = 1, hjust = hjust, vjust = vjust,
    labels = c(
      "deuteranomaly", "", "protanomaly",
      "", "", "",
      "tritanomaly", "", "desaturated"),
    rel_widths = c(scale, 1-scale, scale),
    rel_heights = c(scale, 1-scale, scale),
    label_x = label_x, label_y = label_y, label_size = label_size,
    label_fontface = label_fontface
  )
}