

######Mutate 

library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv")

survey2 <- surveys %>% 
mutate(weight_kg = weight/1000)

surveys %>% 
  filter(!is.na(weight)) %>% 
  mutate(weight_kg = weight/1000,
         weight_kg2 = weight_kg*2)






