library(tidyverse)

# ---- Non-visual data representation ----
# packages helping with blind accessibility

# Using alt text
install.packages("BrailleR")
library(BrailleR)

barplot <- ggplot(diamonds, aes(x = clarity)) + 
  geom_bar() +
  theme(axis.text.x = element_text(angle=70, vjust=0.5)) +
  scale_fill_viridis_d(option = "C") +
  theme_classic()

VI(barplot)
# what is bad about this?

# ---- sonification: representing data by sound ----
#ups and downs in frequency represent the ups and downs in the data

install.packages("sonify") 
library(sonify)

plot(iris$Petal.Width)
sonify(iris$Petal.Width)
#length of time is amount of data and pitch is the value (lower pitch = lower value)
plot(x = iris$Petal.Width, y = iris$Petal.Length)

sonify(x=iris$Petal.Width, y = iris$Petal.Length) 

# ---- Publishing Plots----

# multi-panel plots

detach("package:BrailleR", unload=TRUE)

install.packages("cowplot")
library(cowplot)

# make several plots to combine
plot.diamonds <- ggplot(diamonds, aes(clarity, fill = cut)) + 
  geom_bar() +
  theme(axis.text.x = element_text(angle=70, vjust=0.5))

plot.cars <- ggplot(mpg, aes(x = cty, y = hwy, color = factor(cyl))) + 
  geom_point(size = 2.5)
  #labs(x= "City", y= "Highway", color="Cylinder")

plot.iris <- ggplot(data=iris, aes(x=Sepal.Length, y=Petal.Length, fill=Species)) +
  geom_point(size=3, alpha=0.7, shape=21)


# plot_grid
panel_plot <- plot_grid(plot.cars, plot.iris, plot.diamonds, 
                        labels=c("A", "B", "C"), ncol=2, nrow = 2)
panel_plot

# fix the sizes with draw_plot to specify the dimensions
fixed_gridplot <- ggdraw() + 
  draw_plot(plot.iris, x = 0, y = 0, width = 1, height = 0.5) +
  draw_plot(plot.cars, x=0, y=.5, width=0.5, height = 0.5) +
  draw_plot(plot.diamonds, x=0.5, y=0.5, width=0.5, height = 0.5) + 
  draw_plot_label(label = c("A","B","C"), x = c(0, 0.5, 0), y = c(1, 1, 0.5))

fixed_gridplot

# ---- Saving figures ----
#create new folder called "figures"
ggsave("figures/gridplot.png", fixed_gridplot) #saves .png, .jpeg, .tiff, .pdf, .bmp, or .svg

# scale to scale the image
# width and height let you specify the size of the image in units that you specify
# dpi can change the quality of the image (resolution); 700 dpi - pub quality

ggsave("figures/gridplot.png", fixed_gridplot, 
       width = 6, height = 4, 
       units = "in", dpi = 700)

# Plotly - interactive web applications
install.packages("plotly")

library(plotly)

plot.iris <- ggplot(data=iris, aes(x=Sepal.Length, y=Petal.Length, fill=Species)) +
  geom_point(size=3, alpha=0.7, shape=21)

plotly::ggplotly(plot.iris) 

