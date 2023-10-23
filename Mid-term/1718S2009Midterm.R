# 1718 Semester 1 S2009 Mid Term Past Paper

# Q1(a)
(A <- matrix(1:16-rep(seq(0,9,by=3),rep(4,4)),nrow=4))
(b <- c(1:4))

# Q1(b)
A[3,]
dim(A)
b(c(3,1,1,2))
(A^2)[,1]
A[c(-1,-2),]
b+10%%3
b[rep(2:3,2:3)]
(b<=3)&(A[,3]==3)
!(b>1)|(b<4)
trunc(b/2-2)

# Q2(a)
set.seed(8964)
sample(1:6,3,replace=T)

# Q2(b)
r <- sample(1:6,3000,prob=c(rep(1/6,6)),replace=T)
r <- matrix(r,nrow=1000)

# Q2(c)
rowSum <- apply(r,1,sum)
sum(rowSum %% 2 == 0)/length(rowSum)

# Q2(d)
w <- cumsum(c(1000,2*(rowSum %% 2 == 0)-1))

# Below is additional exercise
as.ts(w)
plot(w)
abline(h=max(w),col="red")
abline(h=min(w),col="red")

# Q3(a)
# iid sample = Independent & Identical Distribution
d <- rnorm(100,0,1)
hist(d,freq=F)

x<-seq(-3,3,0.1)
lines(x,dnorm(x,mean(d),sd(d)),col="red")

# Q3(b)
qqnorm(d)
qqline(d,lwd=3)

# Q3(c)
# QQ-Plot is used for compare the dataset(d) to a Normal Distribution
# with the dataset(d)'s mean and sd.
# If the qqline is (nearly) a straight line passing through origin, with 45 degree,
# then the dataset(d) can be estimated as normal distributed.
# In this case, the qqline satisfied the conditions above,
# so it can interpreted as normal distributed.

# Q3(d)
boxplot(d,main="Box plot using data d")


# Q4(a)
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

# Q4(b)
Fib <- numeric(12)
Fib[1] <- Fib[2] <- 1
i<-3
while(i<=12){
  Fib[i]<-Fib[i-1]+Fib[i-2]
  i <- i+1
}

# Q4(c)
# Yes