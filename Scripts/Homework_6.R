library(tidyverse)

gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv") 

#1 calculate mean life expectancy on each continent. Then create a plot that shows how life expectancy has changed over time in each continent.
gapminder %>% 
  group_by(continent,year) %>% 
  summarize(mean_lifeEx = mean(lifeExp)) %>% 
  ggplot() + 
  geom_line(mapping=aes(x=year,y=mean_lifeEx, color = continent))+ #or could add to geoms
  geom_point(mapping=aes(x=year,y=mean_lifeEx), color = "black")


#2 What do you think the scale_x_log10() line of code is achieving? What about the geom_smooth() line of code?
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() + # base-10 logarithmic transformation of an axis to follow a normal distribution (reduce skewness)
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed')+  #adding regression (trend) line to summarize the relationship
  theme_bw()

#3 Create a boxplot that shows the life expectancy for Brazil, China, El Salvador, Niger, and the United States, with the data points in the background using geom_jitter. Label the X and Y axis with “Country” and “Life Expectancy” and title the plot “Life Expectancy of Five Countries”.

#countries <- c("Brazil", "China", "El Salvador", "Niger", "United States")

gapminder %>%
  filter(country %in% c("Brazil", "China", "El Salvador", "Niger", "United States")) %>%
  ggplot(aes(x = country, y = lifeExp)) +
  geom_jitter(alpha = 0.3, aes(color = country))+
  geom_boxplot(fill=NA) +
  theme_minimal() +
  ggtitle("Life Expectancy of Five Countries") +
  xlab("Country") + ylab("Life Expectancy") +
#  labs(x = "Country", y = "Life Expectancy", title = "Life Expectancy of Five Countries")+
  theme(plot.title = element_text(hjust = 0.5))



