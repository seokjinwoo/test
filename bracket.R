 x <- c(1,123,534,13,4) #combine
 y <- seq(201.250,11)   #sequence
 z <- rep("Hi!",3)      #replicate
 
 w <- c("a","b","c","d","e")

 w[1] 
w[-1] 

w[c(1,3,5)]
w[-3:-5]






# while & for-loop

counter <- 1
while(counter < 12) {
  print(counter)
  counter <- counter + 1
}

# for-loop is a little bit different in terms of indexing

for(i in 1:5){
  print("Hello R")
}


for(i in rnorm(10)){
  print("Hello R")
}



# law of large numbers

N <- 100
counter <- 0

for(i in rnorm(100)) {
  
  if( i > -1 & i < 1 ) {
    counter <-  counter + 1
  }
  
}

answer <- counter / N

print(paste("mean=", answer))


# vectorized operations
# recycling of vectors when two vectors are not conformable.
# You may receive some warnings

a <- c(1,2,3,4,5)
b <- c(5,6,7,8,9)

c <- a + b
d <- a*b
e <- a/b

x <- rnorm(5)

x


# This R-specific loop is similar to foreach in Stata
for (i in x) {
  
  print(i)
}

print(x[1])
print(x[2])
print(x[3])
print(x[4])
print(x[5])

# More conventional programming loop
for (j in 1:5) {
  print(x[j])
  
}


# 2nd part

N <- 100

a <- rnorm(N)
b <- rnorm(N)

# vectorized approach

c <- a*b

# De-vectorized approach
d <- rep(NA,N)

for (i in 1:N) { # It takes longer to execute the commands
  d[i] <- a[i]*b[i]
}

# functions

?rnorm
rnorm(5,10,8)
rnorm(5,mean=10,sd=8)

?seq

x <- c("a","b","c")
seq(from=10, to=20, by=3)

seq(from=10, to=20, length.out = 100)

seq(from=10, to=20, along.with = x)
A <- seq(from=10, to=20, along.with = x)



rep(5:6, times = 10)
rep(5:6, each = 10)
rep(x, each=5)
rep(x, times=5)

#packages
# install.packages("ggplot2")

library(ggplot2)

# basketball project
# Salary
# Games
# MinutesPlayed

# building matrix
?matrix

my.data <- 1:20
my.data

A <- matrix(my.data, 4, 5)
A

A[1,]
A[2,3]

B <- matrix(my.data, 4 ,5, byrow = T)
B

# rbind()

r1 <- c("I", "am", "happy")
r2 <- c("what", "a", "day")
r3 <- c(1,2,3)

C <- rbind(r1,r2,r3)
C


# Naming dimensions

Charlie <- 1:5
Charlie

names(Charlie) <- c("a","b","c","d","e")

Charlie
Charlie["d"]
names(Charlie)

names(Charlie) <- NULL

temp.vec <- rep( c("a","b","c") , times = 3  )
temp.vec

temp.vec <- rep( c("a","b","c") , each = 3  )
temp.vec


Bravo <- matrix(temp.vec, 3, 3)
Bravo

rownames(Bravo) <- c("How","are","you?")
colnames(Bravo) <- c("X","Y","Z")

Bravo


# Analysis
Games
rownames(Games)
colnames(Games)

Games["LeBronJames", "2012"]

FieldGoals

FieldGoals / Games

round(FieldGoals / Games,1)

round(MinutesPlayed / Games)


# plotting

FieldGoals

matplot(t(FieldGoals/FieldGoalAttempts), type = "b", pch = 15:18, col=c(1:4,6))
legend("bottomleft", inset = 0.01, legend = Players, pch =15:18,col=c(1:4,6), horiz = F)


# subsets
Games

Games[1:3, 6:10]
Games[c(1,10),]
Games[,c("2008","2009")]
Games[1,]
is.matrix(Games[1,])
is.vector(Games[1,])

Games[1,,drop=F]
Games[1,5, drop=F]

# visualinzing subsets
Data <- MinutesPlayed[1,,drop=F]
matplot(t(Data), type = "b", pch = 15:18, col=c(1:4,6)) #input data must be matrix here.
legend("bottomleft", inset = 0.01, legend = Players[1], pch =15:18,col=c(1:4,6), horiz = F)


# Create function (setting default values)

myplot <- function(data, rows=1:10){
  Data <- data[rows,,drop=F]
  matplot(t(Data), type = "b", pch = 15:18, col=c(1:4,6)) #input data must be matrix here.
  legend("bottomleft", inset = 0.01, legend = Players[rows], pch =15:18,col=c(1:4,6), horiz = F)
}

myplot(MinutesPlayed/Games, 1:3)

myplot(Points)
myplot(Points/Games)
myplot(Salary)
myplot(Salary/Games)


# data.frame

# Method 1: select fule manuallly

stats <- read.csv(file.choose())
stats

# set WD and read data
getwd()
setwd("D:\\Dropbox\\R_practice\\udemy")
getwd()

