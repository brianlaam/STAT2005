# Exercise 6
# Q1(a)
T<-matrix(c(0.7,0.2,0.1,0.3,0.6,0.1,0.2,0.4,0.4),nrow=3,byrow=T)
T%*%T

# Q1(b)
T8 <- diag(3)
for (i in 1:8) {
  T8 <- T8 %*% T
}
T8[2,1]

# Q1(c)
eig <- eigen(t(T))
eig$vectors[,1]/sum(eig$vectors[,1])
# The distribution converges to [0.4761905 0.3809524 0.1428571]
# Since 0.4761905 < 0.5.
# So, Risky's claim is incorrect.

# Q2(a)
fx <- function(x){x*abs(x+2)+abs(x-1)}
optimize(fx,c(-2,2))

# Q2(b)(i)
gx <- function(x){
  sqrt(abs(sin(x[1])+cos(x[2])))
}
optim(c(3,3),gx)

# Q2(b)(ii)
gxy <- function(x,y){
  sqrt(abs(sin(x)+cos(y)))
}
x <- seq(-5,5,by=0.5)
y <- x
z <- outer(x,y,gxy)
persp(x,y,z,theta=-30,phi=30,col="lightblue",ticktype="detailed")

# Q3(a)
fx <- expression(2*x-x*cos(x))
dfdx <- fx
for (i in 1:10)
  dfdx <- D(dfdx, "x")
dfdx

# Q3(b)
fx <- function(x){2*x-x*cos(x)}
integrate(fx,0,1)