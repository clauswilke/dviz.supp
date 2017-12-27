library(readr)
library(here)

# data reading code by Ian McDonald
# https://ianrmcdonald.com/2017/07/22/ggjoy-and-dw-nominate/
# http://rpubs.com/ianrmcdonald/293304

colpos1 <- c(4, 6, 3, 2, 8, 5, 15, 10, 10, 10, 10, 8, 11, 5, 5, 10)
colnames <- c("congress", "icpsr", "st_code", "cd", "st_name", "party_code", "mc_name", "dim_1", "dim_2", "dim_1_se", "dim_2_se", "dim_1_2_corr,", "log_lik", "num_votes", "num_class_err", "geo_mean_prob")
dw_nominate_house <- read_fwf(here("data-raw", "dw_nominate", "HL01113D21_BSSE.DAT"), fwf_widths(colpos1, col_names=colnames))

devtools::use_data(dw_nominate_house)