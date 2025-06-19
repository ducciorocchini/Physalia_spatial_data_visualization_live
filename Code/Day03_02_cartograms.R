# Cartograms by R!

library(cartogram)
library(sf)
library(tmap)

data("World")
plot(World)

afr <- World[World$continent == "Africa", ]
plot(afr)

# projection

afr <- st_transform(afr, 3395) # wgs84

afr_cont <- cartogram_cont(afr, "pop_est", itermax = 5)

# plot it
tm_shape(afr_cont) + tm_polygons("pop_est", style = "jenks") +
  tm_layout(frame = FALSE, legend.position = c("left", "bottom"))
