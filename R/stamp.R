#' Stamp plots with a label, such as good, bad, or ugly.
#' 
#' @param p The plot to stamp
#' @param color The color of the stamp
#' @param alpha Transparency level of the stamp
#' @param label The text label used for the stamp
#' @param family Font family
#' @param fontface Font face
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
stamp <- function(p, color, alpha, label, family = dviz_font_family_bold, fontface = "plain")
{
  ggdraw(p) +
    draw_text(paste0(label, "  "), x=1, y=1, vjust=1.1, hjust=1, size=16, angle = 0,
              color=color, alpha=alpha, family = family, fontface = fontface) +
    draw_line(c(1, 1), c(0, 1), size=2.8, color=color, alpha=alpha)
}

#' @rdname stamp
#' @export
stamp_good <- function(p) stamp(p, "olivedrab4", .7, "good")

#' @rdname stamp
#' @export
stamp_phantom <- function(p) stamp(p, "transparent", 0, "")

#' @rdname stamp
#' @export
stamp_bad <- function(p) stamp(p, "#d02138", 1, "bad")


#' @rdname stamp
#' @export
stamp_ugly <- function(p) stamp(p, "#DC9515", 1, "ugly")
