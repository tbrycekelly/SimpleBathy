#' Retreive elevation data for a location
#' @param lon Longitude values to get elevation for
#' @param lat Latitude values to get elevation for
#' @importFrom SimpleMapper standardize.longitude
findElevation = function(lon, lat) {
  lon = SimpleMapper::standardize.longitude(lon)
  
  elevation = rep(NA, length(lon))
  
  tiles = getTiles(lon, lat, 4)
  
  for (i in 1:length(tiles)) { # Get elevation for whichever entries each tile is used for:
    k = sapply(1:length(lon),
               function(x) {
                 lon[x] >= min(tiles[[i]]$lon) & lon[x] <= max(tiles[[i]]$lon) & lat[x] >= min(tiles[[i]]$lat) & lat[x] <= max(tiles[[i]]$lat)
    })
    for (j in which(k)) {
      elevation[j] = tiles[[i]]$Z[which.min(abs(lon[j] - tiles[[i]]$lon)), which.min(abs(lat[j] - tiles[[i]]$lat))]
    }
  }
  
  ## Return
  elevation
}
