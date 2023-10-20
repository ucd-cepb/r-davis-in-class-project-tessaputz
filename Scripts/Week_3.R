

########## Conditional Subsetting

weight_g <- c(21, 34, 39, 54, 55)
weight_g[c(T,F,T,F,F)]
weight_g[c(T,F,T,F,T)]
weight_g >50
weight_g[weight_g >50]

weight_g[weight_g <30 | weight_g >50]

weight_g[ 30 < weight_g <50] #doesn't work, need to sep


#### %in%

animals <- c("mouse", "rat", "dog", "cat")

animals[animals=="cat"| animals=="rat"]

animals 
  c("rat","rat","rat","rat","rat")

animals %in% c("rat","cat","dog","duck","goat")

c("rat","cat","dog","duck","goat") %in% animals 

animals[animals %in% c("rat","cat","dog","duck","goat")]



####### Other Data Structures #######

## lists

list(4,letters, "dog")
my_list <- list(4,letters, "dog")
length(my_list)
str(my_list)
class(my_list[[2]])

## Matrices

my_mat <- matrix(1:5,nrow=10, ncol=10)
my_mat[7,4]

## Array

vector1 <- c(5,9,3)
vector2 <- c(10,11,12,13,14,15)
my_array <- array(c(vector1,vector2),dim = c(3,3,2))


my_na <- c(NA,NULL, NA, 1:3)
is.na(my_na)



####### Factors ########

response <- factor(c("yes", "no", "maybe", "no", "maybe"))
class(response)
typeof(response)
levels(response)
nlevels(response)
str(response)
response <- factor(response, level=(c("yes","no","maybe")))
as.character(response)
year_fct <- factor(c(1990,1983,1997,1998))
as.numeric(year_fct)
as.numeric(as.character(year_fct))
response
levels(response)[1] <- "YES"
levels(response) <- c("YES", "NO","MAYBE")





