library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv")

surveys %>%
  filter(.,weight < 5) %>%
  select(.,species_id, sex, weight)

#with pipes
surveys %>%
  filter(weight < 5)
#same as with no pipes:
filter(.data=surveys,weight < 5)

surveys %>%
  filter(weight > 30 & weight < 60)

### series
1983:1985
#is the same as:
c(1983, 1984, 1985)

filter(surveys, year %in% 1983:1985)

