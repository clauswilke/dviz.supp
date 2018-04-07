#' BA degrees awarded by field of study
#' 
#' BA degrees awarded by field of study, from 1970 to 2015.
#' 
#' @examples
#' # find degrees with highest average percent
#' BA_degrees %>% group_by(field) %>%
#'   summarize(mean_perc = mean(perc)) %>%
#'   arrange(desc(mean_perc)) -> BA_top
#' 
#' top_fields <- filter(BA_top, mean_perc>0.04)$field
#' 
#' BA_top_degrees <- filter(BA_degrees, field %in% top_fields) %>%
#'   mutate(field = factor(field, levels = top_fields)) %>%
#'   arrange(field)
#' 
#' ggplot(BA_top_degrees, aes(year, perc)) + 
#'   geom_line() + 
#'   facet_wrap(~field, labeller = label_wrap_gen(width = 25), ncol = 3)
#' 
#' @references
#' National Center for Education Statistics, \url{https://nces.ed.gov/programs/digest/d16/tables/dt16_322.10.asp}
#' 
"BA_degrees"
