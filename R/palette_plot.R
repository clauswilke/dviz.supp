#' Plot a palette of colors, with or without color labels
#' 
#' @param colors Vector of colors
#' @param label_size Size of the labels
#' @param print_color_labels Should labels be printed or not?
#' @examples
#' colors <- c("#E495A5", "#C7A76C", "#86B875", "#39BEB1", "#7DB0DD", "#CD99D8")
#' palette_plot(colors)
#' @importFrom ggplot2 aes geom_rect geom_text ggplot scale_fill_manual theme
#' @importFrom cowplot theme_nothing 
#' @importFrom grDevices col2rgb convertColor
#' @export
palette_plot <- function(colors, label_size = 6, print_color_labels = TRUE)
{
  
  if (length(print_color_labels)==1)
    print_color_labels <- rep(print_color_labels, length(colors))
  
  
  # find light and dark colors by converting to Lab space
  cols <- t(col2rgb(colors))
  m <- convertColor(cols, from = "sRGB", to = "Lab", scale.in = 255)
  light <- m[,1]>65
  
  # data frame of rectangles
  n <- length(colors)
  tiles <- data.frame(xmin=(0:(n-1)+.1)/n,
                      xmax=((1:n)-.1)/n,
                      x=(0:(n-1)+.5)/n,
                      ymin=rep(0, n),
                      ymax=rep(1, n),
                      y=rep(0.5, n),
                      color=factor(colors, levels=colors),
                      light=light)
  
  # code to appease CRAN check
  x <- xmin <- xmax <- y <- ymin <- ymax <- color <- NULL
  
  ggplot() +
    geom_rect(data=tiles, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax, fill=color)) +
    scale_fill_manual(values=colors) +
    geom_text(data=tiles[tiles$light & print_color_labels,], aes(x, y, label=color), color="black", size=label_size) +
    geom_text(data=tiles[!tiles$light & print_color_labels,], aes(x, y, label=color), color="white", size=label_size) +
    theme_nothing() + theme(legend.position = "none")
}
