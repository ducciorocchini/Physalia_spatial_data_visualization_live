# The following code is related to ridgeline plots in R

library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)
library(viridis)
library(RStoolbox)

# for those who do not have imageRy
install.packages("ggridges")
library(ggridges)

ndvi <- im.import("Sentinel2_NDVI_")

ndvi02 <- rast("~/Downloads/Sentinel2_NDVI_2020-02-21.tif")
ndvi05 <- rast("~/Downloads/Sentinel2_NDVI_2020-05-21.tif")
ndvi08 <- rast("~/Downloads/Sentinel2_NDVI_2020-08-01.tif")
ndvi11 <- rast("~/Downloads/Sentinel2_NDVI_2020-11-27.tif")
ndvi <- c(ndvi02, ndvi05, ndvi08, ndvi11)

# vegetation is reflecting NIR
# vegetation is absorbing red
# 8 bit = 256 values (0-255)
# NIR = 255
# red = 0 
# DVI = NIR - red = 255 - 0 = 255
# NDVI = (NIR - red) / (NIR + red)
# NDVI = (255 - 0) / (255 + 0) = 1 / 1 = 1

# 4 bit = 2^4 = 16 values (0-15)
# NIR = 15
# red = 0
# DVI = NIR - red = 15- 0 = 15
# NDVI = (NIR - red) / (NIR + red)
# NDVI = (15 - 0) / (15 + 0) = 1

im.ridgeline(ndvi, scale=1)
names(ndvi) = c("m02_feb", "m05_may", "m08_aug", "m11_nov")

pdf("~/Desktop/outridge.pdf")
im.ridgeline(ndvi, scale=2, palette="mako")
dev.off()

# probability of agriculture 1992 = continuous maps
# probability of agriculture 2006 = continuous maps



















