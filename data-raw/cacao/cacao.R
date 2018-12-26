library(here)
library(tidyverse)

cacao <- read_csv(here("data-raw", "cacao", "cacao_clean.csv"))

devtools::use_data(cacao, overwrite = TRUE)


# Bayesian mcmc chain for simplified case

countries <- c("Austria", "Belgium", "Canada", "Peru", "Switzerland")

cacao_small <- cacao %>% 
  filter(location %in% c("U.S.A.", countries)) %>%
  mutate(location = factor(location, levels = c("U.S.A.", countries)))

devtools::use_data(cacao_small, overwrite = TRUE)

library(rstanarm)

cacao_mcmc <- stan_glm(rating ~ location, data = cacao_small, prior = student_t(3, 0, 1))

devtools::use_data(cacao_mcmc, overwrite = TRUE)
