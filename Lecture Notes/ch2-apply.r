# set random seed and generate 1000 uniform(0,20) random numbers
set.seed(123)
x<-runif(500,0,20)

#  put x into a 50 by 10 matrix
y<-matrix(x,ncol=10)

# compute the mean and sd of each column and
# store the results in m and s respectively
m<-apply(y,2,mean)
s<-apply(y,2,sd)
