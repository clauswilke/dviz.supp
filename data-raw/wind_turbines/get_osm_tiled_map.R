get_osm_tiled_map <- function(
  bbox = c(left = -95.80204, bottom = 29.38048, right = -94.92313, top = 30.14344),
  zoom = 10, base_url = "http://tile.stamen.com/terrain/", filetype = "png",
  crop = TRUE, messaging = FALSE, urlonly = FALSE, force = FALSE,
  where = tempdir(), ...
){
  
  # enumerate argument checking (added in lieu of checkargs function)
  args <- as.list(match.call(expand.dots = TRUE)[-1])
  argsgiven <- names(args)
  
  if ("location" %in% argsgiven) {
    warning("location is not a valid argument to get_osm_tiledmap(); it is ignored.")
  }
  
  if("bbox" %in% argsgiven){
    if(!(is.numeric(bbox) && length(bbox) == 4)){
      stop("bounding box improperly specified.  see ?get_openstreetmap", call. = F)
    }
  }
  
  if("zoom" %in% argsgiven){
    if(!(is.numeric(zoom) && length(zoom) == 1 &&
         zoom == round(zoom) && zoom >= 0 && zoom <= 18)){
      stop("scale must be a positive integer 0-18, see ?get_stamenmap.", call. = F)
    }
  }
  
  if("messaging" %in% argsgiven) stopifnot(is.logical(messaging))
  
  if("urlonly" %in% argsgiven) stopifnot(is.logical(urlonly))
  
  if("checkargs" %in% argsgiven){
    .Deprecated(msg = "checkargs argument deprecated, args are always checked after v2.1.")
  }
  
  # argument checking (no checks for language, region, markers, path, visible, style)
  if(is.null(names(bbox))) names(bbox) <- c("left","bottom","right","top")
  
  # determine tiles to get
  fourCorners <- expand.grid(
    lon = c(bbox["left"], bbox["right"]),
    lat = c(bbox["bottom"], bbox["top"])
  )
  fourCorners$zoom <- zoom
  row.names(fourCorners) <- c("lowerleft","lowerright","upperleft","upperright")
  fourCornersTiles <- apply(fourCorners, 1, function(v) LonLat2XY(v[1],v[2],v[3]))
  
  xsNeeded <- Reduce(":", sort(unique(as.numeric(sapply(fourCornersTiles, function(df) df$X)))))
  ysNeeded <- Reduce(":", sort(unique(as.numeric(sapply(fourCornersTiles, function(df) df$Y)))))
  tilesNeeded <- expand.grid(x = xsNeeded, y = ysNeeded)
  if(nrow(tilesNeeded) > 40){
    message(paste0(nrow(tilesNeeded), " tiles needed, this may take a while ",
                   "(try a smaller zoom)."))
  }
  
  
  # make urls - e.g. http://tile.stamen.com/terrain/[zoom]/[x]/[y].jpg
  zoom_url <- paste(base_url, zoom, sep = "")
  urls <- paste(zoom_url,
                apply(tilesNeeded, 1, paste, collapse = "/"), sep = "/")
  urls <- paste(urls, filetype, sep = ".")
  if(messaging) message(length(urls), " tiles required.")
  if(urlonly) return(urls)
  
  
  # make list of tiles
  listOfTiles <- lapply(split(tilesNeeded, 1:nrow(tilesNeeded)), function(v){
    v <- as.numeric(v)
    get_osm_tiled_map_tile(base_url, zoom, v[1], v[2], filetype, force = force, messaging = messaging)
  })
  
  
  # stitch tiles together
  map <- stitch(listOfTiles)
  
  
  # format map and return if not cropping
  if(!crop) {
    # additional map meta-data
    attr(map, "source")  <- "osm-tiled-map"
    attr(map, "base_url") <- base_url
    attr(map, "zoom")    <- zoom
    
    # return
    return(map)
  }
  
  
  # crop map
  if(crop){
    mbbox <- attr(map, "bb")
    
    size <- 256 * c(length(xsNeeded), length(ysNeeded))
    
    # slon is the sequence of lons corresponding to the pixels
    # left to right
    slon <- seq(mbbox$ll.lon, mbbox$ur.lon, length.out = size[1])
    
    # slat is the sequence of lats corresponding to the pixels
    # bottom to top
    # slat is more complicated due to the mercator projection
    slat <- vector("double", length = 256*length(ysNeeded))
    for(k in seq_along(ysNeeded)){
      slat[(k-1)*256 + 1:256] <-
        sapply(as.list(0:255), function(y){
          XY2LonLat(X = xsNeeded[1], Y = ysNeeded[k], zoom, x = 0, y = y)$lat
        })
    }
    slat <- rev(slat)
    ##slat <- seq(mbbox$ll.lat, mbbox$ur.lat, length.out = size[2])
    
    keep_x_ndcs <- which(bbox["left"] <= slon & slon <= bbox["right"])
    keep_y_ndcs <- sort( size[2] - which(bbox["bottom"] <= slat & slat <= bbox["top"]) )
    
    croppedmap <- map[keep_y_ndcs, keep_x_ndcs]
  }
  
  
  # format map
  croppedmap <- as.raster(croppedmap)
  class(croppedmap) <- c("ggmap","raster")
  attr(croppedmap, "bb") <- data.frame(
    ll.lat = bbox["bottom"], ll.lon = bbox["left"],
    ur.lat = bbox["top"], ur.lon = bbox["right"]
  )
  
  # additional map meta-data
  attr(croppedmap, "source")  <- "osm_tiled_map"
  attr(croppedmap, "base_url") <- base_url
  attr(croppedmap, "zoom")    <- zoom
  
  
  # return
  croppedmap
}


