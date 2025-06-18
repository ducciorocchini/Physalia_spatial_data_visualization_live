# Visualizing data with ggplot2 tidyverse ideas

library(terra)
library(imageRy)
library(RStoolbox) # for ggRGB
library(patchwork)
library(ggplot2)

im.list()

m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")

# for those with no imageRy
m1992 <- rast("/Users/ducciorocchini/Desktop/matogrosso_l5_1992219_lrg.jpg")
plot(m1992)

# b1 = NIR
# b2 = red
# b3 = green

# instead of plotRGB()
ggRGB(m1992, r=1, g=2, b=3)
ggRGB(m1992, r=2, g=1, b=3)
ggRGB(m1992, r=2, g=3, b=1)

m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

# for those with no imageRy
m2006 <- rast("/Users/ducciorocchini/Desktop/matogrosso_ast_2006209_lrg.jpg")
plot(m2006)

# instead of plotRGB()
ggRGB(m2006, r=1, g=2, b=3)

# b1 = NIR
# b2 = red
# b3 = green

# plotting the two graphs one beside the other
p1 <- ggRGB(m1992, r=1, g=2, b=3) + ggtitle("1992 - Landsat data")
p2 <- ggRGB(m2006, r=1, g=2, b=3) + ggtitle("2006 - Aster data")
p1 + p2

# plotting the two graphs one beside the other
p3 <- ggRGB(m1992, r=2, g=1, b=3)
p4 <- ggRGB(m2006, r=2, g=1, b=3)
(p1 | p2) / (p3 | p4)

# stretching
p5 <- ggRGB(m1992, r=2, g=1, b=3, stretch="lin")
p6 <- ggRGB(m1992, r=2, g=1, b=3, stretch="hist")
p7 <- ggRGB(m2006, r=2, g=1, b=3, stretch="lin")
p8 <- ggRGB(m2006, r=2, g=1, b=3, stretch="hist")

(p5 | p7) / (p6 | p8)

p1 + p2

pdf("/Users/ducciorocchini/Desktop/blablabla.pdf")
p1 + p2
dev.off()

png("/Users/ducciorocchini/Desktop/apng.png")
p1 + p2
dev.off()

