#' Various map polygons
#' 
#' All map polygons were obtained from the maps package (v3.3.0) via the 
#' function `maps:::map.poly()`.
#'
#' @examples
#' cenlat <- 35
#' cenlong <- -135
#' 
#' draw_ocean(cenlat, cenlong)
#' draw_land(map_polys$usa, cenlat, cenlong, col = "#FF0000B0") 
#' draw_land(map_polys$world_no_usa, cenlat, cenlong, col = "#C0C0C0B0")
#' @seealso [draw_land()]
"map_polys"