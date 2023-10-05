weight_g <- c(50, 60, 65, 82)
weight
weight_g
animals <- c("mouse", "rat","dog")
animals
dog <- "Olive the border collie mix"
length(weight_g)
length(animals)
class(weight_g)
class(animals)
str(weight_g)
str(animals)
weight_g <- c(weight_g, 90)
weight_g
weight_g <- c(30, weight_g)
weight_g

TRUE
class(TRUE)
class(FALSE)
TRUE -1
FALSE -1

typeof(weight_g) 

#challenge - coercion, what do you think will happen
num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")

class(tricky) #why do you think this happens?

num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
combined_logical <- c(num_logical, char_logical)
## how many true values?
class(combined_logical) 

animals <- c("mouse", "rat", "dog", "cat")
animals[2]
animals[2,3]
animals[c(2,3)]

animals[c(3,2,1,4)]

weight_g <- c(21,34,39,54,55)
weight_g[c(TRUE,FALSE,FALSE,FALSE,FALSE)]
weight_g[c(T,F)]
weight_g>50
weight_g[weight_g>50]

weight_g[weight_g<30 | weight_g>50]

weight_g[weight_g>=30 & weight_g == 21]
weight_g

#Can you figure out why "four" > "five" returns TRUE?
  
  
  








