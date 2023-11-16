library(tidyverse)
gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv") 
colnames(gapminder)

# create new figure: country by change in population between 2002-2007 and grouped by continents

# what variables do we need? what are we calculating? ----

# vars: country, pop change (calculating) => year, continent

# dataframe ----
#1. population difference between 2002 and 2007 for each country: rows of countries with column for both 2002 pop & 2007 pop

data <- gapminder %>%
  filter(year == 2002 | year==2007) %>% 
  select(country,year,pop, continent) %>% 
  pivot_wider(names_from = year, values_from = pop) %>% 
  mutate(pop_change = `2007`-`2002`) #note the accent as quote!

data

# plotting the data ---- 
# basic plot
data %>%
  filter(continent != "Oceania" ) %>% 
  ggplot(aes(x = country, y = pop_change)) +
  geom_col(aes(fill=continent))+
  facet_wrap(~continent)

# 1.order country by increase in pop change 2.different axes by facet, 3. color & theme, 4.Axis labels and legend

data %>%
  filter(continent != "Oceania" ) %>% 
  #reordering to sort by increase in population change
  ggplot(aes(x = reorder(country,pop_change), y = pop_change)) +
  geom_col(aes(fill=continent))+
  facet_wrap(~continent, scales = "free")+
  scale_fill_viridis_d(option ="C")+
  theme_classic()+
  labs(x = "Country", y = "Population Change Between 2002 and 2007")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1), 
        legend.position = "none")
  

unique(data$continent)
# if we wanted to reorder the continents
data$continent <- factor(data$continent, levels=c("Asia","Africa","Europe","Americas","Oceania"))

#run the plot again to update the order
data %>%
  filter(continent != "Oceania" ) %>% 
  ggplot(aes(x = reorder(country,pop_change), y = pop_change)) +
  geom_col(aes(fill=continent))+
  facet_wrap(~continent, scales = "free")+
  scale_fill_viridis_d(option ="C")+
  theme_classic()+
  labs(x = "Country", y = "Population Change Between 2002 and 2007")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1), 
        legend.position = "none")
