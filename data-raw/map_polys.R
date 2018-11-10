world <- maps:::map.poly(
  database = "world", regions = ".", exact = FALSE, xlim = NULL, 
  ylim = NULL, boundary = TRUE, interior = TRUE, fill = TRUE, 
  as.polygon = TRUE
) 

usa <- maps:::map.poly(
  database = "world", regions = "^USA", exact = FALSE, xlim = NULL, 
  ylim = NULL, boundary = TRUE, interior = TRUE, fill = TRUE, 
  as.polygon = TRUE
) 

world_no_usa <- maps:::map.poly(
  database = "world", regions = "^(?!USA)", exact = FALSE, xlim = NULL, 
  ylim = NULL, boundary = TRUE, interior = TRUE, fill = TRUE, 
  as.polygon = TRUE
)

map_polys <- list(
  world = world,
  usa = usa,
  world_no_usa = world_no_usa
)

devtools::use_data(map_polys, overwrite = TRUE)
