# Chapter 6

# Matrix addition and multiplication
y<-matrix(1:12,ncol=4)	# create a 3x4 matrix y
y				# or simply use (y<-matrix(1:12,ncol=4))
t(y)     			# transpose of Y, 4x3 matrix
t(y)%*%y  			# matrix multiplication Y¡¦Y, 4x4 matrix

y%*%t(y)  			# YY¡¦3x3 matrix
(x<-1:4)			# create and display a vector x
x%*%x      			# inter-product = x¡¦x
x%o%x      			# outer-product = xx¡¦, 4x4 matrix

x<-1:4				# create a vector
(y<-diag(x))			# create and display a diagonal matrix


# Special type of matrices
diag(y)				# returns a vector if the argument is a matrix
(a<-matrix(1:12,3))
diag(a)
(b<-matrix(1:12,4))
diag(b)

# Exercise
diag(n)

x<-matrix(0,n,n)
diag(x)<-1

n<-4
u<-(1-outer(1:n, 1:n, "-"))*outer(1:n, 1:n, "<=")
u+t(u)-diag(diag(u))

abs(outer(1:n, 1:n, "-"))+1

# Matrix inverse
A<-matrix(c(1,3,2,4),2) 	# define the matrix A
b<-c(5,6)              		# define the vector b
(x<-solve(A,b))           	# solve for x and display the answer

A%*%x   			# check Ax to see if equal to b

iden<-diag(c(1,1))		# create an identity matrix
solve(A,iden)			# find the inverse of A or simply use solve(A)


# Covariance matrix
d<-read.csv("iris.csv")
colnames(d)<-NULL		# remove the column names
sigma<-var(d[,1:4])		# covariance matrix
sigma
cor(d[,1:4])			# correlation matrix

# Markov chain
T<-matrix(c(0.3,0.2,0.5,0.4,0.3,0.3,0.3,0.4,0.3),nrow=3,byrow=T)	
p<-c(1,0,0)				# define p(0)
(p<-p%*%T)				# compute and display p(1)

(p<-p%*%T)				# compute and display p(2)

# Invariant distribution
eig<-eigen(t(T))
eig$vectors[,1]/sum(eig$vectors[,1])



# Finding roots of nonlinear equation
fx<-function(x) {3*exp(-0.5*x) + 3*exp(-1*x) + 3*exp(-1.5*x) + 103*exp(-2*x) - 98.39}	
# define the function fx
uniroot(fx,c(0.0001,1))			
# finding root of fx

plot(fx,xlim=c(0,0.1))	
# plot fx from 0 to 0.1, or using curve(fx,0,0.1)
abline(h=0)			
# add a horizontal line y=0


# Bisection
bisection<-function(f,x1, x2, n = 1000, err = 1e-05) {
	f1<-f(x1); f2<-f(x2)
	if (f1==0) return(x1)
	else if (f2==0) return(x2)
	else if (f1*f2>0) stop("Roots may not exist in range")
	else {
		x <-(x1+x2)/2; fx<-f(x)
		i <-0
		while ((abs(fx)>err)&(i<=n)) {
			if (fx*f2>0) {
				x2 <-x
			} else if (fx*f1>0) {
				x1 <-x
			}
			x <-(x1+x2)/2; fx<-f(x)
			i <-i+1
		}
	}
	return(x)
}
bisection(fx,0.0001,1,1000,10^-5)

# Numerical integration
stdnorm<-function(x) { exp(-x^2/2)/sqrt(2*pi) }	 
# define standard normal density
integrate(stdnorm, -Inf, 0)		# integrate from –infinity to 0
integrate(stdnorm, -Inf, 1.96)	 # integrate from –inf to 1.96

# Differentiation
fx <- expression(x^2 + sin(x)) 	# f(x)
dfdx <- D(fx, "x") 				# f'(x)
x<-5
eval(fx) 						# Compute f(5)
eval(dfdx)						# Compute f'(5)

gxy <- expression(exp(y*x))		# g(x, y)
dgdx <- D(gxy, "x")				# Partial derivative wrt x
dgdy <- D(gxy, "y")				# Partial derivative wrt y
d2gdxdy <- D(dgdx, "y")			# Cross partial derivative with respect to x and y 



# Univariate optimization
fx<-function(x) {3*exp(-0.5*x) + 3*exp(-1*x) + 3*exp(-1.5*x) + 103*exp(-2*x) - 98.39}	
gx<-function(x) {fx(x)^2}	# define gx = fx*fx
optimize(gx,c(0.0001,1))	# minimize gx
plot(gx,xlim=c(0,0.1))	# or using curve(gx,0,0.1)


fx<-function(x) {abs(x-1)+abs(x-2)+abs(x-3)+abs(x-4)}	# define fx
optimize(fx,c(0,10))		# minimize fx
plot(fx,xlim=c(0,5))


# Multivariate optimization
fx<-function(x) {	
	# fx takes the vector x as input argument
	p<-sqrt((x[1]-5)^2+(x[2]-5)^2)
	-sin(p)/p 
}
optim(c(2,2),fx)	
# minimize fx with initial x=(2,2)

fxy<-function(x,y) {	
# re-defnine fx using two arguments x and y
	p<-sqrt((x-5)^2+(y-5)^2)
	-sin(p)/p }
x<-seq(-15,20,by=0.5)			
# define a sequence of x and y near the solution
y<-x
z<-outer(x,y,fxy)				
# create a 71x71 matrix whose element is fxy(x,y)
persp(x,y,z,theta=-30, phi=30, col="lightblue", ticktype="detailed")	
# persp. plot


# Nonlinear least squares using optim()
# define the function to fit, p is a 4x1 parameter vector
fx<-function(x,p){
	(p[1]*x)*(x+p[2])/(x^2+p[3]*x+p[4])
}

# define objective function, call fx to return error sum of squares: sum((y-fx)^2)
objF<-function(p,data) {  	
	# p=parameter vector, data=(xi,yi), two input args
	x<-data[,1]		# save 1st column to x
	y<-data[,2]		# save 2nd column to y
	sum((y-fx(x,p))^2)
	# output error sum of squares
}

d<-read.csv("nls.csv")	# read in data to d
p<-c(0.25,0.39,0.415,0.39)	# set initial value of parameters
out<-optim(p,objF,data=d)	# call optim with passing d to data

# plot fitted curve
x<-seq(0,4,by=0.01)
fit<-fx(x,out$par)
plot(x,fit,type="l",ylab="f(x)",col="blue")
points(d, col="red")