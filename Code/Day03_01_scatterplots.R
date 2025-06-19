# Code for scatterplot matrices with vector (or raster) data

library(terra)
library(sf)
# https://www.youtube.com/watch?v=2d8YaVu1uzs
library(ggplot2)
library(viridis)
library(patchwork)

nc <- st_read(system.file("shape/nc.shp", package="sf"))

plot(nc)

ggplot() +
    geom_sf(data = nc) +
    ggtitle("Counties of NC")

nc$areakm2 <- st_area(nc) / 1000000

# Order and then take the first 10

nc <- nc[order(nc$areakm2, decreasing = TRUE), ]

ggplot() + 
    geom_sf(data = nc[1:10, ]) +
    ggtitle("Counties with highest area")

nc <- nc[order(nc$areakm2, decreasing = FALSE), ]

ggplot() + 
    geom_sf(data = nc[1:10, ]) +
    ggtitle("Counties with smallest area")

p1 = ggplot(nc) +
  geom_sf(aes(fill = AREA), color="white") +
  scale_fill_viridis_c(option = "cividis", direction = -1) 

p2 = ggplot(nc) +
  geom_sf(aes(fill = AREA), color="white") +
  scale_fill_viridis_c(option = "magma") 

p1 / p2

p3 = ggplot(nc) +
  geom_sf(aes(fill = PERIMETER), color="white") +
  scale_fill_viridis_c(option = "viridis", direction = -1) 

p1 / p3

nc$COMPLEXITY = nc$PERIMETER / nc$AREA

p4 = ggplot(nc) +
    geom_sf(aes(fill = COMPLEXITY), color="white") +
    scale_fill_viridis_c(option = "magma", direction = -1) 
  
p1 / p3 / p4

p5 = ggplot(nc) +
  geom_sf(aes(fill = PERIMETER), color="white") +
  scale_fill_viridis_c(option = "viridis") 

p6 = ggplot(nc) +
    geom_sf(aes(fill = COMPLEXITY), color="white") +
    scale_fill_viridis_c(option = "viridis") 

p2 / p5 / p6

nc$COMPLEXITYlog = log(nc$COMPLEXITY)

p7 = ggplot(nc) +
    geom_sf(aes(fill = COMPLEXITYlog), color="white") +
    scale_fill_viridis_c(option = "viridis") 

p2 / p5 / p6 / p7

nc$COMPLEXITYsqrt = sqrt(nc$COMPLEXITY)

p8 = ggplot(nc) +
    geom_sf(aes(fill = COMPLEXITYsqrt), color="white") +
    scale_fill_viridis_c(option = "viridis") 

p6 / p7 / p8
