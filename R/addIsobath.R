#' Add Isobaths to Map
#' @export
addIsobath = function(basemap, levels = NULL, col = NULL, lwd = NULL, minN = 0, ...) {
  
  basemap$history[[length(basemap$history) + 1]] = list(func = 'addIsobath',
                                                        arguments = list(
                                                          levels = levels, col = col, lwd = lwd, minN = minN, ... = ...
                                                        )
  )
  
  ## Determine map specifications:
  field = SimpleMapper::fieldOfView(basemap, 100)
  n = tileN(basemap$scale)
  
  ## Load Bathymetry tile(s)
  bathy = getTiles(lon = field$field$longitude + basemap$lon,
                   lat = field$field$latitude,
                   n = n)
  
  if (is.null(levels)) { # TODO Only use depths?
    levels = pretty(pmin(0, as.numeric(bathy[[1]]$Z)))
    if (length(bathy) > 1) {
      for (i in 2:length(bathy)) {
        levels = pretty(c(levels, pmin(0,as.numeric(bathy[[i]]$Z))))
        
      }
    }
  }
  
  ## Default colors if not provided:
  if (is.null(col)) {
    col = rep('black', length(levels))
  }
  if (length(col) != length(levels)) {
    col = rep(col[1], length(levels))
  }
  
  if (is.null(lwd)) {
    lwd = rep(1, length(levels))
  }
  if (length(lwd) != length(levels)) {
    lwd = rep(lwd[1], length(levels))
  }
  
  for (i in 1:length(bathy)) {
    tmp = contourLines(x = bathy[[i]]$lon, y = bathy[[i]]$lat, z = bathy[[i]]$Z, levels = levels)
    if (length(tmp) > 0) {
      for (j in 1:length(tmp)) {
        if (length(tmp[[j]]$x) > minN) {
          proj = basemap$projection(lon = tmp[[j]]$x,
                                    lat = tmp[[j]]$y,
                                    lon0 = basemap$lon,
                                    lat0 = basemap$lat)
          lines(proj$x, proj$y, col = col[which(tmp[[j]]$level == levels)], lwd = lwd, ...)
        }
      }
    }
  }
  
  ## Return
  invisible(basemap)
}
