#' Scores from the DW NOMINATE project
#' 
#' The table `dw_nominate_house` provides data from the the House legislator file containing DW-NOMINATE scores for the 1st to the 113th Congresses (1789 - 2014).
#' 
#' @references 
#' Jeffrey B. Lewis  and Keith T. Poole. Measuring Bias and Uncertainty in Ideal Point Estimates via the Parametric Bootstrap. Political Analysis 12:105-127, 2004.  
#' 
#' Royce Carroll, Jeffrey B. Lewis, James Lo, Keith T. Poole, and Howard Rosenthal. Measuring Bias and Uncertainty in DW-NOMINATE Ideal Point Estimates via the Parametric Bootstrap. Political Analysis 17:261-27, 2009.
#' 
#' \url{http://k7moa.com/} 
#' 
#' 
#' @examples 
#' Adapted from code by Ian McDonald, http://rpubs.com/ianrmcdonald/293304
#' 
#' all_house_88_113 <- dw_nominate_house %>% 
#'   filter(congress >= 88 & cd !=0 & cd != 98 & cd != 99) %>%
#'   filter(party_code == 100 | party_code == 200) %>%
#'   arrange(desc(congress)) %>% mutate(year1 = congress * 2 + 1787) %>%
#'   arrange(desc(year1))
#' 
#' library(ggridges)
#' 
#' ggplot(all_house_88_113, aes(x = dim_1, y = year1, group = interaction(year1, party_code), fill = factor(party_code))) +
#'   geom_density_ridges(scale = 7, size = 0.25, rel_min_height = 0.01, alpha=0.7) +
#'   theme_ridges(center = TRUE) +
#'   scale_x_continuous(limits=c(-1, 1.3), expand = c(0.01, 0), breaks=c(-1,-.75,-.5,-.25,0,.25,.5,.75,1)) +
#'   scale_y_reverse(breaks=c(seq(2013, 1963, -10))) +
#'   scale_fill_manual(values = c("blue", "red"), breaks = c("100", "200"), labels = c("Democratic", "Republican"), name = "Party") +
#'   ggtitle("DW-NOMINATE by party of U.S. House: 1963-2013") + 
#'   ylab("First Year of Each Congress") +
#'   xlab("Distribution of 1st Dimension DW-NOMINATE by party") 
"dw_nominate_house"