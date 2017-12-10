#' Proportion of seats held by women in national parliaments
#' 
#' Women in parliaments are the percentage of parliamentary seats in a single or lower chamber held by women.
#'
#' @examples
#' library(dplyr)
#' library(tidyr)
#' library(ggplot2)
#' library(colorblindr)
#' 
#' # ccode = "RWA" # Rwanda
#' # ccode = "BEL" # Belgium
#' # ccode = "ARB" # Arab world
#' # ccode = "BOL" # Bolivia
#' ccode = "EUU" # European Union
#' 
#' women_parliaments %>% filter(country_code == ccode & year > 1990) %>%
#'   mutate(women = perc_women, men = 100 - perc_women) %>%
#'   select(-perc_women) %>%
#'   gather(gender, percent, women, men) %>%
#'   mutate(gender = factor(gender, levels = c("women", "men"))) %>%
#'   ggplot(aes(x = year, y = percent, fill = gender)) +
#'     geom_col(position = "stack", width = .9) +
#'     geom_hline(yintercept = c(0, 25, 50, 75, 100), color = "#FFFFFF60") +
#'     scale_x_continuous(expand = c(0, 0)) +
#'     scale_y_continuous(expand = c(0, 0)) +
#'     scale_fill_OkabeIto() +
#'     theme_minimal()
#' @references 
#' Inter-Parliamentary Union (IPU, ipu.org)
#' 
#' Downloaded on 10/31/2017 from: https://data.worldbank.org/indicator/SG.GEN.PARL.ZS
"women_parliaments"
