#' Stamp plots with a label, such as good, bad, or ugly.
#' 
#' @param p The plot to stamp
#' @param color The color of the stamp
#' @param alpha Transparency level of the stamp
#' @param label The text label used for the stamp
#' @examples
#' library(ggplot2)
#' 
#' p <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, 
#'                       color = factor(Petal.Width))) +
#'   geom_point()
#'   
#' stamp_bad(p + guides(color = "none"))
#' stamp_ugly(p)
#' @importFrom cowplot ggdraw draw_text draw_line
#' @export
stamp <- function(p, color, alpha, label)
{
  ggdraw(p) +
    draw_text(label, x=.99, y=1, vjust=-.6, hjust=1, size=16, color=color, alpha=alpha, angle=90) +
    draw_line(c(.99, .99), c(0, 1), size=1.4, color=color, alpha=alpha)
}

#' @rdname stamp
#' @export
#stamp_good <- function(p) stamp(p, "olivedrab4", .7, "good")
stamp_good <- function(p) stamp(p, "transparent", 0, "")

#' @rdname stamp
#' @export
stamp_bad <- function(p) stamp(p, "firebrick", .7, "bad")

#' @rdname stamp
#' @export
stamp_ugly <- function(p) stamp(p, "orange3", .7, "ugly")
