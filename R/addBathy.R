#' @title Add Map Bathy
#' @description  Add a image layer to the map!
#' @param basemap a list object such as from plotBasemap()
#' @param zlim the value limits used to match up colors to numerical values. Default is range(z)
#' @param ztrim the values used to substitute for numeric values outside of zlim. E.g. an NA value will skip plotting.
#' @param pal a vector of colors applied against the z grid to generate colors
#' @param trim a boolean value to turn on automatic trimming of the z grid to the visible map. Can cause (obvious) artefacts in some circumstances.
#' @param refine an integer value used to refine (or subsample) the provided grid. Positive values will refine and negative values will subsample.
#' @param verbose a boolean flag to turn on/off displayed messages
#' @author Thomas Bryce Kelly
#' @export
addBathy = function(basemap,
                    n = NULL,
                    zlim = NULL,
                    ztrim = NULL,
                    pal = greyscale(255),
                    trim = T,
                    refine = 0,
                    verbose = T) {
  
  ## Determine spatial coverage of the map
  usr = par('usr')
  field = expand.grid(lon = seq(usr[1], usr[2], length.out = 100),
                      lat = seq(usr[3], usr[4], length.out = 100))
  field = basemap$projection(field$lon, field$lat, lon0 = -basemap$lon, lat0 = basemap$lat, inv = T) # lon = 0 in center of screen
  
  ## Calculate zoom if necessary
  if (is.null(n)) {
    n = tileN(basemap$scale)
  }
  
  ## Retreive bathymetry tiles
  bathy = getTiles(lon = field$longitude,
                   lat = field$latitude,
                   n = n)
  
  if (verbose) {
    message('Found ', length(bathy), ' bathymetry tiles (at level=', n,').')
  }
  ## Plot
  for (i in 1:length(bathy)) {
    if (verbose) { 
      message(' Plotting bathymetric layer ', i, ' of ', length(bathy), '.')
    }
    basemap = SimpleMapper::addLayer(basemap,
                                     lon = bathy[[i]]$lon,
                                     lat = bathy[[i]]$lat,
                                     z = bathy[[i]]$Z,
                                     zlim = zlim,
                                     ztrim = ztrim,
                                     pal = pal,
                                     trim = trim,
                                     refine = refine,
                                     verbose = F)
  }
  
  if (verbose) {
    message(' Finished.')
  }
  #basemap$bathy = bathy
  basemap
}





