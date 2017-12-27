#' Lengths of movies released between 1913 and 2005
#' 
#' This is a subset of the `movies` dataset provided by the ggplot2movies package. It has been filtered
#' to the years 1913 to 2005 and it only contains the length and the year for each movie.
#' 
#' @examples 
#' library(ggridges)
#' 
#' ggplot(movie_lengths, aes(x = length, y = year, group = year)) +
#'   geom_density_ridges(scale = 10, size = 0.25, rel_min_height = 0.03, fill = "grey85") +
#'   theme_ridges(center = TRUE) +
#'   scale_x_continuous(limits = c(0, 200), expand = c(0, 0), name = "length (minutes)") +
#'   scale_y_reverse(breaks = c(2000, 1980, 1960, 1940, 1920),
#'                   limits = c(2005, 1903), expand = c(0, 0))
"movie_lengths"