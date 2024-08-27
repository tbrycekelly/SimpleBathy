#' @title Determine longitude index for tiling
#' @param lon a vector of longitude values
#' @param delta the width of each tile in degrees
#' @param offset offset
#' @author Thomas Bryce Kelly
#' @export
tileMapLon = function(lon, delta = 30, offset = 180) {
  round((SimpleMapper::standardize.longitude(lon)+offset) / delta)
}


#' @title Determine latitude index for tiling
#' @param lat a vector of latitude values
#' @param delta the height of each tile in degrees
#' @param offset offset
#' @author Thomas Bryce Kelly
#' @export
tileMapLat = function(lat, delta = 30, offset = 90) {
  round((SimpleMapper::standardize.longitude(lat)+offset) / delta)
}


#' @title Add tile zoom
#' @author Thomas Bryce Kelly
#' @param scale the scale of the map in km
#' @export
tileN = function(scale) {
  if (scale < 1000) {
    n = 4
  } else if (scale < 2500) {
    n = 3
  } else if (scale < 4000) {
    n = 2
  } else {
    n = 1
  }
  
  n
}
