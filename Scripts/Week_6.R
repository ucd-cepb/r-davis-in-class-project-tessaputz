library(tidyverse) 

surveys_complete <- read_csv("data/portal_data_joined.csv") %>% 
  filter(complete.cases(.)) 


# ggplot(data = <DATA>, mapping = aes(<MAPPINGS>)) +  <GEOM_FUNCTION>()

ggplot(data = surveys_complete)

# add aes for mapping coordinates
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length))

####### add geom for shape
# geom_point() : scatter plots, dot plots, etc.
# geom_boxplot() : boxplots!
# geom_line() : trend lines, time series, etc.

ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point()

#can save as a object
surveys_plot <- ggplot(data = surveys_complete, 
                       mapping = aes(x = weight, y = hindfoot_length))

# to then add geom and test other additions
surveys_plot + 
  geom_point() 

####### adding plot elements

ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point()

#transparency
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1)
#color
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1, color ="blue") # or can use hexadecimal codes

ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1, fill ="blue") #doesn't work bc points can't be filled
## color grouped by species
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1, aes(color = species_id))
## can specify this in the ggplot function to be read by all layers
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length, color = species_id)) +
  geom_point(alpha = 0.1)

#### boxplots: categorical x continuous data

ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
  geom_boxplot() 
#fill vs. color
ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
  geom_boxplot(color="tomato")
ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
  geom_boxplot(fill="tomato")

#adding points
ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
  geom_boxplot(alpha = 0) +
  geom_jitter(alpha = 0.3, color = "tomato")

ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
  geom_jitter(alpha = 0.3, color = "tomato")+
  geom_boxplot(alpha = 0) 
  








