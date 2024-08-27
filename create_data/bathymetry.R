library(SimpleGridder)
library(SimpleMapper)

gebco = readNC('~/Downloads/gebco_2023/GEBCO_2023.nc')

gebco$lat = seq(-90, 90, length.out = ncol(gebco$elevation)) - 180 / ncol(gebco$elevation)
gebco$lon = seq(-180, 180, length.out = nrow(gebco$elevation)) - 360 / nrow(gebco$elevation)


k = 3
f = function(mat, k) {
  mat = as.array(mat)
  
  if (length(dim(mat)) == 1) {
    res = array(NA, dim = ceiling(dim(mat)/k))
    for (i in 1:length(res)) {
      res[i] = mean(mat[((i-1)*k + 1):(i*k)])
    }
  } else {
    res = array(NA, dim = ceiling(dim(mat) / k))
    
    for (i in 1:dim(res)[1]) {
      for (j in 1:dim(res)[2]) {
        res[i, j] = mean(mat[((i-1)*k + 1):(i*k), ((j-1)*k + 1):(j*k)])
      }
    }
  }
  array(res, dim = floor(dim(mat) / k))
}


gebco5 = list(lon = f(gebco$lon, k),
              lat = f(gebco$lat, k),
              Z = f(gebco$elevation, k))
rm(gebco)
dim(gebco5$Z)
dim(gebco5$Z)/k # 4
dim(gebco5$Z)/k^2 # 3
dim(gebco5$Z)/k^3 # 2
dim(gebco5$Z)/k^3/2 # 1

gebco4 = list(lon = f(gebco5$lon, k),
              lat = f(gebco5$lat, k),
              Z = f(gebco5$Z, k))

gebco3 = list(lon = f(gebco4$lon, k),
              lat = f(gebco4$lat, k),
              Z = f(gebco4$Z, k))

gebco2 = list(lon = f(gebco3$lon, 2),
              lat = f(gebco3$lat, 2),
              Z = f(gebco3$Z, 2))

gebco1 = list(lon = f(gebco2$lon, 2),
              lat = f(gebco2$lat, 2),
              Z = f(gebco2$Z, 2))

gebco5$Z = array(as.integer(gebco5$Z), dim = dim(gebco5$Z))
gebco4$Z = array(as.integer(gebco4$Z), dim = dim(gebco4$Z))
gebco3$Z = array(as.integer(gebco3$Z), dim = dim(gebco3$Z))
gebco2$Z = array(as.integer(gebco2$Z), dim = dim(gebco2$Z))
gebco1$Z = array(as.integer(gebco1$Z), dim = dim(gebco1$Z))


generateTiles = function(gebco, n, delta, fout) {
  lon.index = tileMapLon(gebco$lon, delta = 30)
  lat.index = tileMapLat(gebco$lat, delta = 30)
  for (i in unique(lon.index)) {
    for (j in unique(lat.index)) {
      l1 = which(lon.index == i)
      l2 = which(lat.index == j)
      tmp = list(lon = gebco$lon[l1],
                 lat = gebco$lat[l2],
                 Z = gebco$Z[l1,l2])
      tmp$Z = array(as.integer(tmp$Z), dim = dim(tmp$Z))
      
      bathy.name = paste0('Bathy_', n, '_', i, '_', j)
      assign(bathy.name, value = tmp)
      save(list = bathy.name, file = paste0('data/', bathy.name, '.rdata'), compression_level = 6)
      
      message('Generated grid tile ', bathy.name, ' (', round(file.size(paste0('data/', bathy.name, '.rdata'))/1e3, 0), ' KB).')
      
      write(paste0('#\' @title Bathymetry data tile ', n, ',', i, ',', j), file = fout)
      write(paste0('\"Bathy_', n,'_', i, '_', j, '\"'), file = fout)
    }
  }
}



datfile = file('R/data.R', open = 'w')
generateTiles(gebco1, 1, 30, datfile)
generateTiles(gebco2, 2, 30, datfile)
generateTiles(gebco3, 3, 30, datfile)
generateTiles(gebco4, 4, 30, datfile)

close(datfile)




