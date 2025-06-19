# Simulating and solving colorblindness

library(terra)
library(colorblindcheck)
library(colorblindr)
library(patchwork)
library(cblindplot)
library(RStoolbox)
library(patchwork)

vin = rast("~/Desktop/vinicunca.jpg")
vin = flip(vin)
plot(vin)

p1 = ggRGB(vin, 1, 2, 3, stretch="lin")
p2 = ggRGB(vin, 3, 2, 1, stretch="lin")
p1 / p2


# Reproducing color ramp palette and colorblind vision
# library(colorblindcheck)

rainbow_pal <- rainbow(7)
palette_check(rainbow_pal, plot=TRUE)

explot <- ggplot(iris, aes(Sepal.Length, fill=Species)) +
geom_density(alpha=0.7)
explot

cvd_grid(explot)

# Solving the issue
us <- rast("~/Desktop/rainbow.jpg")
us <- flip(us)
plot(us)
cblind.plot(us, cvd="protanopia")


