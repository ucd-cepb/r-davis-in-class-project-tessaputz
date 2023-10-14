
# lists

list(4,6, "dog") # elements
list(4,letters, "dog") #base r object
my_list <- list(4,letters, "dog")
length(my_list)
str(my_list) 
length(my_list[[2]])
single <- my_list[2]
double <- my_list[[2]]
class(double)
# data.frame

letters
data.frame(letters)
my_df <- data.frame(letters)
#what functions could we use to learn more
length(my_df) #number of columns
dim(my_df2)
my_df2 <- data.frame(letters,letters) #fixed column names
dim(my_df2)
#can be different types of data
data.frame(letters,1) #limited recycling
data.frame(letters,1:3) #doesn't work
data.frame(letters,x=3)

# matrix

matrix(nrow = 10, ncol = 10)
matrix(1:10,nrow = 10, ncol = 10)
matrix(c(2,4),nrow = 10, ncol = 10)
my_matrix <- matrix(1:10,nrow = 10, ncol = 10)
my_matrix[,]

#array

array(x,y,z)
vector1 <- c(5,9,3)
vector2 <- c(10,11,12,13,14,15)
my_array <- array(c(vector1,vector2),dim = c(3,3,2))
array[,,]

# factors

response <- factor(c('no', 'yes', 'maybe','no', 'maybe', 'no'))
class(response)
levels(response)
nlevels(response)
str(response)
typeof(response)
response <- factor(response, levels = c("no","yes","maybe"))

as.character(response)

year_fact <- factor(c(1900, 1983, 1977, 1998, 1900))

as.numeric(year_fact)
as.numeric(as.character(year_fact))
levels(response)[1] <- "NO"
levels(response) <- c("NO", "YES", "MAYBE")














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


list(4,6, "dog")



## Data Frames




## Matrices

matrix(nrow=10, ncol=10)


## Array

vector1 <- c(5,9,3)
vector2 <- c(10,11,12,13,14,15)
my_array <- array(c(vector1,vector2),dim = c(3,3,2))


####### Factors ########

response <- factor(c("yes", "no", "maybe", "no", "maybe"))
class(response)
typeof(response)
levels(response)
nlevels(response)
str(response)
response <- factor(response, level=(c("yes","no","maybe")))
