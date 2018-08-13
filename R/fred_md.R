#' St. Louis FED Monthly Database
#' 
#' This is a database of over 100 economic indicators recorded on a
#' monthly basis, as provided by the St. Louis FED. A few indicators
#' with missing values have been removed.
#' 
#' @source 
#' \url{https://research.stlouisfed.org/econ/mccracken/fred-databases/}
#' @examples 
#' library(lubridate)
#' library(dplyr)
#' library(ggplot2)
#' library(ggrepel)
#' fred_md %>%
#'   select(-date, -sasdate) %>%
#'   scale() %>%
#'   prcomp() -> pca
#' 
#' pca_data <- data.frame(date=fred_md$date, pca$x) %>%
#'   mutate(
#'     type = ifelse(
#'       (ymd("1990-07-01") <= date & date < ymd("1991-03-01")) |
#'       (ymd("2001-03-01") <= date & date < ymd("2001-11-01")) |
#'       (ymd("2007-12-01") <= date & date < ymd("2009-06-01")),
#'       "recession",
#'       "recovery"
#'     )
#'   )
#' 
#' pca_labels <-
#'   mutate(pca_data,
#'     label = ifelse(
#'       date %in% c(ymd("1990-01-01"), ymd("1991-03-01"), ymd("2001-11-01"),
#'                   ymd("2009-06-01"), ymd("2017-12-01")),
#'       format(date, "%b %Y"), ""
#'     )
#'   ) %>%
#'   filter(label != "") %>%
#'   mutate(
#'     nudge_x = c(.2, -.2, -.2, -.2, .2),
#'     nudge_y = c(.2, -.2, -.2, -.2, .2),
#'     hjust = c(0, 1, 1, 1, 0),
#'     vjust = c(0, 1, 1, 1, 0),
#'   )
#' 
#' ggplot(filter(pca_data, date >= ymd("1990-01-01"))) +
#'   aes(x=PC1, y=PC2, color=type, alpha = date, group = 1) +
#'   geom_path(size = 1, lineend = "butt") +
#'   geom_text_repel(
#'     data = pca_labels,
#'     aes(label = label),
#'     alpha = 1,
#'     point.padding = .2, color = "black",
#'     min.segment.length = 0, size = 10/.pt,
#'     nudge_x = pca_labels$nudge_x,
#'     nudge_y = pca_labels$nudge_y,
#'     hjust = pca_labels$hjust,
#'     vjust = pca_labels$vjust
#'   ) +
#'   scale_color_manual(
#'     values = c("#D55E00", "#009E73"),
#'     name = NULL
#'   ) +
#'   scale_alpha_date(range = c(0.5, 1), guide = "none") +
#'   scale_x_continuous(limits = c(-2, 15.5)) +
#'   scale_y_continuous(limits = c(-5, 5)) +
#'   theme_minimal_grid(12, rel_small = 1) +
#'   theme(
#'     legend.position = c(1, 1),
#'     legend.justification = c(1, 1),
#'     legend.direction = "horizontal",
#'     legend.background = element_rect(fill = "white")
#'   )
"fred_md"
