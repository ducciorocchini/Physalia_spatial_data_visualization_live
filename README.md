# Physalia_spatial_data_visualization_live
Live version of the code developed for the Physalia Course on spatial data visualization

> This is a note 

## Day 1 
+ Spatial matrices, .e., remote sensing data 📡

Here are the packages we are going to use:
``` r
library(imageRy)
```

## Day 2
+ land use change
  + classification
  + ridgeline plots for temporal changes
+ epidemiology
  + density maps
  + distribution overlaps
    
## Day 3
+ Colorblindness 👓

We the following code we attain a nice image.

+ The code:
``` r
p1 <- ggRGB(m1992, r=1, g=2, b=3) + ggtitle("1992 - Landsat data")
p2 <- ggRGB(m2006, r=1, g=2, b=3) + ggtitle("2006 - Aster data")
p1 + p2
```

+ The image:

![apng](https://github.com/user-attachments/assets/5a4fbdcf-67a0-4cd3-af0a-1c925b605b23)

