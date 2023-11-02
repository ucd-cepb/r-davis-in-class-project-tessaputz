library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")
colnames(surveys)
# create new dataframe - surveys_wide:
# column for genus and a column named after every plot type
# columns contain mean hindfoot length of animals in both that plot type and genus
# sorted by plot type

surveys_wide <- surveys %>% 
  filter(!is.na(hindfoot_length)) %>% 
  group_by(genus,plot_type) %>% 
  summarize(hf_mean=mean(hindfoot_length)) %>% 
  pivot_wider(names_from = plot_type, 
              values_from = hf_mean) %>% 
  arrange(-Control)



# Using surveys dataframe create new column of weight categories:
# “small” <= 1st quartile of weight distribution
# “medium” is between the 1st and 3rd quartile
# “large” is any weight greater than or equal to the 3rd quartile

# ifelse()
summary(surveys$weight)

surveys_ifelse <- surveys %>% 
  mutate(weight_cat = ifelse(weight <= 20,"small",
                             ifelse(weight >20 & 
                                weight<48, "medium", "large")))
surveys_no20 <- surveys %>% 
  mutate(weight_cat = ifelse(weight <= 20,"small",
                             ifelse( 
                                      weight<48, "medium", "large")))
#testing if we need the weight >20, looks like ok here
surveys_no20 %>% 
  select(weight,weight_cat) %>% 
  group_by(weight_cat) %>% 
  summarize(min(weight,na.rm=T),max(weight,na.rm = T))

# case_when()

surveys_when <- surveys %>% 
  mutate(weight_cat = case_when(
    weight <= 20 ~"small",
    weight >20 & weight<48 ~ "medium",
    weight >= 48 ~"large",
  ))

surveys_when %>% 
  select(weight,weight_cat)

# soft code the values of the 1st and 3rd quartile into conditional statements

sum <- summary(surveys$weight)
sum[[2]]
class(sum)

surveys_when <- surveys %>% 
  mutate(weight_cat = case_when(
    weight <= sum[[2]] ~"small",
    weight >sum[[2]] & weight<sum[[5]] ~ "medium",
    weight >= sum[[5]] ~"large",
  ))
