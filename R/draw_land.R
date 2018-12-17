#' Draw land masses in orthographic projection
#' 
#' The function `draw_land()` draws a set of polygons representing land masses.
#' The function `draw_ocean()` draws the ocean background and graticules.
#' @param coord Dataframe holding polygon coordinates in columns x and y, representing
#'   longitude and latitude. Polygons are separated by rows of NA.
#' @param cenlat Center latitude of projected earth.
#' @param cenlong Center longitude of projected earth.
#' @param xlim,ylim Limits of the enclosing plot. The actual earth is projected
#'   from -1 to 1 in x and y.
#' @param col Land or ocean color.
#' @param bg_col Background color.
#' @param line_col Line color.
#' @param lwd Line width. 
#' @examples
#' # static plot
#' world <- map_polys$world
#' cenlat <- 45
#' cenlong <- 0
#' draw_ocean(cenlat, cenlong)
#' draw_land(world, cenlat, cenlong)
#' 
#' \dontrun{
#' # animation
#' makeplot <- function() {
#'   cenlat <- 35
#'   by <- 2
#'   longs <- seq(-180, 180-by, by = by)
#'   for (cenlong in longs) {
#'     draw_ocean(cenlat, cenlong)
#'     draw_land(map_polys$usa, cenlat, cenlong, col = "#FF0000B0") 
#'     draw_land(map_polys$world_no_usa, cenlat, cenlong, col = "#C0C0C0B0")
#'   }
#' }
#' gifski::save_gif(makeplot(), "world.gif", delay = 1/24, 500, 500)
#' }
#' @seealso [map_polys]
#' @export
draw_land <- function(coord, cenlat = 40, cenlong = 15, xlim = c(-1.2, 1.2), ylim = c(-1.2, 1.2),
                      col = "#E69F00B0", bg_col = "white", line_col = "black", lwd = 0.5) {
  # There is not good solution in R to draw a map in orthographic projection, because some polygons aren't closed
  # properly.
  #
  # The solution here is to draw all elements manually, inspired by this stackoverflow post:
  # https://stackoverflow.com/questions/35911452/clipping-polygons-when-drawing-world-map-in-orthographic-projection
  
  # project coordinates
  coordtr <- orthproj(coord$y, coord$x, cenlat, cenlong)
  
  # draw polygons representing land masses
  naloc <- (1:nrow(coordtr))[!complete.cases(coordtr)]
  naloc <- c(0, naloc, nrow(coordtr) + 1)
  for(i in 2:length(naloc)){
    # extract polygon
    thispoly <- coordtr[(naloc[i-1]+1):(naloc[i]-1), ]
    
    unq <- unique(thispoly$front)
    if (length(unq) == 1){ 
      if (unq == TRUE){ # polygon is fully on front side
        polygon(thispoly$x, thispoly$y, col = col, border = line_col, lwd = lwd)
      }
    } else { #front and back present
      ind <- !thispoly$front
      
      # reproject project points to outside the globe
      d <- sqrt(thispoly[ind, ]$x^2 + thispoly[ind, ]$y^2)
      thispoly$x[ind] <- thispoly$x[ind]*1.05/d
      thispoly$y[ind] <- thispoly$y[ind]*1.05/d
      polygon(thispoly$x, thispoly$y, col = col, border = line_col, lwd = lwd)
    }
  }
  
  # draw white square with hole to cover up points outside the globe
  polypath(
    c(xlim[1], xlim[2], xlim[2], xlim[1], NA, sin(seq(0, 2*pi, length.out=100))),
    c(ylim[2], ylim[2], ylim[1], ylim[1], NA, cos(seq(0, 2*pi, length.out=100))), 
    col = bg_col, border = bg_col, lwd = 1, rule = "evenodd"
  )
}

#' @rdname draw_land
#' @export
draw_ocean <- function(cenlat = 40, cenlong = 15, xlim = c(-1.2, 1.2), ylim = c(-1.2, 1.2),
                       col = "#56B4E950", line_col = "grey30", lwd = 0.5) {
  # setup plotting area
  par(mar = c(0, 0, 0, 0))
  par(oma = c(0, 0, 0, 0))
  plot.new()
  plot.window(xlim = xlim, ylim = ylim, asp = 1, xaxs = "i", yaxs = "i")
  
  # draw a circle for coloring the ocean 
  polypath(
    sin(seq(0, 2*pi, length.out=100)),
    cos(seq(0, 2*pi, length.out=100)), 
    col = col, border = NA
  )
  
  # draw graticule
  df <- expand.grid(lat = c(seq(-90, 90, length.out = 100), NA), long = seq(-180, 150, by = 30))
  grat <- orthproj(df$lat, df$long, cenlat, cenlong, remove_back = TRUE)
  lines(grat$x, grat$y, col = line_col, lwd = lwd)
  df <- expand.grid(long = c(seq(-180, 180, length.out = 100), NA), lat = seq(-75, 75, by = 15))
  grat <- orthproj(df$lat, df$long, cenlat, cenlong, remove_back = TRUE)
  lines(grat$x, grat$y, col = line_col, lwd = lwd)
}


#' Project lat/long to x-y in orthographic projection.
#' 
#' This function projects latitude/longitude to an x--y plane (with ranges -1 to 1) using
#' an orthographic projection. It also determines whether points are in the front or at the
#' back of the globe, and it can remove the back.
#' 
#' @param lat Vector of latitudes, in degrees.
#' @param long Vector of longitudes, in degrees
#' @param cenlat Center latitude of projected earth.
#' @param cenlong Center longitude of projected earth.
#' @param remove_back Boolean indicating whether the back of the globe
#'   should be removed.
#' @export
orthproj <- function(lat, long, cenlat, cenlong, remove_back = FALSE){
  # convert degrees to radians
  d2r <- pi/180
  lat <- lat*d2r
  long <- long*d2r
  cenlat <- cenlat*d2r
  cenlong <- cenlong*d2r
  
  # project to x and y
  x <- cos(lat)*sin(long-cenlong)
  y <- cos(cenlat)*sin(lat)-sin(cenlat)*cos(lat)*cos(long-cenlong)
  
  # deterime whether point is on the front of the globe
  front <- sin(cenlat)*sin(lat)+cos(cenlat)*cos(lat)*cos(long-cenlong) > 0
  
  # remove back of the globe if requested
  if (remove_back) {
    x[!front] <- NA
    y[!front] <- NA
  }
  tibble(x = x, y = y, front = front)
}
