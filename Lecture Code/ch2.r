# Chapter 2

# Simulation using the sample function
sample(10) 	
# random permutation of integers from 1 to 10
sample(10,replace=T)	# sample with replacement
# 20 random drawings from a given discrete distribution
sample(c(-1,0,1),size=20, prob=c(0.25,0.5,0.25),replace=T)
# increase size to 10000
d<-sample(c(-1,0,1),size=10000,prob=c(0.25,0.5,0.25),replace=T)
sum(d==-1)/10000	
# compute the proportion of -1
sum(d==0)/10000	
# compute the proportion of 0
sum(d==1)/10000	
# compute the proportion of 1

# Fix a seed
set.seed(12345)	# set initial seed to 12345
sample(10)		# generate first sample
sample(10)		# generate second sample
sample(10)		# generate third sample
set.seed(12345)
# reset the initial seed again to 12345
sample(10)		# generate first sample
sample(10)		# generate second sample


# Random walk
set.seed(13579)  
# set the initial seed manually
# 100 random drawings with Pr{R=-1} = Pr{R=1} = 0.5
r<-sample(c(-1,1),size=100,replace=T,prob=c(0.5,0.5))
(r<-c(10,r))			
# append the starting value (10) to r

(w<-cumsum(r))			
# cumulative sum of vector r
w<-as.ts(w)				
# transform w into a time series object
plot(w,main="random walk") 	
# plot w with main title
abline(h=10)			
# add a horizontal line (see help(abline) for details)


# Random number between a and b
runif(5)
runif(10, min = -3, max = -1)


# Built-in probability distribution functions
x<-seq(-4,4,0.1)
plot(x,dnorm(x),type="l",main="N(0,1) density")
pnorm(1.96)
q<-c(0.025,0.05,0.5,0.95,0.975)
qnorm(q)
rnorm(100)

x<-0:20				
# generate an integer sequence from 0 to 20
p<-dbinom(x,size=20,prob=1/4)	
# p is a prob vector, p=Pr(X=x)
round(p,digits=4)
# display the vector p
plot(x,p,type="h")		# plot the pmf

1-pbinom(8,size=20,prob=1/4)	
# Pr{X>8} = 1 – Pr{X<=8}
1-sum(p[1:9])	# Pr{X>8} = 1- Pr{X<=8}

(q<-seq(0,1,0.1))				
# create and display q
qbinom(q,size=20,prob=1/4)		
# quantiles from bin(n,p) corresponds to q

round(cumsum(p),digits=4)

# Example
n <- 1000
X <- rnorm(n)
Est <- mean(abs(X)) 	# estimate
SE <- sd(abs(X))/sqrt(n) # standard error
CI95 <- c(Est-qnorm(0.975)*SE, Est+qnorm(0.975)*SE) 
# 95% confidence interval
c(Est, sqrt(2/pi), CI95)

# Exploratory Data Analysis

# Inputting ASCII data file
d<-read.table("popden.dat",header=T,stringsAsFactors=T)	
# read in data file popden.dat with header
# character variables are stored as factor
names(d)			
# display the labels in d

head(d)	# display the first 6 lines in d

# Variable types
class(d$year86)		# display class of year86
class(d$Region)		# display class of Region
d$Region			# Region has 3 levels

class(d)

(t<-tapply(d$year90,d$Region,mean))	
# save result to t and display

(s<-split(d$year90,d$Region))		
# save result to s and display

mean(s$HK)
mean(s$KL)
mean(s$NT)
table(d$Region)
by(d[,c(2,3)],d$Region,colMeans)
# sample mean by each Region

dense<-as.numeric((d$year86>10000)&(d$year90>10000))
# create binary variable dense
(t<-table(dense,d$Region))				
# save the two-way table and display

d$dense<-with(d, as.numeric((year86>10000)&(year90>10000)))				
# add the variable dense to d

# aggregate function
aggregate(year86~Region,d,mean)
aggregate(cbind(year86,year90)~Region+dense,d,mean)

pd86<-d$year86						 
# assign the 2nd column to pd86
pd90<-d$year90						 
# assign the 3rd column to pd90
plot(pd86,pd90,main="Population Density 90 vs 86")	 # plot pd90 vs pd86

lnpd86<-log(pd86)			
# natural log transformation on pd86
lnpd90<-log(pd90)			
# natural log transformation on pd90
plot(lnpd86,lnpd90,main="log pd90 vs log pd86")	
# plot log pd90 vs log pd86
abline(lsfit(lnpd86,lnpd90))	
# add least square line

# Save as PDF file
pdf("Figure.pdf")
plot(lnpd86,lnpd90,main="log pd90 vs log pd86")	
abline(lsfit(lnpd86,lnpd90))
dev.off()

x<-cbind(d[,1:4],lnpd86,lnpd90)					
# combined with lnpd86 and lnpd90
names(x)							
# display the labels in x
write.table(x,file="popden1.dat",row.names=F)	
# write x to an ASCII file

write.csv(x,file="popden1.csv", row.names=F)
d1<-read.csv("popden1.csv")
x<-edit(d1)



