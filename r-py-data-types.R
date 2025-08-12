#Making vectors!

# character vector; vectors can have any length but must always have elements of the same time 
dogs <- c("teddy", "khora", "waffle", "banjo")
class(dogs) #to check for the data type
typeof(dogs) #get the same answer as the line above

#numeric vector; didn't specify integer so not stored as an integer
weights <- c(50, 55, 25, 35) #can also see class of data in the environment
class(weights) #gives numeric
typeof(weights) #gives double; within numeric there is a whole other type

#integer vector
dog_age <- c(5L, 6L, 1L, 7L)
class(dog_age)
typeof(dog_age) #reports the same again; integer kind of a class on its own
#we care more about class, because that's what controls if data can be stored in the same vector

is.numeric(dog_age)

#what happens when we combine classes
dog_info <- c("teddy", 50, 5L)
class(dog_info) #get back character, because it is the most flexible; denoted within quotes

#named elements
dog_food <- c(teddy = "purina",
              khora = "alpo",
              waflle = "fancy feast",
              banjo = "blue diamond") #for commands and variable names, R knows you don't need it in quotes
class(dog_food)
dog_food #kind of looks like it has rows and columns, but still a vector (1d)

#accessing bits of vector; can use position or name
dog_food[2] #square brackets mean indexing
dog_food["khora"] #can also use names if elements are named
dog_food[1:3] #can do a range

#warm up to for loops
i <- 4
dog_food[i] #accessing data in i position, which we can change (passing a variable as your index)

#key points:
  # can index by positions
  # can define positions with variables


#overwrite data directly using indexing
dog_food[1] <- "BURRITOS"
dog_food

#matrices (2 dimensional!)
fish_size <- matrix(c(0.8, 1.2, 0.4, 0.9), 
                    ncol = 2, nrow = 2, byrow = FALSE)
fish_size #is stored under "data" in environment, instead of "values," where all our vectors are
typeof(fish_size)
class(fish_size) #tells us about structure of matrix, as opposed to the type of data in it

fish_size[1,2] #look in first row, second column
fish_size[1,] #everything in first row (leave column value blank)
fish_size[,2] #same but with columns (will return everything in the second column)

#making lists
urchins <- list("blue", 
                c(1,2,3),
                c("a cat", "a dog"),
                5L) #have to use a function to put all separate VECTORS (those are the elements) into one place
urchins #each element/vector also don't have to be the same length; will also maintain data types/classes

#access data in a list
#indexing into vector
urchins[2] #goes down and finds second vector; will print out whole vector
#indexing into elements of vectors
urchins[[2]]

#create a list with names
tacos <- list(toppings = c("onion", "cilantro","guacamole"),
              filling = c("beans", "meat", "veggies"),
              price = c(6.75, 8.25, 9.50))
tacos[[2]]
tacos$filling #dataframes are made up of vectors; they're just special versions of lists

#data frames
fruit <- data.frame(type = c("apple", "banana", "peach"),
                    mass = c(130, 195, 150))
fruit #all vectors line up together and mean something together (assumption of a dataframe); rows are individual observations
class(fruit)

fruit[1,] #indexes in the same way as matrices
fruit[2,1] <- "pineapple" #replaces banana with pineapple
fruit

#Select multiple elements
x <- 1:10
x[c(3,1,5)] #asking for the third, first, fifth elements (don't have to be in order)
x[c(1,1,1)] #can also duplicate values
x[c(1.2,5.3,7.2)] #truncates into integers and finds those positions

#exclude elements with negative integers
x[-10] #all the elements instead of the 10th one
x[-c(2,4,6,8,10)] #getting rid of the even ones (multiple elements)
x[c(-1,2)] #can't mix positive and negative vectors; creates an error

#index with logical vectors
x[c(TRUE, FALSE, FALSE, TRUE, FALSE,TRUE, FALSE, FALSE, TRUE, FALSE)] 
#true is keep, false is throw away

x[x>3] #don't see true/falses being generated, but it is what R is doing

x[] #returns original vector
x[0] #returns zero-length vector
x[11] #returns NA

# subsetting and assigning multiple values
x <- 1:5
x[c(1,2)] <- 2:3 #replacing values, have the give the same number that you subsetted 

x[-1] <- 4:1 #replaces everything EXCEPT what's in the first position (so need 4 values)

#subset rows in data frames based on conditions (logical subsetting)
mtcars[mtcars$gear == 5,] #will show us all the rows where the value in gear column is 5
mtcars[mtcars$gear == 5 & mtcars$cyl == 4, ]

#shorthand version using the subset function
subset(mtcars, gear == 5)
subset(mtcars, gear == 5 & cyl == 4)

#remove columns
df <- data.frame(x = 1:3,
                 y = 3:1,
                 z = c("a", "b", "c"))
df$z <- NULL #gets rid of column z!!
df <- df[c("x","y")] #subsetting df but without z (accomplishes same thing as the line before)
df[setdiff(names(df), "z")] #names() of a dataframe are the column names; this line finds difference between df and just column z, and then indexes the df without this difference (column "z")

setdiff() #find differences between two vectors, which inputted as arguments into this function