get_osm_tiled_map_tile <- function(base_url, zoom, x, y, filetype, force = FALSE, messaging = TRUE, where = tempdir()){
  # check arguments
  is.wholenumber <- function (x, tol = .Machine$double.eps^0.5) abs(x - round(x)) < tol
  
  stopifnot(is.wholenumber(zoom) || !(zoom %in% 1:20))
  stopifnot(is.wholenumber(x) || !(0 <= x && x < 2^zoom))
  stopifnot(is.wholenumber(y) || !(0 <= y && y < 2^zoom))
  
  # format url [base_url]][zoom]/[x]/[y].jpg
  url <- sprintf("%s%i/%i/%i.%s", base_url, zoom, x, y, filetype)
  
  # lookup in archive
  tile <- ggmap:::file_drawer_get(url)
  if (!is.null(tile) && !force) return(tile)
  
  # grab if not in archive
  tmp <- tempfile()
  downloaded <- suppressWarnings(try(
    download.file(url, destfile = tmp, quiet = !messaging, mode = "wb"), silent = TRUE
  ))
  
  # message url
  download_error <- inherits(downloaded, "try-error")
  if(download_error) {
    message(paste0("Source FAILED : ", url))
  } else {
    message(paste0("Source : ", url))
  }
  
  # read in/format tile
  if (download_error) {
    
    tile <- array(NA, dim = c(256L, 256L))
    
  } else {
    
    # read in
    if(filetype == "jpg"){
      tile <- jpeg::readJPEG(tmp)
    } else {
      tile <- png::readPNG(tmp)
    }
    
    # convert to colors
    tile <- t(apply(tile, 1:2, function(x) {
        na_idx <- is.na(x[4])
        x[4][na_idx] <- 1
        rgb(x[1], x[2], x[3], x[4])
      }))
  }
  
  
  # determine bbox of map. note : not the same as the argument bounding box -
  # the map is only a covering of the bounding box extent the idea is to get
  # the lower left tile and the upper right tile and compute their bounding boxes
  # tiles are referenced by top left of tile, starting at 0,0
  # see http://wiki.openstreetmap.org/wiki/Slippy_map_tilenames
  lonlat_upperleft <- XY2LonLat(x, y, zoom)
  lonlat_lowerright <- XY2LonLat(x, y, zoom, 255, 255)
  bbox <- c(
    left = lonlat_upperleft$lon,
    bottom = lonlat_lowerright$lat,
    right = lonlat_lowerright$lon,
    top = lonlat_upperleft$lat
  )
  bb <- data.frame(
    ll.lat = unname(bbox["bottom"]),
    ll.lon = unname(bbox["left"]),
    ur.lat = unname(bbox["top"]),
    ur.lon = unname(bbox["right"])
  )
  
  # format
  class(tile) <- c("ggmap", "raster")
  attr(tile, "bb") <- bb
  
  # store
  if(!download_error) ggmap:::file_drawer_set(url, tile)
  
  # return
  tile
}


stitch <- function(tiles){
  
  # trick R CMD check
  ll.lat <- NULL; rm(ll.lat);
  ll.lon <- NULL; rm(ll.lon);
  
  # determine bounding box
  bbs <- plyr::ldply(tiles, function(x) attr(x, "bb"))
  
  bigbb <- data.frame(
    ll.lat = min(bbs$ll.lat),
    ll.lon = min(bbs$ll.lon),
    ur.lat = max(bbs$ur.lat),
    ur.lon = max(bbs$ur.lon)
  )
  
  # determine positions of tile in slate (aggregate)
  order <- as.numeric( arrange(bbs, desc(ll.lat), ll.lon)$.id )
  tiles <- tiles[order]
  tiles <- lapply(tiles, as.matrix) # essential for cbind/rbind to work properly!
  
  # split tiles, then squeeze together from top and bottom
  # and then squeeze together from left and right
  nrows <- length( unique(bbs$ll.lat) )
  ncols <- length( unique(bbs$ll.lon) )
  tiles <- split(tiles, rep(1:nrows, each = ncols))
  tiles <- lapply(tiles, function(x) Reduce(cbind, x))
  tiles <- Reduce(rbind, tiles)
  
  tiles <- as.raster(tiles)
  class(tiles) <- c("ggmap", "raster")
  attr(tiles, "bb") <- bigbb
  
  tiles
}
