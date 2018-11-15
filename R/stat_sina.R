#' ggplot2 stat that creates sina plots
#' 
#' This stat closely mirrors [`stat_ydensity()`] from ggplot2. This enables the
#' user to plot sina plots on top of violin plots and have them match perfectly.
#' 
#' @inheritParams ggplot2::layer
#' @inheritParams ggplot2::geom_point
#' @inheritParams ggplot2::stat_density
#' @param scale if "area" (default), all violins have the same area (before trimming
#'   the tails). If "count", areas are scaled proportionally to the number of
#'   observations. If "width", all violins have the same maximum width.
#' @seealso [geom_violin()]
#' @examples
#' ggplot(iris, aes(Species, Sepal.Length)) +
#'   geom_violin(color = NA) +
#'   stat_sina()
#' @export
stat_sina <- function(mapping = NULL, data = NULL,
                      geom = "point", position = "identity",
                      ...,
                      bw = "nrd0",
                      adjust = 1,
                      kernel = "gaussian",
                      trim = TRUE,
                      scale = "area",
                      na.rm = FALSE,
                      show.legend = NA,
                      inherit.aes = TRUE) {
  scale <- match.arg(scale, c("area", "count", "width"))
  
  layer(
    data = data,
    mapping = mapping,
    stat = StatSina,
    geom = geom,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(
      bw = bw,
      adjust = adjust,
      kernel = kernel,
      trim = trim,
      scale = scale,
      na.rm = na.rm,
      ...
    )
  )
}


#' @rdname stat_sina
#' @format NULL
#' @usage NULL
#' @export
StatSina <- ggproto("StatSina", Stat,
  required_aes = c("x", "y"),
  non_missing_aes = "weight",
  
  compute_group = function(data, scales, width = NULL, bw = "nrd0", adjust = 1,
                           kernel = "gaussian", trim = TRUE, na.rm = FALSE) {
    if (nrow(data) < 3) return(data.frame())
    range <- range(data$y, na.rm = TRUE)
    modifier <- if (trim) 0 else 3
    bw <- calc_bw(data$y, bw)
    dens <- ggplot2:::compute_density(data$y, data$w, from = range[1] - modifier*bw, to = range[2] + modifier*bw,
                            bw = bw, adjust = adjust, kernel = kernel)
    
    densf <- approxfun(dens$x, dens$density, rule = 2)
  
    # Compute width if x has multiple values
    if (length(unique(data$x)) > 1) {
      width <- diff(range(data$x)) * 0.9
    }
    data$width <- width
    
    data$density <- densf(data$y)
    data$x <- mean(range(data$x))
    
    data
  },
  
  compute_panel = function(self, data, scales, width = NULL, bw = "nrd0", adjust = 1,
                           kernel = "gaussian", trim = TRUE, na.rm = FALSE,
                           scale = "area") {
    data <- ggproto_parent(Stat, self)$compute_panel(
      data, scales, width = width, bw = bw, adjust = adjust, kernel = kernel,
      trim = trim, na.rm = na.rm
    )
    
    # choose how violins are scaled relative to each other
    data$violinwidth <- switch(scale,
      # area : keep the original densities but scale them to a max width of 1
      #        for plotting purposes only
      area = data$density / max(data$density),
      # count: use the original densities scaled to a maximum of 1 (as above)
      #        and then scale them according to the number of observations
      count = data$density / max(data$density) * data$n / max(data$n),
      # width: constant width (density scaled to a maximum of 1)
      width = data$scaled
    )
    
    data$x <- data$x + runif(nrow(data), min = -1, max = 1) *
      0.9*data$violinwidth/2
    
    data
  }
  
)

calc_bw <- function(x, bw) {
  if (is.character(bw)) {
    if (length(x) < 2)
      stop("need at least 2 points to select a bandwidth automatically", call. = FALSE)
    bw <- switch(
      tolower(bw),
      nrd0 = stats::bw.nrd0(x),
      nrd = stats::bw.nrd(x),
      ucv = stats::bw.ucv(x),
      bcv = stats::bw.bcv(x),
      sj = ,
      `sj-ste` = stats::bw.SJ(x, method = "ste"),
      `sj-dpi` = stats::bw.SJ(x, method = "dpi"),
      stop("unknown bandwidth rule")
    )
  }
  bw
}
