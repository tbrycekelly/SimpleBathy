#' @title Add bathymetry tiles
#' @param lon a vector or array of longitude values that match the z grid provided
#' @param lat a vector or array of latitude values that match the z grid provided
#' @param n a grid (matrix or array) to be used for plotting
#' @param verbose a boolean flag to turn on/off displayed messages
#' @author Thomas Bryce Kelly
#' @importFrom utils data
#' @export
getTiles = function(lon, lat, n, verbose = F) {
  
  n = round(n)
  n = max(n, 1)
  n = min(n, 4)
  
  lontiles = tileMapLon(lon)
  lattiles = tileMapLat(lat)
  
  grid = expand.grid(lon = unique(lontiles), lat = unique(lattiles))
  tmp = environment()
  
  res = list()
  for (i in 1:nrow(grid)) {
    tmpname = paste0('Bathy_', n, '_', grid$lon[i], '_', grid$lat[i])
    utils::data(list = tmpname, package = 'SimpleBathy', envir = tmp)
    res[[i]] = eval(parse(text = tmpname), envir = tmp)
  }
  rm(tmp)
  
  res
}







