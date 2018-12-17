#' Ratings of chocolate bars
#' 
#' Ratings of almost 1800 bars of chocolate, collected by Brady Brelinski,
#' Founding Member of the Manhattan Chocolate Society.
#' 
#' @references
#' Manhattan Chocolate Society, \url{http://flavorsofcacao.com}
#' 
#' @examples
#' cacao %>% 
#'   mutate(location = fct_lump(location, 20)) %>%
#'   mutate(location = fct_relevel(location, "U.S.A.")) -> cacao_lumped
#' 
#' fit <- lm(rating ~ location, data = cacao_lumped)
#' summary(fit)
#' 
#' cacao_means <- group_by(cacao_lumped, location) %>%
#'   summarize(mean = mean(rating))
#' 
#' ggplot(cacao_lumped, aes(x = reorder(location, rating), y = rating)) + 
#'   geom_point(
#'     size = 0.2,
#'     alpha = 1,
#'     position = position_jitter(height = 0.02, width = 0.2)
#'   ) +
#'   geom_point(
#'     data = cacao_means,
#'     aes(location, mean),
#'     size = 2,
#'     color = "red"
#'   ) +
#'   coord_flip() +
#'   theme_dviz_grid()
"cacao"