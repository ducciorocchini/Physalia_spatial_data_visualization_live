# how to deal with land use in the tidyverse

library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)
library(RStoolbox)

im.list()

m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")

m1992 <- rast("~/Desktop/matogrosso_l5_1992219_lrg.jpg")
plot(m1992)

set.seed(42)
m1992c <- im.classify(m1992, num_clusters=2)

# class 1 = forest
# class 2 = human

m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
m2006 <- rast("~/Desktop/matogrosso_ast_2006209_lrg.jpg")
plot(m2006)

set.seed(42)
m2006c <- im.classify(m2006, num_clusters=2)

# class 1 = human
# class 2 = forest

##### The following code will work also in case you have land use maps
# As an example: 
# freq(map1)

#  frequencies
f1992 <- freq(m1992c)
p1992 <- f1992 * 100 / ncell(m1992c)

# forest = 83%
# human = 17%

f2006 <- freq(m2006c)
p2006 <- f2006 * 100 / ncell(m2006c)

# human = 55%
# forest = 45%

class = c("Forest","Human")
y1992 = c(83, 17)
y2006 = c(45, 55)
tabout = data.frame(class, y1992, y2006)

p1 <- ggRGB(m1992, 1, 2, 3, stretch="lin") + ggtitle("Landsat image of 1992")

p2 <- ggplot(tabout, aes(x=class, y=y1992, color=class)) +
  geom_bar(stat="identity", fill="white") + ggtitle("Land use of 1992") + ylim(c(0,100))

p1 + p2

p3 <- ggRGB(m2006, 1, 2, 3, stretch="lin") + ggtitle("Aster image of 2006")

p4 <- ggplot(tabout, aes(x=class, y=y2006, color=class)) +
  geom_bar(stat="identity", fill="white") + ggtitle("Land use of 2006") + ylim(c(0,100))

p3 + p4

p2 + p4

(p1 | p3) / (p2 | p4)

pdf("~/Desktop/output_land_change.pdf")
(p1 | p3) / (p2 | p4)
dev.off()



