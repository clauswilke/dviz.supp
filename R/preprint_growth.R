#' Growth in the number of biology preprints posted
#'  
#' Monthly number of biology preprints posted in several widely used archives.
#' 
#' @examples
#' preprint_growth %>% filter(archive %in% c("bioRxiv", "arXiv q-bio")) %>%
#' filter(count > 0) -> df_preprints
#' 
#' df_final <- filter(df_preprints, date == max(date))
#' 
#' ggplot(df_preprints, aes(date, count, color = archive)) + geom_line() +
#'   scale_y_log10(limits = c(30, 1600), breaks = c(30, 100, 300, 1000), expand = c(0, 0),
#'                 name = "preprints / month",
#'                 sec.axis = dup_axis(breaks = df_final$count, labels = df_final$archive,
#'                                     name = NULL)) + 
#'   scale_x_date(name = NULL, expand = c(0, 0)) +
#'   scale_color_manual(values = c("#D55E00", "#0072B2"), guide = "none") +
#'   labs(title = "Rapid growth of bioRxiv",
#'        subtitle = "After the introduction of bioRxiv, q-bio stopped growing",
#'        caption = "Data source: Jordan Anaya, http://www.prepubmed.org/") +
#'   theme_minimal_grid() +
#'   theme(plot.title = element_text(hjust = 0),
#'         plot.caption = element_text(size = 10))
#' @source 
#' Jordan Anaya, \url{http://www.prepubmed.org/}
"preprint_growth"