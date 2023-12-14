# Chapter 7
# Q1
library(rgl)
res <- 200
theta1 <- seq(0,2*pi,length=res)
theta2 <- seq(0,pi,length=res)
xm <- outer(theta1,theta2,
	function(t1,t2) cos(t1)*sin(t2)
)
ym <- outer(theta1,theta2,
	function(t1,t2) sin(t1)*sin(t2)
)
zm <- outer(theta1,theta2,
	function(t1,t2) cos(t2)
)
z <- seq(-1,1,length=res)
sphcols <- rep("tan",res^2)
for (i in 1:(res-1)) {
	sphcols[(z[i] < as.vector(zm)) & (as.vector(zm) <= z[i+1])] <- rainbow(res/2)[i%%(res/2)]
}
persp3d(x=xm,y=ym,z=zm,
	col=sphcols,
	axes=FALSE,xlab="",ylab="",zlab=""
)

# A version using persp(), for MacOS user without rgl
n <- 100
x <- seq(-1,1, length=n)
y <- seq(-1,1, length=n)
z <- matrix(NA, n, n)
for (i in 1:n) {
	for (j in 1:n) {
		if (x[i]^2 + y[j]^2 <= 1) {
			z[i,j] <- sqrt(1 - x[i]^2 - y[j]^2)
		}
	}
}

persp(x, y, z, xlim=range(-1,1), ylim=range(-1,1),zlim=range(-1,1), col=rainbow(n/2))
par(new=TRUE)
persp(x, y, -z, xlim=range(-1,1), ylim=range(-1,1),zlim=range(-1,1), col=rainbow(n/2))	


# Q2
# (a)
qplot(carat, price, data = diamonds, alpha = I(1/100))
ggplot(diamonds, aes(carat, price)) + geom_point(alpha = I(1/100)) 

# (b)
qplot(carat, price, data = diamonds, geom = c("point", "smooth"))
ggplot(diamonds, aes(carat, price)) + geom_point() + geom_smooth()

# (c)
qplot(carat, data = diamonds, geom = "histogram", binwidth = 0.1, xlim = c(0,3))
ggplot(diamonds, aes(carat)) + geom_histogram(binwidth = 0.1) + xlim(0,3)

# (d)
qplot(carat, data = diamonds, geom = "histogram", fill = color)
ggplot(diamonds, aes(carat, fill = color)) + geom_histogram()
