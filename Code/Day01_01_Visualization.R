# Code to visualize RS data

library(terra)
library(imageRy)
library(viridis)

im.list()

b2 <- im.import("sentinel.dolomites.b2.tif")

# only for those without imageRy:
b2 <- rast("/Users/ducciorocchini/Downloads/sentinel.dolomites.b2.tif")
plot(b2)

b3 <- im.import("sentinel.dolomites.b3.tif")

# only for those without imageRy:
b3 <- rast("/Users/ducciorocchini/Downloads/sentinel.dolomites.b3.tif")
plot(b3)


b4 <- im.import("sentinel.dolomites.b4.tif")

# only for those without imageRy:
b4 <- rast("/Users/ducciorocchini/Downloads/sentinel.dolomites.b4.tif")
plot(b4)


b8 <- im.import("sentinel.dolomites.b8.tif")

# only for those without imageRy:
b8 <- rast("/Users/ducciorocchini/Downloads/sentinel.dolomites.b8.tif")
plot(b8)

par(mfrow=c(1,4))
plot(b2)
plot(b3)
plot(b4)
plot(b8)

par(mfrow=c(2,2))
plot(b2)
plot(b3)
plot(b4)
plot(b8)

sent <- c(b2, b3, b4, b8)
plot(sent)
plot(sent, col=magma(100))
plot(sent, col=magma(3))


# b2 = blue - 1 
# b3 = green - 2
# b4 = red - 3 
# b8 = NIR - 4

dev.off()
plotRGB(sent, r=3, g=2, b=1, stretch="lin")
plotRGB(sent, r=4, g=3, b=2, stretch="lin")
plotRGB(sent, r=3, g=4, b=2, stretch="lin")
plotRGB(sent, r=3, g=2, b=4, stretch="lin")

# defirestation with bare soil created in time

pairs(sent)






