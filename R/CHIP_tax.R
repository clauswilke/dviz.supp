#' Cost of CHIP vs costs of major provisions in 2017 US tax bill
#' 
#' Cost of the Children's Health Insurance Program (CHIP) for five years compared
#' to the costs of major provisions in the 2017 US tax bill. Note that the latter
#' costs are calculated over 10 years, not over five. The data were obtained from
#' an article in VOX (see References).
#' 
#' @references
#' Source: \url{https://www.vox.com/policy-and-politics/2017/12/21/16803312/chip-extension-congress-tax-cuts-obamacare-repeal}
#' 
#' @examples
#' library(ggforce)
#' library(dplyr)
#' 
#' chip_df <- mutate(CHIP_tax,
#'                   r = 2*sqrt(amount)/sqrt(max(amount)),
#'                   x = c(0.1, 3, 5.5, 5.8),
#'                   y = c(0.2, 2, 4, 2.2))
#' 
#' amount_df <- mutate(chip_df,
#'                     label = c("$8 billion", "$1.3 trillion", "$415\nbillion", "$83 \nbillion"),
#'                     xa = x + r * c(1.5, 0, 0, 0),
#'                     ya = y + r * c(0, -.1, -.25, 0),
#'                     size = c(18, 24, 18, 18)/.pt,
#'                     hjust = c(0, 0.5, 0.5, 0.5))
#'
#' purpose_df <- mutate(amount_df,
#'                      label = c("Extend CHIP\nfor five years", "Cut the corporate tax\nrate to 21 percent",
#'                                "Cut pass-through\nbusiness taxes", "Roll back\nestate tax"),
#'                      xp = x - r * c(1, 0, 0, 0),
#'                      yp = y + r * c(3, .2, .3, -1.6))
#' 
#' ggplot(chip_df, aes(x0 = x, y0 = y, r = r, fill = color)) +
#'   geom_circle(color = NA) +
#'   geom_text(data = amount_df,
#'             aes(label = label, x = xa, y = ya, hjust = hjust, size = size),
#'             inherit.aes = FALSE, fontface = "bold", lineheight = 1) +
#'   geom_text(data = purpose_df,
#'             aes(label = label, x = xp, y = yp, hjust = hjust),
#'             inherit.aes = FALSE, fontface = "plain", lineheight = 1,
#'             size = 16/.pt) +
#'   scale_fill_identity() +
#'   scale_size_identity() +
#'   coord_fixed() +
#'   theme_void()
"CHIP_tax"