# Chapter 4


# Writing simple function in R
se<-function(x){
	n<-length(x)	# find the sample size
	sd(x)/sqrt(n)
}

# Example: Pooled sample standard deviation 
sp<-function (x,y) {
	m<-length(x)
	n<-length(y)
	s2<-((m-1)*var(x)+(n-1)*var(y))/(m+n-2)
	sqrt(s2) 
}

# Scope of variables
f <- function() {
	x <- 1
	g() # g will have no effect on our local x
	return(x)
}
g <- function() {
	x <- 2 
	# this changes g's local x, not the one in f
}
f()

# Super assignment
f <- function() {
	if (!exists("f_count")) # check existence of f_count
		f_count <<- 1
	else	
		f_count <<- f_count + 1 
	return(f_count)
}
f()
f()

# Logical operators

a<-1;b<-2
(a>0)
(a==1)
(a>=1)&(b<5)
(a>=1)&(b!=2)
(a>=1)|(b<1)

# Difference between & and &&

x<-1:6
(x > 2) & (x < 5)
(x > 2) && (x < 5)
x[(x>2) & (x<5)]
x[(x>2) && (x<5)]


# Example: Fibonacci sequence
Fibonacci <- numeric(12)
Fibonacci[1] <- Fibonacci[2] <- 1
for (i in 3:12) {
	Fibonacci[i] <- Fibonacci[i - 2] + Fibonacci[i - 1]
}


# Example: Modifying a vector
v <- 1:5
for (x in v) x <- x+1
for (i in 1:length(v)) v[i] <- v[i]+1


# Example: Infinity loop?
v <- c(1,1)
for (i in v) v <- c(v,1)
v


# A simple example
x <- 3
if (x > 2) y <- 2 * x else y <- 3 * x


# Example: Listing prime numbers
prime_list <- function(n) {
	if (n >= 2) {
		comp <- seq(2, n)
		primes <- c()
		for (i in seq(2, n)) {
			if (any(comp == i)) {
				primes <- c(primes, i)
				comp <- comp[(comp %% i) != 0]
			}
		}
		return(primes)
	} else {
		stop("Input value of n should be at least 2.")
	}
}

# Example: Fibonacci numbers 
Fib1 <- 1
Fib2 <- 1
Fibonacci <- c(Fib1)
while (Fib2 < 300) {
	Fibonacci <- c(Fibonacci, Fib2)
	oldFib2 <- Fib2
	Fib2 <- Fib1 + Fib2
	Fib1 <- oldFib2
}

# Exercise
Fib1 <- 1
Fib2 <- 1
Fibonacci <- c(Fib1)
while (Fib2 < 300) {
	Fibonacci <- c(Fibonacci, Fib2)
	Fib2 <- Fib1 + Fib2
	Fib1 <- max(Fibonacci)
}
print(Fibonacci)


# Example: Compound interest
r <- 0.11 				# Annual interest rate
period <- 1/12 			# Time between repayments 
debt_initial <- 1000 	# Amount borrowed
repayments <- 12 		# Amount repaid each period
time <- 0
debt <- debt_initial
while (debt > 0) {
	time <- time + period
	debt <- debt*(1 + r*period) - repayments
}
cat('Loan will be repaid in', time, 'years\n')


# Example: Newton’s method for root finding
x <- 1
tolerance <- 0.000001
repeat {
	f <- x^3 + 2 * x^2 - 7
	if (abs(f) < tolerance) break
	f.prime <- 3 * x^2 + 4 * x
	x <- x - f / f.prime
}
x


# The use of next inside a loop
bseq<-sample(c(0,1),size=20,replace=T)	
# generate random binary sequence
bseq


