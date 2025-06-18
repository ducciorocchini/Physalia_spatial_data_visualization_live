# Here we will deal with overlap of distributions through the colorist package

library(colorist)
library(viridis)
library(imageRy)

data("fiespa_occ")
plot(fiespa_occ, col=viridis(100))

m1 <- metrics_pull(fiespa_occ)
p1 <- palette_timecycle(fiespa_occ)
pdf("~/Desktop/multiple.pdf")
map_multiples(m1, p1, ncol=4, labels=names(fiespa_occ))
dev.off()

m1_distill <- metrics_distill(fiespa_occ)
map_single(m1_distill, p1)

green <- im.import("greenland.200")

g00 = rast("~/Downloads/greenland.2000.tif")
g05 = rast("~/Downloads/greenland.2005.tif")
g10 = rast("~/Downloads/greenland.2010.tif")
green <- c(g00, g05, g10)







