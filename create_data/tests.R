library(SimpleMapper)
library(SimpleBathy)

map = plotBasemap(coastline4, scale = 500, lat = 60, lon = -147)
map = addBathy(map, zlim = c(-3e3, 0), ztrim = c(-3e3, NA), pal = pals::cubicl(8))
map = addRelief(map)
map = addCoastline(map)

map = plotBasemap(coastline4, scale = 1000, lat = 60, lon = -147)
map = addBathy(map, zlim = c(-3e3, 0), ztrim = c(-3e3, NA), pal = pals::cubicl(8))
map = addRelief(map)
map = addCoastline(map)

map = plotBasemap(coastline2, scale = 2000, lat = 60, lon = -147)
map = addBathy(map, zlim = c(-3e3, 0), ztrim = c(-3e3, NA), pal = pals::cubicl(8))
map = addRelief(map)
map = addCoastline(map)

map = plotBasemap(coastline2, scale = 4000, lat = 60, lon = -147)
map = addBathy(map, zlim = c(-3e3, 0), ztrim = c(-3e3, NA), pal = pals::cubicl(8))
map = addRelief(map)
map = addCoastline(map)

map = plotBasemap(coastline1, scale = 8000, lat = 60, lon = -147)
map = addBathy(map, zlim = c(-3e3, 0), ztrim = c(-3e3, NA), pal = pals::cubicl(8))
map = addRelief(map)
map = addCoastline(map)



map = plotBasemap(coastline3, scale = 2000, lat = 90, lon = 0)
map = addBathy(map, zlim = c(-3e3, 0), ztrim = c(-3e3, NA), pal = pals::cubicl(8))
map = addRelief(map, zlim = c(100, 1000))
map = addCoastline(map)

map = plotBasemap(coastline3, scale = 4000, lat = 90, lon = 0)
map = addBathy(map, zlim = c(-3e3, 0), ztrim = c(-3e3, NA), pal = pals::cubicl(8))
map = addRelief(map, zlim = c(100, 1000))
map = addCoastline(map)


map = plotBasemap(coastline3, scale = 8000, lat = 90, lon = 0)
map = addBathy(map, zlim = c(-3e3, 0), ztrim = c(-3e3, NA), pal = pals::cubicl(8))
map = addRelief(map, zlim = c(100, 1000))
map = addCoastline(map)


map = plotBasemap(coastline3, scale = 8000, lat = 90, lon = 180)
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
