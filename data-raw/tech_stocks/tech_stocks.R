library(readr)
library(dplyr)
library(tidyr)
library(purrr)
library(stringr)
library(lubridate)
library(here)


# data downloaded from Yahoo Finance, finance.yahoo.com, in early June 2017

stocks <- data_frame(company = c("Alphabet", "Apple", "Facebook", "Microsoft"),
                     ticker = c("GOOG", "AAPL", "FB", "MSFT"))

# read in all at once
prices <- stocks %>%
  mutate(filename = paste(str_to_lower(ticker), ".csv", sep="")) %>%
  mutate(file_contents = map(filename,
                             ~ read_csv(here("data-raw", "tech_stocks", .),
                                        col_types = "cdddd-"))) %>%
  select(-filename) %>%
  unnest() %>%
  mutate(date=dmy(Date), price=Close) %>%
  select(company, ticker, date, price)

index_prices <- prices %>%
  filter(date == ymd("2012-06-01")) %>%
  select(-company, -date, index_price = price)

prices <- left_join(prices, index_prices) %>%
  group_by(ticker) %>%
  mutate(price_indexed = price/index_price*100)

tech_stocks <- prices

devtools::use_data(tech_stocks)
