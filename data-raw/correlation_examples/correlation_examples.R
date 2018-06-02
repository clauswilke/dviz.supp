library(dplyr)
library(tidyr)
library(purrr)
library(withr)

make_cor <- function(n, r_target = 0.5, tolerance = 0.01, seed = 432) {
  with_seed(
    seed,
    {
      x <- rnorm(n)
      y <- rnorm(n)
      r <- cor(x, y)
    }
  )

  # randomize associations
  y <- sample(y)

  count <- 0
  while (abs((r - r_target)/r_target) > tolerance & count < 10000){
    count <- count + 1
    y_new <- y
    ij <- sample.int(n, 2)
    ytmp <- y_new[ij[1]]
    y_new[ij[1]] <- y_new[ij[2]]
    y_new[ij[2]] <- ytmp
    r_new <- cor(x, y_new)
    
    #cat(r, " ", r_new, " ", abs((r - r_target)/r_target), " ", abs(r_new - r_target), " ",  abs(r - r_target), "\n")
    
    if (abs(r_new - r_target) < abs(r - r_target)) {
      r <- r_new
      y <- y_new
    }
  }
  print(r)
  data.frame(x, y)
}

set.seed(123)

correlation_examples <- tibble(r = c(.2, .6, .9, -.2, -.6, -.9)) %>%
  mutate(result = map(r, ~make_cor(50, ., 0.001, 436))) %>%
  unnest() %>%
  mutate(r = factor(r, levels = c(.2, .6, .9, -.2, -.6, -.9)))

devtools::use_data(correlation_examples, overwrite = TRUE)
