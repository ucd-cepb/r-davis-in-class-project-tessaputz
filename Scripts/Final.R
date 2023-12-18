library(tidyverse)
flights <- read_csv("data/nyc_13_flights_small.csv")
planes <- read_csv("data/nyc_13_planes.csv")
weather <- read_csv("data/nyc_13_weather.csv")

colnames(flights); colnames(planes);colnames(weather)

## joining starting with largest dataframe
flight_planes <- left_join(flights,planes) # joined on all similar columns but need to be careful with this if columns have similar names...

colnames(flight_planes)
## second joining with next dataframe
planes_weather <- left_join(flight_planes, weather) 
glimpse(planes_weather)

####### Part 1: figure of departure delay against precip w regression line
depart_precip_plot <- 
  planes_weather %>% 
  filter(!is.na(precip) & !is.na(dep_delay)) %>% 
  ggplot(aes(precip,dep_delay))+ 
  geom_point()+
  geom_smooth(method="lm")+
  labs(x="Precipitation (in)",
      y="Depature Delay (min)")+
    theme_classic()

#dir.create("plots") - creating plot folder in working directory
ggsave("plots/delay_precip.png", depart_precip_plot,
       width = 6, height = 5, units = "in")

###### Part 2: figure of mean departure delay by date for Sep-Nov

str(planes_weather$dep_delay) #negative numbers are not ideal but will leave for now

depart_date_plot <- 
  planes_weather %>% 
  filter(!is.na(dep_delay) & month %in% 9:12 ) %>%
  mutate(date = ymd(paste0( #creating date column
    year,"-", 
    month, "-", 
    day))) %>% 
  group_by(carrier, date) %>% 
  summarize(mean_delay = mean(dep_delay)) %>% 
  #plotting
  ggplot(aes(date,mean_delay))+
  geom_point(aes(color=carrier), show.legend = F)+
  facet_wrap(~carrier)+
  labs(x="Date", y="Mean Departure Delay (min)")+
  theme_classic()
  
ggsave("plots/mean_delay_date.png", depart_date_plot)

##### Part 3: data frame of mean temp by date for each airport (origin)
mean_temp <- 
  planes_weather %>% 
  mutate(date = ymd(paste0(
    year,"-", 
    month, "-", 
    day))) %>% 
  group_by(origin, date) %>% 
  summarize(mean_temp = mean(temp,na.rm=T))

write_csv(mean_temp,"data/mean_temp_by_origin.csv")

##### Part 4: time conversion function

time_conversion <- function(time,type="min"){ #condition is type (hours if not min)
  time_converted <- ifelse(type == "min", time/60, time*60)
  return(time_converted)
}

## save function as a new R script
save(time_conversion, file = "scripts/customFunctions.R")

# testing converting departure delay to hours
time_conversion(time=planes_weather$dep_delay) 

# ifelse() is not vectorized (other ways to do this can be!) so need a function to apply to whole column:
sapply(planes_weather$dep_delay,time_conversion)
## or tidyverse version:
planes_weather$dep_delay %>% map_dbl(time_conversion) 

#create new departure delay column and plot
planes_weather %>% 
  filter(!is.na(dep_delay)) %>% 
  mutate(dep_delay_hrs =
            map_dbl(dep_delay,time_conversion)) %>% 
  ggplot( aes(x = dep_delay_hrs, y = carrier, fill = carrier)) + #basic plot
  geom_boxplot()

####### Part 5: updates to box plot

planes_weather %>% 
  filter(!is.na(dep_delay)) %>% 
  mutate(dep_delay_hrs =
           map_dbl(dep_delay,time_conversion)) %>% 
  ###### figure improvements
  ggplot( aes(x = carrier, y =dep_delay_hrs)) + #flipping axes
  geom_boxplot(aes(fill=carrier),show.legend = F)+ #remove legend
  labs(x="Carrier", y="Departure Delay (hours)")+ # label axes
  scale_fill_viridis_d()+
  ylim(0,9)+ #adjusting limits of y axis to remove outliers and numbers less than 0
  theme_classic() 
