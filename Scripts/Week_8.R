# ---- Creating Functions ----

# write a simple function to add two numbers
my_sum <- function(a, b) {
  the_sum <- a + b
  return(the_sum)
}

my_sum(a=2,b=2)
my_sum(2,3)

# providing argument defaults
my_sum2 <- function(a = 1, b = 2) {
  the_sum <- a + b
  return(the_sum) 
}
my_sum2()
my_sum2(a=3)

# ---- process to write your own function ----

# temperature conversion example: Fahrenheit to Kelvin

((50- 32) * (5/ 9)) + 273.15


#How to write a function:
#1. Identify what piece(s) will change within your commands -- this is your argument
#2. Remove it & replace with object(s) name(s)
#3. Place code & arguments into the function() function

F_to_K <- function(tempF){
K <- ((tempF- 32) * (5/ 9)) + 273.15
return(K)
}

F_to_K()

#Pass-by-value: changes or objects within the function only exist within the function.

# freezing point of water: 32 F to??

# boiling point of water: 212 F to ??



# ---- using dataframes in functions ----

#calculate the average GDP in a given country, in a given span of years, using the gapminder data

library(tidyverse)
gapminder <- read.csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")

gapminder %>% 
  filter(country == "Canada", year %in% c(1950:1970)) %>% 
  summarize(meanGDP = mean(gdpPercap, na.rm = T))

# but what if you wanted to do this for multiple different countries? Or years? 
# turn it into a function! 

avgGDP <- function(cntry,yr.range){
  df <- gapminder %>% 
    filter(country == cntry, year %in% c(yr.range)) %>% 
    summarize(meanGDP = mean(gdpPercap, na.rm = T))
  return(df)
  }
avgGDP("Iran",1980:1985)

## plotting example
surveys <- read_csv("data/portal_data_joined.csv")

surveys %>% 
  filter(species_id == "PE" & !is.na(weight) & !is.na(hindfoot_length)) %>% 
  ggplot(aes(x=weight, y=hindfoot_length))+
  geom_point(alpha=.5)+
  labs(x="Weight", y="Hindfoot length", title = "PE weight x hindfoot")
  
surveys %>% 
  filter(species_id == "PL" & !is.na(weight) & !is.na(hindfoot_length)) %>% 
  ggplot(aes(x=weight, y=hindfoot_length))+
  geom_point(alpha=.5)+
  labs(x="Weight", y="Hindfoot length", title = "PL weight x hindfoot")

surveys %>% 
  filter(species_id == "SH" & !is.na(weight) & !is.na(hindfoot_length)) %>% 
  ggplot(aes(x=weight, y=hindfoot_length))+
  geom_point(alpha=.5)+
  labs(x="Weight", y="Hindfoot length", title = "SH weight x hindfoot")

# instead of copying and pasting make a function!

#----
plot_fx <- function(SPECIES,PLOTTITLE) {
  surveys %>% 
  filter(species_id == SPECIES & !is.na(weight) & !is.na(hindfoot_length)) %>% 
  ggplot(aes(x=weight, y=hindfoot_length))+
  geom_point(alpha=.5)+
  labs(x="Weight", y="Hindfoot length", title = PLOTTITLE)
}

plot_fx("SH", "SH weight x hindfoot")
plot_fx("SH") #give a default title 
