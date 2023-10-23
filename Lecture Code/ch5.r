# Chapter 5

# Error handling
f2c_err <- function(low,up,step) {	# f2c with error handling 
  
# error checking 
	if (low>up) stop ("Error: first arg. > second arg.")	# check if low<=up
	if (step<=0) stop ("Error: last arg. <= 0")		# check if step>0

	f<-seq(low,up,step)	# create vector f
	c<-(5/9)*(f-32)		# compute vector c from f
	cbind(f,c)			# combine f and c and output
}  

f2c_err(200,0,20)
f2c_err(0,200,-20)

# Warning
f2c_warn <- function(low,up,step) {	# f2c with auto-cprrect and warning 
# error checking 
	if (low>up) {
		temp <- low # swap the values
		low <- up
		up <- temp
		warning("Swapped first arg. and second arg.")	
	}
	if (step<0) {
		step <- -step
		warning("Last arg. adjusted to be positive")	
	}
	if (step==0) {
		stop("Error: last arg. cannot be 0")	
	}

	f<-seq(low,up,step)	# create vector f
	c<-(5/9)*(f-32)		# compute vector c from f
	cbind(f,c)			# combine f and c and output
}  
f2c_warn(200,0,20)
f2c_warn(0,200,-20)
f2c_warn(0,200,0)


# User defined operator
"%+-%" <- function(x,s) { c(x-s,x+s) } 


# Replacement functions
"modify<-" <- function(x, position, value) {
	x[position] <- value
	x
}
x <- 1:10
modify(x,2) <- 5L
x

# it is equivalent to 
x<-"modify<-"(x,2,5L)


# Flexible number of arguments  
maxlen <- function (...) {					# define variable arguments
   arg <- list(...)							# save the argument list to arg
   mx <- 0									# initialize mx
   for (x in arg) mx <-max(mx,length(x))	# find max length
   mx 
}


# Saving multiple outputs from function
stat.v1<-function (x) {	# input vector x
  m<-mean(x)		# mean
  s<-sd(x)			# stdev
  med<-median(x)	# median
  min<-min(x)		# min
  max<-max(x)		# max
  c(mean=m,stdev=s,median=med,min=min,max=max)	 # output as a vector
}

stat.v2<-function (x) {	# input vector x
  m<-mean(x)		# mean
  s<-sd(x)			# stdev
  med<-median(x)	# median
  min<-min(x)		# min
  max<-max(x)		# max

  out<-list(m,s,med,min,max)	# save items to out and apply names
  names(out)<-c("mean","stdev","median","min","max")
  out							# display outputs
}


# Formatted input and output
y<-seq(0,3.4,0.1)		
# define sequence of y from 0 to 3.4 with step 0.1
x<-seq(0,0.09,0.01)	
# define sequence of x from 0 to 0.09 with step 0.01
z<-outer(y,x,"+")		
# save the table to z, where z(i,j)=y(i)+x(j)
options(digits=4)	# specify output display to 4 decimal place
t<-pnorm(z)			# compute the left tail and save them to t
t<-rbind(x,t)		# add the first row to t
y<-c(0,y)			# add a zero to y
cbind(y,t)			# output the table


# sprintf() 
sprintf("Pi is %f", pi)			
# output real number with default option = 6 decimal places
sprintf("%.3f", pi)		# with 3 decimal places
sprintf("%5.1f", pi)	
# fixed width=5 with 1 decimal places
sprintf("%-10f", pi) 	# left justified with fixed width=10
sprintf("%e", pi)		# scientific notation


# The cat function
x1<-matrix(1:16,ncol=4)
x2<-matrix(1:16,ncol=4,byrow=T)
y<-x1+x2	# y is a symmetric matrix	

# A function to print a symmetric matrix in lower triangular form
prtsym<-function(x) {  	# print a symmetric matrix in lower triangular form
	n1<-dim(x)[1]		# get the row dimension of x
	n2<-dim(x)[2]		# get the column dimension of x and check if it is square

	if (n1!=n2) stop("Input matrix is not a square matrix") 

	for (i in 1:n1) {	# check if x is symmetric
		for (j in 1:i) {
			if (x[i,j]!=x[j,i]) stop("Input matrix is not a symmetric matrix")
		}
	}

	for (i in 1:n1) {	# loop for i from 1 to n1
		for (j in 1:i) {	# nested loop for j from 1 up to i
			cat(sprintf("%2.0f", x[i,j]), "")	
			# print x[i,j] with an extra space after x[i,j]
		}
		cat("\n")			# print a carriage return, i.e. new line
	}
}

prtsym(y)

# The readline function
guess<-function() {					# guessing game between player A and B
	cat("I will randomly choose an integer x from 1 to 100.\n\n")   
	ans<-sample(1:100,size=1)		# generate an integer between 0 and 100
	p<-"A"							# initialize p, low and up
	low<-1
	up<-100   
	repeat {
		repeat {
			cat("Player",p,", please pick an integer from",low,"to",up,": ")
			inp<-readline()				# input
			inp<-as.numeric(inp)		# change to numeric
			if ((inp<=up)&(inp>=low))  break
			else cat("Number out of range!\n")
		}
		if (inp==ans) break				# inp=ans, lose game
		if (p=="A") p<-"B" else p<-"A"	# switch player
		if (inp>ans) up<-inp-1			# update up
		else low<-inp+1					# update low
	}
	cat("Player",p,"lose the game.\n")	# display end message
}   

