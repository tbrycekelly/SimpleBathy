
#' @title Add Map Bathy
#' @description  Add a image layer to the map!
#' @param basemap a list object such as from plotBasemap()
#' @param zlim the value limits used to match up colors to numerical values. Default is range(z)
#' @param pal a vector of colors applied against the z grid to generate colors
#' @param trim a boolean value to turn on automatic trimming of the z grid to the visible map. Can cause (obvious) artefacts in some circumstances.
#' @param refine an integer value used to refine (or subsample) the provided grid. Positive values will refine and negative values will subsample.
#' @param verbose a boolean flag to turn on/off displayed messages
#' @author Thomas Bryce Kelly
#' @importFrom grDevices colorRampPalette
#' @importFrom graphics par
#' @export
addRelief = function(basemap,
                     zlim = c(100, 3e3),
                     pal = paste0(grDevices::colorRampPalette(colors = c('lightgrey', '#000000'))(8), seq(10, 80, length.out = 8)),
                     trim = T,
                     refine = 0,
                     verbose = T) {
  
  basemap$history[[length(basemap$history) + 1]] = list(func = 'addRelief',
                                                        arguments = list(
                                                          zlim = zlim, pal = pal, trim = trim, refine = refine, verbose = verbose
                                                        )
  )
  
  ## Determine spatial coverage of the map
  usr = par('usr')
  field = expand.grid(lon = seq(usr[1], usr[2], length.out = 100),
                      lat = seq(usr[3], usr[4], length.out = 100))
  field = basemap$projection(field$lon, field$lat, lon0 = -basemap$lon, lat0 = basemap$lat, inv = T) # lon = 0 in center of screen
  n = tileN(basemap$scale)
  
  ## Retreive bathymetry tiles
  bathy = getTiles(lon = field$longitude,
                   lat = field$latitude,
                   n = n)
  
  if (verbose) {
    message('Found ', length(bathy), ' elevation tiles (at level=', n,').')
  }
  ## Plot
  for (i in 1:length(bathy)) {
    if (verbose) { 
      message(' Plotting elevation relief layer ', i, ' of ', length(bathy), '.')
    }
    basemap = SimpleMapper::addLayer(basemap,
                                     lon = bathy[[i]]$lon,
                                     lat = bathy[[i]]$lat,
                                     z = bathy[[i]]$Z,
                                     zlim = zlim,
                                     ztrim = c(NA, zlim[2]),
                                     pal = pal,
                                     trim = trim,
                                     refine = refine,
                                     verbose = F)
  }
  
  if (verbose) {
    message(' Finished.')
  }
  #basemap$bathy = bathy
  invisible(basemap)
}
