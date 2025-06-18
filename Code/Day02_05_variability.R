# How to measure variability over space

library(terra)
library(imageRy)
library(ggplot2)
library(viridis)
library(patchwork)
library(rasterdiv)
library(RStoolbox)

sent <- im.import("sentinel.png")

sent <- rast("~/Desktop/sentinel.png")
plot(sent)

# band 1 = NIR
# band 2 = red
# band 3 = green

plotRGB(sent, 2, 1, 3, stretch="lin")
plotRGB(sent, 2, 3, 1, stretch="lin")

nir <- sent[[1]]
sd3 <- focal(nir, w=c(3,3), fun="sd")

plot(sd3, col=viridis(100))

p1 <- ggRGB(sent, 2, 3, 1, stretch="lin") + ggtitle("Original image with NIR on blue")
p2 <- im.ggplot(sd3) + ggtitle("Standard deviation in a 3x3 window")

p1 + p2

sd5 <- focal(nir, w=c(5,5), fun=sd)
p3 <- im.ggplot(sd5) + ggtitle("Standard deviation in a 5x5 window")

p1 + p2 + p3

var3 <- focal(nir, w=c(3,3), fun=var)
var3 <- focal(nir, w=c(3,3), fun=var)
p4 <- im.ggplot(var3) + ggtitle("Variance in a 3x3 window")
p1 + p2 + p4

sd3_sq <- sd3^2
p5 <- im.ggplot(sd3_sq) 

p4 + p5

p1 + p2 + p3 + p4 

# Fehler in get(as.character(FUN), mode = "function", envir = envir) : 
  Objekt 'fun' mit Modus 'function' nicht gefunden

