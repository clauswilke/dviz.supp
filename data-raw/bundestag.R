# 8th Bundestag	1976–1980, source: https://en.wikipedia.org/wiki/Bundestag#Distribution_of_seats_in_the_Bundestag
bundestag = data.frame(party = c("CDU/CSU", "SPD", "FDP"),
                       seats = c(243, 214, 39),
                       colors = c('#4E4E4E', '#B6494A', '#E7D739'),
                       colors_original = c("#000000", "#E30113", "#FFED00"),
                       stringsAsFactors = FALSE) 

devtools::use_data(bundestag)
