

######Mutate 

library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv")

survey2 <- surveys %>% 
mutate(weight_kg = weight/1000)

surveys %>% 
  filter(!is.na(weight)) %>% 
  mutate(weight_kg = weight/1000,
         weight_kg2 = weight_kg*2)

##### Group by & summarize

group1 <- surveys %>% 
  group_by(sex) %>% 
  summarize(mean_weight = mean(weight,na.rm = T))

group1 <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(sex,species_id) %>% 
  summarize(mean_weight = mean(weight),
            min_weight = min(weight))

group2 <- surveys %>% 
  group_by(sex,species_id) %>% 
  summarize(mean_weight = mean(weight,na.rm=T))
