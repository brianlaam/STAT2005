# Exercise 2

# Q1(a)
set.seed(2005)
x <- sample(c(-2,-1,1,2),size=120,replace=T,prob=c(0.25,0.25,0.25,0.25))
x <- c(0,x)
s <- cumsum(x)
s <- as.ts(s)
plot(s, main="Q1a")

# Q1(b)
abline(h=max(s),col="red",lty=2)
abline(h=min(s),col="red",lty=2)

rm(list = ls())

# 2(a)
set.seed(2005)
x <- rnorm(1000, mean=3, sd=4)

# 2(b)
y <- rnorm(2000, mean=1,sd=4)
s1 <- sd(x)
s2 <- sd(y)
n1 <- length(x)
n2 <- length(y)
PooledSD <- sqrt(((n1-1)*s1^2+(n2-1)*s2^2)/(n1+n2-2))

# 2(c)
(t <- ((mean(x)-mean(y)))/(PooledSD*sqrt(1/n1+1/n2))) # t-statistic
qt(.975,n1+n2-2)  # critical value 
(abs(t) > qt(.975,n1+n2-2)) # if TRUE, we should reject H_0

# Q3(a)
data <- read.table("ex2_q3.dat", sep=",", header=T)
head(data)

# Q3(b)
tapply(data$gdp1,data$Region,mean) #R is case-sensitive

# Q3(c)
by(data[,c(2,3)],data$Region,colSums)

# 3(d)
gdp1 <- data$gdp1
gdp2 <- data$gdp2
plot(gdp1,gdp2)
# No relationship