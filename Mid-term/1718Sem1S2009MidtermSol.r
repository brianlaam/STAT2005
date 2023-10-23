# Q1a
A <- matrix(1:16-rep(seq(0,9, by=3), rep(4,4)), ncol=4)
b <- 1:4

# Q1b
# i.		
A[3,]
[1] 3 4 5 6
# ii. 	
dim(A)
[1] 4 4
# iii.  	
b(c(3,1,1,2))
ERROR
# iv. 	
(A^2)[,1]
[1]  1  4  9 16
# v. 	 	
A[c(-1,-2),]
     [,1] [,2] [,3] [,4]
[1,]    3    4    5    6
[2,]    4    5    6    7
# vi. 	
b+10%%3
[1] 2 3 4 5
# vii.   	
b[rep(2:3,2:3)]
[1] 2 2 3 3 3
# viii.   
(b<=3)&(A[,3]==3)
[1]  TRUE FALSE FALSE FALSE
# ix. 	
!(b>1)|(b<4)
[1]  TRUE  TRUE  TRUE FALSE
# x. 		
trunc(b/2-2)
[1] -1 -1  0  0

# Q2a
sample(1:6, size=3, replace=T)

# Q2b
n <- 1000
r <- sample(1:6, size=3*n, replace=T)
r <- matrix(r,n,3)

# Q2c
sum_r <- apply(r,1,sum)
sum(sum_r %% 2 == 0)/length(sum_r)

# Q2d
w <- cumsum(c(1000,2*(sum_r %% 2 == 0)-1))

# Q3
set.seed(1)
d <- rnorm(100,0,1)
hist(d,freq=F)

# Q3a
x<-seq(-3,3,0.1)
lines(x,dnorm(x,mean(d),sd(d)),col="red")	

# Q3b
qqnorm(d)     
qqline(d,lwd=2)

# Q3d
boxplot(d, main ="Box plot using data d", sub = "Created on 25th Oct 2017") 

# Q4a
A <- matrix(rep(0,7^2), ncol=7)
for (i in 1:7) {
	for (j in 1:7) {
		if (i>j) {
			A[i,j] <- i
		} else if (i<j) {
			A[i,j] <- 1
		} else {
			A[i,j] <- 0
		}
	}
}

     [,1] [,2] [,3] [,4] [,5] [,6] [,7]
[1,]    0    1    1    1    1    1    1
[2,]    2    0    1    1    1    1    1
[3,]    3    3    0    1    1    1    1
[4,]    4    4    4    0    1    1    1
[5,]    5    5    5    5    0    1    1
[6,]    6    6    6    6    6    0    1
[7,]    7    7    7    7    7    7    0

# Q4b
Fib <- numeric(12)
Fib[1] <- Fib[2] <- 1
i <- 3
while (i <= 12) {
	Fib[i] <- Fibonacci[i - 2] + Fibonacci[i - 1]
	i <- i+1
}

# Q4c
# Yes, in general the for loop

for (x in v) {
	{expr...} # may depends on x
}

# can be rewritten using a while loop as

i <- 1
while (i<=length(v)) {
	{expr...} # may depends on v[i]
	i<-i+1
}

