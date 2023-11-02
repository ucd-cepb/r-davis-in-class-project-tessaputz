
library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv")

# ---- joining data ----

tail <- read_csv("data/tail_length.csv")
view(tail)
#merge because of shared column
summary(surveys$record_id) #just summarize the record_id column by using the $ operator 
summary(tail$record_id)

# join_type(x = FirstTable, 
#           y = SecondTable, 
#           by=columnTojoinBy)

?left_join

surveys_joined <- left_join(surveys, tail) 
surveys_joined <- left_join(surveys, tail, by = "record_id") 

# --- pivoting (reshaping) data ----

# creating a summary table to compare different mean weights of each species among plots
surveys_weight <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(genus, plot_id) %>% 
  summarize(mean_weight = mean(weight))

surveys_weight #196 x 3 hard to look at, shape to be wider: genus x plot with mean weights inside

# ---- pivoting wider: increasing columns & decreasing rows ----

# how many rows and columns?
unique(surveys_weight$genus)
length(unique(surveys_weight$genus)) 
n_distinct(surveys_weight$genus) #10 unique genus -- rows
n_distinct(surveys_weight$plot_id) #24 plot ids -- columns

#pivot_wider(data,
#           names_from= column to create new column names
#           values_from= column to fill values inside table cells)

wide_survey <- surveys_weight %>% 
  pivot_wider(names_from = "plot_id", values_from =  "mean_weight")

head(wide_survey)

# ---- pivoting longer:increasing rows & decreasing columns ----


#pivot_longer(data,
#           cols = columns to stack
#           names_to = new column name to store old/wide column names
#           values_to = new column name to store old/wide column values)

surveys_long <- wide_survey %>% 
  pivot_longer(col = -genus, names_to = "plot_id", values_to = "mean_weight")
# don't need names to and values to, can also select columns in different way
surveys_long <- wide_survey %>% 
  pivot_longer(cols = 2:25)

surveys_long
#not the same as the initial df we were working with? added NAs when pivoted wide and kept when pivoted longer
surveys_weight

surveys_long <- surveys_long %>% 
  filter(!is.na(mean_weight))

##### Exporting data -finished 11/2

data("iris") #sample dataset
dir.create("data_output")
write_csv(surveys_wide,file = "data_output/iris.csv")









