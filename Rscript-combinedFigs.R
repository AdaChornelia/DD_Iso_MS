## COMBINED THEM ALL 

install.packages("cowplot")
install.packages("gridGraphics")
install.packages("gridExtra")
install.packages("grid")
library(cowplot)
library(gridGraphics)
library(gridExtra)

library(magick)

# Read PNG files
img1a <- image_read("Eurasiafit_meanfit_DD_1_testhigh.png")
img1b <- image_read("Eurasiafit_dispfit_DD_1_testhigh.png")
img2a <- image_read("Asiafit_meanfit_DD_1_testhigh.png")
img2b <- image_read("Asiafit_dispfit_DD_1_testhigh.png")
img3a <- image_read("SEAsiafit_meanfit_DD_1_testhigh.png")
img3b <- image_read("SEAsiafit_dispfit_DD_1_testhigh.png")

# Add labels to each image
img1a <- image_annotate(img1a, "1a)", location = "+50+50", size = 140, color = "black", font = "Helvetica", weight = 700)
img1a
img1b <- image_annotate(img1b, "1b)", location = "+50+50", size = 140, color = "black", font = "Helvetica", weight = 700)
img1b
img2a <- image_annotate(img2a, "2a)", location = "+50+50", size = 140, color = "black", font = "Helvetica", weight = 700)
img2a
img2b <- image_annotate(img2b, "2b)", location = "+50+50", size = 140, color = "black", font = "Helvetica", weight = 700)
img2b
img3a <- image_annotate(img3a, "3a)", location = "+50+50", size = 140, color = "black", font = "Helvetica", weight = 700)
img3a
img3b <- image_annotate(img3b, "3b)", location = "+50+50", size = 140, color = "black", font = "Helvetica", weight = 700)
img3b

# Combine images in 3 rows x 2 columns
row1 <- c(img1a, img1b) %>% image_append(stack = FALSE)
row2 <- c(img2a, img2b) %>% image_append(stack = FALSE)
row3 <- c(img3a, img3b) %>% image_append(stack = FALSE)

combined <- c(row1, row2, row3) %>% image_append(stack = TRUE)

# Save combined image
image_write(combined, "Figure_6_combined_6plots_publication.png")

# Save as pdf
image_write(combined, "Figure_6_combined_6plots_publication.pdf", format = "pdf")

#Done
