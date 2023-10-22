## Ch3 Exercise

# Q1(a)
USPE <-  USPersonalExpenditure
barplot(USPE[1:3,1],ylim=c(0,25),cex.names=0.8)

# Q1(b)
a<-barplot(
  USPE[1:3,1:2], col=rainbow(3), ylim=c(0,50),
  beside=T, legend=T,
  args.legend=list(x="topright",bty="n",inset=c(-0.08, -0.02),cex=0.8), 
  # Inset = Distance from Margin
  xlab="Year",
  ylab="Personal Expenditure",
  main="US Personal Expenditure in 1940 and 1945"
)

# Q2(a)
data <- read.csv("ex3_q2.csv",header=T)
data
boxplot(data)

# 2(b)
points(x=1,36,pch=19)
points(x=2,41,pch=19)

# 2(c)
total <- (data$R1+data$R2)/2
qqnorm(total)
qqline(total,col="red")

# 3(a)
curve((x^4-2*x^3-3*x^2+x+1)/(x^2-3),-3,3)

x1 <- seq(-3,-sqrt(3)-0.001,by=0.001)
x2 <- seq(-sqrt(3)+0.001,sqrt(3)-0.001,by=0.001)
x3 <- seq(sqrt(3)+0.001,3,by=0.001)
y1 <- (x1^4-2*x1^3-3*x1^2+x1+1)/(x1^2-3)
y2 <- (x2^4-2*x2^3-3*x2^2+x2+1)/(x2^2-3)
y3 <- (x3^4-2*x3^3-3*x3^2+x3+1)/(x3^2-3)
plot(x1,y1,type="l",xlim=c(-3,3),ylim=c(-250,250))
lines(x2,y2)
lines(x3,y3)

# 3(b)
abline(v=sqrt(3),lty=2,col="red")
abline(v=-sqrt(3),lty=2,col="red")

# 3(c)
segments(-1,200,0,200)
segments(-1,100,0,200)
segments(-1,100,-1,200)

# 3(d)
polygon(c(0,1,1),c(100,100,200),col="blue")