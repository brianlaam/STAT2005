# Chapter 1

# Download Links
# R: https://cran.r-project.org/
# RStudio: https://www.rstudio.com/
# Notepad++: https://notepad-plus-plus.org/
# Sublime Text: https://www.sublimetext.com/


# Getting started
3+7	# should be10
3*21	# should be 63

c(3,4,1,6)				# combining numbers into a vector
newvec <- c(3,4,1,6)	# assign the vector to newvec

demo(graphics)			# graphics demo


# Vector
x<-5:1
mode(x)				# display the mode of x
length(x)			# display the length of x

y<-x<2				# we can save the result to y
mode(y)

z<-c("a","b","c")	# character
mode(z)
length(z)


c(x,y)		# combining numeric with logical vectors becomes numeric
c(x,y,z)	# combining numeric, logical and character vectors


# Simple patterned vectors
seq(1, 21, by = 2)
rep(3, 12) 		# repeat the value 3, 12 times
rep(seq(2, 20, by = 2), 2) 
# repeat the pattern 2 4 ... 20, twice
rep(c(1, 4), c(3, 2)) # repeat 1, 3 times and 4, twice
rep(c(1, 4), each = 3) # repeat each value 3 times
rep(1:10, rep(2, 10)) # repeat each value twice

# Extracting elements from vectors
x<-1:5
x[3]
x[3:5]
x[c(1,3,5)]
x[x>3]

# Matrix
m<-matrix(1:12,nrow=3,ncol=4)	# 3 by 4 matrix filled in columnwise
matrix(1:12,nrow=3,byrow=T)  	# by row

m[2,]							# select 2nd row
m[,3]							# select 3rd column

m[2,3]							# select an element
m[1:2,2:4]						# select submatrix
m[-2,]							# exclude the second row

m1<-matrix(1:8,nrow=2)			# create a 2x4 matrix m1
m2<-matrix(1:6,nrow=3)			# create a 3x2 matrix m2
rbind(m,m1)						# combine m and m1 row-wise
cbind(m,m2)						# combine m and m2 column-wise


# Multidimensional Arrays
X <- array(data=1:24,dim=c(3,4,2))


# List
x<-1:3							# numeric vector
y<-c("a","b")					# character vector
z<-matrix(1:6,nrow=2)			# numeric matrix
w<-list(x,y,z)					# define a list
w								# display the list w

w[[1]]							# first component of w
w[[2]][2]						# second elements of the second component of w
w[[3]][1:2,2]					# element [1:2,2] of the third component of w
names(w)<-c("x","y","z")		# assign name to w

u<-unlist(w)					# change w into a character vector u
as.numeric(u)					# change w back to numeric, NA = missing value


# Data frmae
women$height[women$weight > 140]
with(women, weight/height)


# Creating data frame
member <- data.frame(
	name = c("Tom", "May"),
	age = c(22, 20)
)
member


# Factor
grp <- c("control", "treatment", "control", "treatment")
grp
grp <- factor(grp)
grp
as.integer(grp)

levels(grp)
levels(grp)[as.integer(grp)]

levels(grp) <- c("1","2")
grp == "1"

# Approximate storage of numbers
n <- 1:10
1.25 * (n * 0.8) - n

# Missing values and other special values
some.evens <- NULL 
# creates a vector with no elements
some.evens[seq(2, 20, 2)] <- seq(2, 20, 2)
some.evens

is.na(some.evens)
!is.na(some.evens)
some.evens[!is.na(some.evens)]


# Expressions and Operators
x<-4:1			# define a numeric vector
2*(x-1)			# operate on each element of x
x^2				# square each element of x

x<-4:1
x%%3			# modulus
x%/%3			# integer divide
x==1			# equality (note the double equal sign)
x!=2			# negation
(x>1)&(x<4)		# logical and
(x<=1)|(x>3)	# logical or


# Associativity
5%%3%/%2
(5%%3)%/%2
5%%(3%/%2)

2^3^2
2^(3^2)
(2^3)^2


# Example: Using built-in functions 
x<-sqrt(1:5)		# square root of 1 to 5
y<-c(-x,x)			# combine ¡Vx to x
y					# display y

options(digits=3)	# controls the number display
(y<-sort(y))		# sort y in ascending order and display

trunc(y)			# truncated y
round(y)			# round
ceiling(y)			# ceiling
floor(y)			# floor

(z<-1:5)			# create z and display, a useful short-cut
cumsum(z)			# cumulative sum
cumprod(z)			# cumulative product

mean(sqrt(y))		# NaN means Not a Number

which(y>=0)			# return index in y which >=0
y[which(y>=0)]		# select elements in y whcih >=0
mean(sqrt(y[which(y>=0)]))	# compute the mean of square root of elements in y which >=0
