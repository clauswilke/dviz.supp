#' United States median income and age per county
#' 
#' The data frame `us_income_age` provides median income with margin of error (moe)
#' and median age with moe for each county in the U.S. The moe is a standard 90\%
#' confidence interval, as provided by the US Census.
#' 
#' Data was obtained from the US Census, 2015 ACS.
#' @examples
#' ggplot(US_income_age, aes(age, income)) + 
#'   geom_errorbarh(aes(xmin = age - age.moe, xmax = age + age.moe), height = 0) +
#'   geom_errorbar(aes(ymin = income - income.moe, ymax = income + income.moe), width = 0) +
#'   geom_point(size = 0.2) +
#'   facet_wrap(~state)
#'   
#' filter(US_income_age, state == "Virginia") %>%
#'   ggplot(aes(age, income)) + 
#'   geom_errorbarh(aes(xmin = age - age.moe, xmax = age + age.moe), height = 0) +
#'   geom_errorbar(aes(ymin = income - income.moe, ymax = income + income.moe), width = 0) +
#'   geom_point()
"US_income_age"

