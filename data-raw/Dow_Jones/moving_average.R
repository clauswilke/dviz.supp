library(tidyverse)
library(lubridate)
library(here)
library(ggthemes)


moving_ave <- function(date, value, range, center = TRUE) {
  if (isTRUE(center)) {
    offset <- ceiling(range/2)
  } else {
    offset <- range
  }
  vapply(
    1:length(value),
    function(i, date, value) {
      focal_day <- date[i]
      first_day <- focal_day - offset + 1
      last_day <- focal_day - offset + range
      idx <- date >= first_day & date <= last_day
      if (head(date, 1L) > first_day || tail(date, 1L) < last_day) {
        NA_real_
      } else {
        mean(value[idx])
      }
    },
    double(1),
    date,
    value
  )
}


df_dow <- read_csv(here::here("data-raw", "Dow_Jones", "DJI.csv")) %>%
  mutate(
    date = mdy(Date),
    open = Open,
    high = High,
    low = Low,
    close = Close,
    volume = Volume,
  ) %>%
  select(date, open, high, low, close, volume)



ggplot(df_dow, aes(date, close)) + geom_line()

df_dow %>% filter(date >= ymd("2009/01/01") & date <= ymd("2010/01/01")) %>%
  mutate(
    close_20d_ave_c = moving_ave(date, close, 20),
    close_50d_ave_c = moving_ave(date, close, 50),
    close_100d_ave_c = moving_ave(date, close, 100),
  ) %>%
  ggplot(aes(date, close)) + 
  geom_line(aes(color = "closing"), size = .5) +
  geom_line(aes(date, close_20d_ave_c, color = "20d"), size = .75, na.rm = TRUE) +
  geom_line(aes(date, close_50d_ave_c, color = "50d"), size = .75, na.rm = TRUE) +
  geom_line(aes(date, close_100d_ave_c, color = "100d"), size = .75, na.rm = TRUE) +
  scale_color_manual(
    values = c(
      closing = "black", 
      `20d` = "#009e73",
      `50d` = "#d55e00",
      `100d` = "#0072b2"
    ),
    breaks = c("closing", "20d", "50d", "100d"),
    labels = c("closing price", "20 day average", "50 day average", "100 day average")
  ) + 
  theme_minimal()

df_dow %>% filter(date >= ymd("2009/01/01") & date <= ymd("2010/01/01")) %>%
  mutate(
    close_20d_ave = moving_ave(date, close, 20, center = FALSE),
    close_50d_ave = moving_ave(date, close, 50, center = FALSE),
    close_100d_ave = moving_ave(date, close, 100, center = FALSE)
  ) %>%
  ggplot(aes(date, close)) + 
  geom_line(aes(color = "closing"), size = .5) +
  geom_line(aes(date, close_20d_ave, color = "20d"), size = .75, na.rm = TRUE) +
  geom_line(aes(date, close_50d_ave, color = "50d"), size = .75, na.rm = TRUE) +
  geom_line(aes(date, close_100d_ave, color = "100d"), size = .75, na.rm = TRUE) +
  scale_color_manual(
    values = c(
      closing = "black", 
      `20d` = "#009e73",
      `50d` = "#d55e00",
      `100d` = "#0072b2"
    ),
    breaks = c("closing", "20d", "50d", "100d"),
    labels = c("closing price", "20 day average", "50 day average", "100 day average")
  ) + 
  theme_minimal()

# LOESS (locally estimated scatterplot smoothing) 

df_dow %>% filter(date >= ymd("2009/01/01") & date <= ymd("2010/01/01")) %>%
  mutate(
    close_100d_ave = moving_ave(date, close, 100)
  ) %>%
  ggplot(aes(date, close)) + 
  geom_line(aes(color = "closing"), size = .25) +
  geom_line(aes(date, close_100d_ave, color = "100d"), size = .75, na.rm = TRUE) +
  geom_smooth(aes(color = "smooth"), size = .75, na.rm = TRUE, se = FALSE) +
  scale_color_manual(
    values = c(
      closing = "black", 
      `100d` = "#d55e00",
      smooth = "#0072b2"
    ),
    breaks = c("closing", "smooth", "100d"),
    labels = c("closing price", "LOESS smoother", "100 day average")
  ) + 
  theme_minimal()

