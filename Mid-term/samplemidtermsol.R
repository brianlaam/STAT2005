# Q1a
a <- 1:5
b <- c("a", "b")
c <- matrix(1:6,nr=2)
mylist <- list(a=a,b=b,c=c)

# Q1b
workshop <- c("R", "SPSS", NA , "SPSS", "STATA", "SPSS")
gender <- factor(c("Female", "Male", NA , "Female", "Female", "Female"))
# factor is optional
q1 <- c(4, 3, 3, 5, 4, 5)
q2 <- c(3, 4, 2, 4, 4, 4)
q3 <- c(4, 3, NA , 5, 3, 3)
q4 <- c(5, 4, 3, 3, 4, 5)
survey <- data.frame(workshop, gender, q1, q2, q3, q4)

# Q1c
survey[,1:2]

# Q1d
survey[c(1,nrow(survey)),]

# Q1e
levels(survey$gender) <- c("F", "M")
survey

# Q2a
sample(1:4, size=1, prob=c(0.2,0.4,0.3,0.1), replace=T)

# Q2b
n <- 1000
r <- sample(1:4, size=2*n, prob=c(0.2,0.4,0.3,0.1), replace=T)
r <- matrix(r,n,2)

# Q2c
table(r[,1],r[,2])


# Q3
theta <- seq(-16*pi,16*pi, by=pi/50)
r <- exp(0.05*theta)
x <- r*cos(theta)
y <- r*sin(theta)
plot(x,y, type="l")


# Q4
Fibo <- c(1,1)  # or c(1,2)
i <- 3
repeat {
  new <- Fibo[i-1]+Fibo[i-2]
  if (new <= 1000000000)
    Fibo <- c(Fibo,new)
  else
    break
  i <- i+1
}
sum(Fibo[Fibo%%2==0])


# Q5
plot(0, 0, type="n", xlim=c(0,2), ylim=c(0,2), bty="n", xlab="", ylab="")
segments(0, 0, 2, 0, col="grey", lty=2) # "grey" is optional
segments(0, 0, 0, 2, col="grey", lty=2)
segments(0, 1, 2, 1, col="grey", lty=2)
segments(1, 0, 1, 2, col="grey", lty=2)
segments(0, 2, 2, 2, col="grey", lty=2)
segments(2, 0, 2, 2, col="grey", lty=2)
arrows(0, 2, 1, 2, lwd=2, length=0.1)
arrows(1, 2, 1, 1, lwd=2, length=0.1)
arrows(1, 1, 2, 1, lwd=2, length=0.1)
arrows(2, 1, 2, 0, lwd=2, length=0.1)