stats <- read.csv("DemographicData.csv")
stats

nrow(stats) # imported 195 rows


ncol(stats) # imported 5 columns

head(stats) # top 6 rows along with column names

tail(stats)

str(stats) # structure of data

summary(stats)

#------------------------------------- Using the $ sign

stats
head(stats)
stats[3,3]
stats[3,"Birth.rate"]

stats$Internet.users
stats$Internet.users[2]
stats[,"Internet.users"]

levels(stats$Income.Group)

#------------------------------------- 

is.data.frame(stats[1,]) #no need for drop = F
stats[,1]
is.data.frame(stats[,1])
is.data.frame(stats[,1, drop=F])

# multiply
head(stats)

stats$Birth.rate * stats$Internet.users

stats$calc <- stats$Birth.rate * stats$Internet.users

head(stats)

# test of knowledge
stats$xyz <- 1:5

head(stats, n=12)

#remove a column
head(stats)
stats$calc <- NULL
stats$xyz <- NULL

head(stats, n= 10)

#------------------------------------- filtering data frames

head(stats)

filter <- (stats$Internet.users < 2)
stats[filter,]

stats[stats$Birth.rate >40 & stats$Internet.users < 2,]

stats[stats$Income.Group == "High income" ,]


stats[stats$Country.Name == "Malta",]


#------------------------------------- Graphics
library(ggplot2)

?qplot

qplot(data = stats, x = Internet.users)

qplot(data = stats, x = Income.Group, y = Birth.rate)
qplot(data = stats, x = Income.Group, y = Birth.rate, size = I(3))
qplot(data = stats, x = Income.Group, y = Birth.rate, size = I(3), colour=I("blue"))

qplot(data = stats, x = Income.Group, y = Birth.rate, geom="boxplot")

#------------------------------------- Visualizing with new split

qplot(data = stats, x = Internet.users, y = Birth.rate)

qplot(data = stats, x = Internet.users, y = Birth.rate
      , colour = Income.Group, size = I(2))



#------------------------------------- Creating Data frames

mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)

head(mydf)

colnames(mydf ) <- c("Country", "Code", "Region")

head(mydf)


mydf <- data.frame(Country = Countries_2012_Dataset, Code = Codes_2012_Dataset,
                   Region = Regions_2012_Dataset)
head(mydf)


summary(mydf)

#------------------------------------- Mergeing data frames

head(stats)
head(mydf)

merged <- merge(stats, mydf, by.x = "Country.Code", by.y = "Code")
head(merged)

merged$Country <- NULL
str(merged)
tail(merged)


qplot(data = merged, x = Internet.users, y = Birth.rate)

qplot(data = merged, x = Internet.users, y = Birth.rate,
      colour = Region)

qplot(data = merged, x = Internet.users, y = Birth.rate,
      colour = Region, size = I(2), shape= Region)

qplot(data = merged, x = Internet.users, y = Birth.rate,
      colour = Region, size = I(2), shape= I(19))

# Transparency
qplot(data = merged, x = Internet.users, y = Birth.rate,
      colour = Region, size = I(2), shape= I(19),
      alpha = I(0.6))

# Title
qplot(data = merged, x = Internet.users, y = Birth.rate,
      colour = Region, size = I(2), shape= I(19),
      alpha = I(0.6),
      main = "Birth rate vs. Internet users")


#------------------------------------- Movie rating 

movies <- read.csv("Movie-Ratings.csv")
head(movies)

colnames(movies) <- c("film", "genre", "criticrating","audiencerating","budgetmillions","year")

head(movies)
str(movies)

levels(movies$genre)

summary(movies)

# factor

factor(movies$year)

movies$year <- factor(movies$year)

str(movies)
summary(movies)

# aesthetics

ggplot(data = movies, aes( x=criticrating, y=audiencerating)) 

ggplot(data = movies, aes( x=criticrating, y=audiencerating)) + 
  geom_point()

# add color, size

ggplot(data = movies, aes( x=criticrating, y=audiencerating, colour = genre, size = budgetmillions)) + 
  geom_point()

# plotting with layers

p <- ggplot(data = movies, aes( x=criticrating, y=audiencerating, colour = genre, size = budgetmillions)) 
  

p + geom_point()

p + geom_line()

p+ geom_line()  + geom_point() 
 


#------------------------------------- Law of Large Numbers with ggplot

library(ggplot2)

n = 1000     # the number of 

x_n <- c(NULL,100)
t <-c(1:n)




for (i in 1:n) {
  

  counter = 0

  for (x in rnorm(i)) {
  
    if(x>-1 & x<1){
    
      counter <- counter + 1
    
    }
  
  }

  x_n[i] <- counter/i

}

mydf <- data.frame(t, x_n)


ggplot(data=mydf,aes(t,x_n)) + 
  geom_line(colour = "green", alpha = 1.0) +
  xlab("number of trials") +
  ylab("percentage")


