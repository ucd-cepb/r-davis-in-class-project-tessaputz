library(tidyverse)
library(lubridate)

mloa <- read_csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")
#what time zone the data are reported, how missing values are reported in each column

mloa2 <-  mloa %>%
  # Remove NAs
  filter(rel_humid  != -99) %>%
  filter(temp_C_2m != -999.9) %>%
  filter(windSpeed_m_s != -999.9) %>%
  # Create datetime column using the year, month, day, hour24, and min columns
  mutate(datetime = ymd_hm(
                    paste0(year,"-",
                           month,"-",
                           day,"-",
                           hour24,":",
                           min,
                           tz="UTC")
    
  )) %>%
  
  # Convert to local time
  mutate(datetimeLocal = with_tz(datetime, tzone="Pacific/Honolulu"))

glimpse(mloa2)

## calculate the mean hourly temperature for each month and plot----
 mloa2 %>%
  # Extract month and hour from local time column
  mutate(localMon = month(datetimeLocal,label=T) ,
         localHour = hour(datetimeLocal)) %>%
  # Calculate mean temperature by local month and hour
 group_by(localMon, localHour) %>% 
  summarize(mean_temp = mean(temp_C_2m)) %>% 
  # Plot local month by mean temp
  ggplot(aes(x = localMon,
             y = mean_temp)) +
  # Color points by local hour
  geom_point(aes(color=localHour)) +
  # Use a nice color ramp
  scale_color_viridis_c() +
  # Label axes, add a theme
  labs(x="Month", y="Mean Temp in C", color="Hour")+
  theme_classic()

#robert notes:
m = mloa2[,c("temp_C_2m", "rel_humid")]
m[m <- -99] <- NA # then could filter out NAs instead