max1<-function(v) {
	is_prev1<-FALSE		# initialize flag to False
	n1<-0; count<-0	# initialize counter
	for (i in v) {		
		if ((i==1)&(is_prev1==TRUE)) {
			count<-count+1
			if (count>=n1) n1<-count
			next		# skip to next element in v
		}
		if ((i==1)&(is_prev1==FALSE)) {
			count<-1; is_prev1<-TRUE
			if (count>=n1) n1<-count
			next		# skip to next element in v
		}
		if ((i==0)&(is_prev1==TRUE)) {
			count<-0	# reset counter
			is_prev1<-FALSE
		}
	}
	return(n1)						
}

max0<-function(v) { max1(1-v) }	


maxlength<-function(v) {
	n1<-max1(v) 
	n0<-max0(v) 
	out<-list(n0,n1) 			# create list
	names(out)<-c("n0","n1") 	# apply label to out
	return(out) 				# output
}

maxlength(bseq)


# Example: Temperature conversion
# Version 1: using for loop
ftoc.v1<-function(low,up,step) {	# convert F to C from low to up with step
	f<-seq(low,up,step)				# create vector of value f
	len<-length(f)					# find the length of f
	c<-rep(0,len)					# create a vector c
	for (i in 1:len) { 				# for loop
		c[i]<-(5/9)*(f[i]-32) 		# convert f to c element-wise
	}		
	cbind(f,c) 						# output table
}


# Version 2: using while loop
ftoc.v2<-function(low,up,step) {
	f<-seq(low,up,step)		# create a sequence in f
	len<-length(f)			# find the length of f
	c<-rep(0,len)			# create a vector of zeroes
	i<-1						# initialize the loop index i
	while (i<=len) {			# while loop
		c[i]<-(5/9)*(f[i]-32)
		i<-i+1 				# increase i by 1 for each iteration
	}				
	cbind(f,c)
}


# Version 3: using repeat loop
ftoc.v3<-function (low,up,step) {
	f<-seq(low,up,step)
	len<-length(f)
	c<-rep(0,len)
	i<-1
	repeat {					# repeat loop
		if (i>len) break	 	# break point inside the repeat loop
		c[i]<-(5/9)*(f[i]-32)
		i<-i+1 
	}
	cbind(f,c)
}


# Version 4: Using vector-based operation
ftoc<-function (low,up,step) {
	f<-seq(low,up,step)
	c<-(5/9)*(f-32)
	cbind(f,c)
}

# Example: Random number generator
my.ran1 <- function (n, dist) {		# n=sample size, dist="norm"or"uniform"
	# version 1: using if else
	if (dist == "norm") rnorm(n) else
	if (dist == "uniform") runif(n) else
	stop("Unknown distribution")
}

my.ran2 <- function(n, dist="norm")	# default value of dist is "norm"
{
	# version 2: using switch
	switch(dist, norm=rnorm(n), uniform=runif(n), stop("Unknown distribution"))
}


# Example: Signum function
sgn1 <- function(x){
	# version 1: signum function using if else
	for(i in 1:length(x)) {
		if(x[i] > 0)
			x[i] <- 1
		else if (x[i] < 0)
			x[i] <- -1
	}
	x
}

sgn2 <- function(x){
	# version 2: signum function using vectorized ifelse
	x<-ifelse(x>0, 1, ifelse(x<0, -1, 0))
	x
}

sgn3 <- function(x){
# version 3: signum function using selection
	x[x>0] <- 1
	x[x<0] <- -1
	x
}

# Example: Roots of a quadratic equation
quad <- function(a0, a1, a2) {
	# find the zeros of a2*x^2 + a1*x + a0 = 0
	if (a2 == 0 && a1 == 0 && a0 == 0) {
		roots <- NA
	} else if (a2 == 0 && a1 == 0) {
		roots <- NULL
	} else if (a2 == 0) {
		roots <- -a0/a1
	} else { # calculate the discriminant
		discrim <- a1^2 - 4*a2*a0
		if (discrim > 0) {
			roots <- (-a1 + c(1,-1) * sqrt(a1^2 - 4*a2*a0))/(2*a2)
		} else if (discrim == 0) {
			roots <- -a1/(2*a2)
		} else {
			roots <- NULL
		}
	}
	return(roots)
}
