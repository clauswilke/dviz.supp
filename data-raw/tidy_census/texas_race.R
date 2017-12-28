library(tidycensus)
library(tidyverse)
library(cowplot)
library(colorspace)

options(tigris_use_cache = TRUE)
census_api_key("458c6de2dc2470e308c285e4aa64d84a2d5ae3a1")

##****************
## Racial composition
##****************

racevars <- c("P0050003", "P0050004", "P0050006", "P0040003")

texas_race_raw <- get_decennial(state = "TX", geography = "county", year = 2010,
                        variables = racevars, geometry = TRUE,
                        summary_var = "P0010001") 

texas_race <- texas_race_raw %>%
  mutate(pct = 100 * (value / summary_value),
         variable = fct_recode(variable,
                               White = "P0050003",
                               Black = "P0050004",
                               Asian = "P0050006",
                               Hispanic = "P0040003"))

devtools::use_data(texas_race, overwrite = TRUE)

texas_race %>%
  filter(variable == "White") %>%
  ggplot(aes(fill = pct)) +
  geom_sf(color = "white") +
  coord_sf(datum = NA) + 
  theme_map() +
  #scale_fill_continuous_diverging(palette = "Blue-Red 3",
  scale_fill_continuous_carto(palette = "Earth",
                              mid = 50,
                              limits = c(0, 100),
                              breaks = 25*(0:4),
                              name = "% white") +
  theme(legend.title.align = 0.5,
        legend.text.align = 0)
