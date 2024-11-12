library(SimpleMapper)
library(SimpleBathy)

png('figures/Map1.png', width = 800, height = 600, type = 'cairo')
map = plotBasemap(coastline4, scale = 500, lat = 60, lon = -147)
map = addBathy(map, zlim = c(-3e3, 0), ztrim = c(-3e3, NA), pal = pals::cubicl(128))
map = addRelief(map)
map = addCoastline(map)
map = addLatitude(map)
map = addLongitude(map)
dev.off()


png('figures/Map2.png', width = 800, height = 600, type = 'cairo')
map = plotBasemap(coastline4, scale = 1000, lat = 60, lon = -147)
map = addBathy(map, zlim = c(-3e3, 0), ztrim = c(-3e3, NA), pal = rev(pals::brewer.blues(32)))
map = addCoastline(map)
dev.off()


png('figures/Map3.png', width = 800, height = 600, type = 'cairo')
map = plotBasemap(coastline3, scale = 2000, lat = 60, lon = -147)
map = addBathy(map, zlim = c(-3e3, 0), ztrim = c(-3e3, NA), pal = greyscale(8))
map = addRelief(map)
map = addCoastline(map)
dev.off()


png('figures/Map4.png', width = 800, height = 600, type = 'cairo')
map = plotBasemap(coastline3, scale = 2000, lat = 90, lon = 0)
map = addBathy(map, zlim = c(-3e3, 0), ztrim = c(-3e3, NA), pal = pals::cubicl(8))
map = addCoastline(map)
dev.off()


png('figures/Map4.png', width = 800, height = 600, type = 'cairo')
map = plotBasemap(coastline3, scale = 8000, lat = 90, lon = 0)
map = addBathy(map, zlim = c(-3e3, 0), ztrim = c(-3e3, NA), pal = pals::cubicl(8))
map = addRelief(map, zlim = c(100, 1000))
map = addCoastline(map)
dev.off()


map = plotBasemap(coastline3, scale = 8000, lat = 90, lon = 180.1234325)
map = addBathy(map, zlim = c(-3e3, 0), ztrim = c(-3e3, NA), pal = pals::cubicl(8), trim = F)
map = addRelief(map, zlim = c(100, 1000))
map = addCoastline(map)


map = plotBasemap(coastline3, scale = 8000, lat = 90, lon = 90)
map = addBathy(map, zlim = c(-3e3, 0), ztrim = c(-3e3, NA), pal = pals::cubicl(8), trim = F)
map = addRelief(map, zlim = c(100, 1000))
map = addCoastline(map)


map = plotBasemap(coastline3, scale = 4000, lat = 80, lon = 10)
map = addBathy(map, zlim = c(-3e3, 0), ztrim = c(-3e3, NA), pal = pals::cubicl(8), trim = F)
map = addRelief(map, zlim = c(100, 1000))
map = addCoastline(map)


map = plotBasemap(coastline3, scale = 6000, lat = -40, lon = 30)
map = addBathy(map, zlim = c(-5e3, 0), ztrim = c(-5e3, NA), pal = pals::cubicl(8), trim = F)
map = addRelief(map, zlim = c(100, 1000))
map = addCoastline(map, antarctica3)
map = addCoastline(map)

map = plotBasemap(coastline3, scale = 2000, lat = -40, lon = 30)
map = addBathy(map, zlim = c(-5e3, 0), ztrim = c(-5e3, NA), pal = pals::cubicl(8), trim = F)
map = addRelief(map, zlim = c(100, 1000))
map = addCoastline(map)

map = plotBasemap(coastline3, scale = 1000, lat = -40, lon = 30)
map = addBathy(map, zlim = c(-5e3, 0), ztrim = c(-5e3, NA), pal = pals::cubicl(8), trim = F)
map = addRelief(map, zlim = c(100, 1000))
map = addCoastline(map)


png('figures/Map5.png', width = 800, height = 600, type = 'cairo')
map = plotBasemap(coastline4, scale = 500, lat = 59, lon = -148)
map = addBathy(map, zlim = c(-5e3, 0), ztrim = c(-5e3, NA), pal = pals::ocean.deep(16), trim = F)
map = addRelief(map, zlim = c(100, 1000))
map = addCoastline(map)
dev.off()