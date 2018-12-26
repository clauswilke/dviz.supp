#' Ratings of chocolate bars
#' 
#' Ratings of almost 1800 bars of chocolate, collected by Brady Brelinski,
#' Founding Member of the Manhattan Chocolate Society. The data frame `cacao` provides the 
#' entire ratings database and the data frame `cacao_small` provides a reduced ratings dataset
#' that holds only ratings for locations Switzerland, Canada, Austria, U.S.A., Belgium, and Peru.
#' The object `cacao_mcmc` provides the result from a `rstanarm::stan_glm()` call
#' \[specifically `stan_glm(rating ~ location, prior = student_t(3, 0, 1))`\]
#' run on the `cacao_small` data frame.
#' 
#' @references
#' Manhattan Chocolate Society, \url{http://flavorsofcacao.com}
#' 
#' @examples
#' # Examples for full data set
#' library(tidyverse)
#' 
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
#'   
#' # Examples for stan_glm() result
#' library(emmeans)
#' library(tidybayes)
#' library(ggridges)
#' 
#' cacao_mcmc %>%
#'   emmeans( ~ location) %>%
#'   gather_emmeans_draws() %>%
#'   ggplot(aes(.value, reorder(location, .value))) +
#'   geom_density_ridges_gradient(
#'     aes(fill = stat(quantile)),
#'     color = NA,
#'     quantiles = c(0.005, 0.025, 0.1, 0.9, 0.975, 0.995),
#'     calc_ecdf = TRUE,
#'     scale = 0.9,
#'     rel_min_height = 0.005
#'   ) +
#'   stat_pointintervalh(.width = c(.8, .95, .99)) +
#'   scale_fill_manual(
#'     name = NULL,
#'     values = c(desaturate(lighten("#0072B2", c(.7, .5, .3, .1, .3, .5, .7)), .5)),
#'     breaks = c(4, 3, 2, 1),
#'     labels = c("80%", "95%", "99%", ">99%") 
#'   ) +
#'   theme_dviz_hgrid()
"cacao"

#' @rdname cacao
"cacao_mcmc"

#' @rdname cacao
"cacao_small"
