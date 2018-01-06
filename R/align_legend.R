#' Align the legend keys relative to the legend title
#'
#' @param p The plot on which the legend should be aligned
#' @param hjust Horizontal alignment parameter. 0 means left-aligned, 0.5 centered, and 1 right-aligned.
#' @return A `gtable` object.
#' @examples
#' # single legend
#' p <- ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Petal.Width)) + geom_point()
#' ggdraw(align_legend(p)) # centered
#' ggdraw(align_legend(p), hjust = 1) # right aligned
#' 
#' # multiple legends
#' p2 <- ggplot(mtcars, aes(disp, mpg, fill = hp, shape = factor(cyl), size = wt)) + 
#'   geom_point(color = "white") +
#'   scale_shape_manual(values = c(23, 24, 21), name = "cylinders") +
#'   scale_fill_continuous_carto(palette = "Emrld", name = "power (hp)", breaks = c(100, 200, 300)) +
#'   xlab("displacement (cu. in.)") +
#'   ylab("fuel efficiency (mpg)") +
#'   guides(shape = guide_legend(override.aes = list(size = 4, fill = "#329D84")),
#'          size = guide_legend(override.aes = list(shape = 21, fill = "#329D84"),
#'                              title = "weight (1000 lbs)")) +
#'   theme_half_open() + background_grid()
#'
#' # works but maybe not the expected result
#' ggdraw(align_legend(p2))
#' 
#' # more sensible layout
#' ggdraw(align_legend(p2 + theme(legend.position = "top", legend.direction = "vertical")))
#' @export
align_legend <- function(p, hjust = 0.5)
{
  # extract legend
  g <- cowplot::plot_to_gtable(p)
  grobs <- g$grobs
  legend_index <- which(sapply(grobs, function(x) x$name) == "guide-box")
  legend <- grobs[[legend_index]]

  # extract guides table
  guides_index <- which(sapply(legend$grobs, function(x) x$name) == "layout")

  # there can be multiple guides within one legend box  
  for (gi in guides_index) {
    guides <- legend$grobs[[gi]]
    
    # add extra column for spacing
    # guides$width[5] is the extra spacing from the end of the legend text
    # to the end of the legend title. If we instead distribute it by `hjust:(1-hjust)` on
    # both sides, we get an aligned legend
    spacing <- guides$width[5]
    guides <- gtable::gtable_add_cols(guides, hjust*spacing, 1)
    guides$widths[6] <- (1-hjust)*spacing
    title_index <- guides$layout$name == "title"
    guides$layout$l[title_index] <- 2

    # reconstruct guides and write back
    legend$grobs[[gi]] <- guides
  }
  
  # reconstruct legend and write back
  g$grobs[[legend_index]] <- legend
  g
}
