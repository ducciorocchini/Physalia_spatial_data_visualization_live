# This code is thought to build density maps from point data in the field

library(spatstat)
library(viridis)

bei
plot(bei, cex=0.5, pch=16)

plot(bei.extra[[1]], col=mako(100))

dm <- density(bei)
plot(dm, col=cividis(100))
points(bei, col="yellow", cex=.3)

elev <- bei.extra[[1]]

par(mfrow=c(2,1))
plot(elev, col=mako(100))
plot(dm, col=cividis(100))








