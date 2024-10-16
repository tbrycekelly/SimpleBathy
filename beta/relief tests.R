library(SimpleBathy)
library(SimpleMapper)

getGradient = function(map) {
  fov = fieldOfView(map)
  tiles = getTiles(fov$field$lon + map$lon, fov$field$latitude, min(4, 1+tileN(map$scale)))
  
  grad = list()
  
  for (i in 1:length(tiles)) {
    grad[[i]] = list(lon = tiles[[i]]$lon,
                     lat = tiles[[i]]$lat,
                     Z = tiles[[i]]$Z,
                     Zgrad = grad(tiles[[i]]$Z))
  }
  
  grad
}


grad = function(input) {
  res = array(0, dim = dim(input))
  
  for (i in 2:(dim(res)[1])) {
    res[i,1] = 2 * input[i,1] - input[i-1,1] - input[i,2]
  } 
  for (i in 2:(dim(res)[1] - 1)) {  
    for (j in 2:(dim(res)[2] - 1)) {
      res[i,j] = input[i+1,j] + input[i,j+1] - input[i-1,j] - input[i,j-1]
    }
  }
  
  for (j in 2:(dim(res)[2])) {
    res[1,j] = 2 * input[1,j] - input[1,j-1] - input[2,j]
  }
  
  res
}

addMask = function(layer, mask) {
  layer[!mask] = NA
  
  layer
}


map = plotBasemap(lon = -120, lat = 40, scale = 5e3)
tmp = getGradient(map)
#map = addLayer(map, tmp[[1]]$lon, lat = tmp[[1]]$lat, z = tmp[[1]]$Z, pal = pals::cubicl(16))
#map = addRelief(map, pal = grDevices::colorRampPalette(colors = c(map$land.col, 'white'))(8), zlim = c(0, 1e3))

for (i in 1:length(tmp)) {
  map = addLayer(map,
                 tmp[[i]]$lon,
                 lat = tmp[[i]]$lat,
                 z = addMask(abs(tmp[[i]]$Zgrad), tmp[[i]]$Z > 0),
                 zlim = c(0, 2000),
                 pal = paste0(grDevices::colorRampPalette(colors = c(map$land.col, '#000000'))(8), 'f0'))
}
map = addCoastline(map)
#map = plotBasemap(scale = 3e3)

map = addRelief(map, pal = grDevices::colorRampPalette(colors = c(map$land.col, 'white'))(8))




map = plotBasemap(lon = -120, lat = 40, scale = 5e3)
tmp = getGradient(map)
#map = addLayer(map, tmp[[1]]$lon, lat = tmp[[1]]$lat, z = tmp[[1]]$Z, pal = pals::cubicl(16))
#map = addRelief(map, pal = grDevices::colorRampPalette(colors = c(map$land.col, 'white'))(8), zlim = c(0, 1e3))

for (i in 1:length(tmp)) {
  map = addLayer(map,
                 tmp[[i]]$lon,
                 lat = tmp[[i]]$lat,
                 z = abs(tmp[[i]]$Zgrad),
                 zlim = c(0, 2000),
                 pal = paste0(grDevices::colorRampPalette(colors = c(map$land.col, '#000000'))(8), 'f0'))
}
map = addCoastline(map)
#map = plotBasemap(scale = 3e3)

map = addRelief(map, pal = grDevices::colorRampPalette(colors = c(map$land.col, 'white'))(8))