# Sierpinski triangle
b1<-0			# set (b1,b2) to (0,0)
b2<-0							
g1<-1			# set (g1,g2) to (1,0)
g2<-0							
r1<-cos(pi/3)	
# set (r1,r2) to (cos(pi/3),sin(pi/3))
r2<-sin(pi/3)						
xy<-rbind(c(b1,b2),c(g1,g2),c(r1,r2))	
# form xy matrix for plotting
plot(xy,main="Sierpinski triangle",xlab="",ylab="")	
# plot 3 points
points(b1,b2,pch=21,bg="blue")
points(g1,g2,pch=21,bg="green")
points(r1,r2,pch=21,bg="red")
x0<-0.5			# initialize (x0,y0) to (0,5)
y0<-0.5

set.seed(1234)	# set random seed
n<-5000		# number of points
for (i in 1:n) {
	col<-sample(c("b","g","r"),prob=c(1/3,1/3,1/3),size=1)	
	# randomly pick a color
	if (col=="b") {		# color=blue
		x<-(x0+b1)/2	# mid-point between x0 and b
		y<-(y0+b2)/2
		points(x,y,pch=21,bg="blue")	# plot this point in blue
	}
	if (col=="g") {		# color=green
		x<-(x0+g1)/2	# compute mid-point bewtten x0 and g
		y<-(y0+g2)/2
		points(x,y,pch=21,bg="green")	# plot this point in green
	}
	if (col=="r") {		# color=red
		x<-(x0+r1)/2	# compute mid-point between x0 and r
		y<-(y0+r2)/2
		points(x,y,pch=21,bg="red")		# plot this point in red
	}
	x0<-x				# update x0
	y0<-y				# update y0
} 


# Recursive function
fac<-function(n){		# factorial function, assume n is an integer > 0
	if (n<=2) 
		return(n)		
	else
		return(n*fac(n-1))	# fac calls itself; fac(n)=n*fac(n-1)
}  

# Exercise
fac1<-function(n){
	if (n==0)
		return(1)
	else if (n<=2) 
		return(n)		
	else
		return(n*fac1(n-1))	
}

# Exercise
fac2<-function(n){	
	if ((n==0)|(n==1)) {
		return(1)
	} else {	
		result <- 1
		for (i in 2:n)
			result <- result * i
		return(result)
	}
} 


# Efficient programming
# Version 1: Building x one-by-one
pt0<-proc.time()		# save initial time
n<-50000				# define length of vector
m<-n/2
x<-NULL					# initialize x
for (i in 1:m) {
	x<-c(x,i)			# combine x to i
	x<-c(x,n-i+1)		# combine x to n-i+1
}
proc.time()-pt0			# compute process time


# Version 2: Create a vector of length n first
pt0<-proc.time()		# save initial time
n<-50000				# define length of vector
m<-1:(n/2)
x<-0*(1:n)				# create a vector of length n
for (i in m) {
	x[2*i-1]<-i			# save i to x[2*i-1]
	x[2*i]<-n-i+1		# save n-i+1 to x[2*i]
}
proc.time()-pt0			# compute process time

# Version 3: Without using loop
pt0<-proc.time()	# save initial time
n<-50000			# define length of vector
m<-1:(n/2)
x<-0*(1:n)		# create a vector of length n
x[2*m-1]<-m		# save the odd index in x
x[2*m]<-n-m+1		# save the even index in x
proc.time()-pt0	# compute process time


# Vectorisation
is.positive <- function(x) {
	if (x>0) 1 else 0
}

x <- c(-1,0,1)
is.positive(x)

vapply(x,is.positive,FUN.VALUE=numeric(1))


A<-matrix(1:16, nrow=4)			
# create a square matrix A
outer(1:nrow(A),1:nrow(A),'>=')*A	
# change upper triangular elements to zero


# Example: Sorting
# Wrong version
sort <- function(x) {
	# x is initially the input vector and will be 	
	# modified to form the output
	for(last in length(x):2) {
		for(first in 1:(last - 1)) {
			if(x[first] > x[first + 1]) { 
				# swap the pair
				save <- x[first]
				x[first] <- x[first + 1]
				x[first + 1] <- save
			}
		}
	}
	return (x)
}

# Correct version
sort <- function(x) {
	if (length(x) < 2) return (x)
	# last is the last element to compare with
	for(last in length(x):2) {
		for(first in 1:(last - 1)) {
			if(x[first] > x[first + 1]) { 
				# swap the pair
				save <- x[first]
				x[first] <- x[first + 1]
				x[first + 1] <- save
			}
		}
	}
	return (x)
}

