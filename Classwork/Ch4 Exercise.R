# Ch4 Exercise
# Q1(a)
plot(0, 0, type="n", xlim=c(0,100), ylim=c(0,100), bty="n", xlab="", ylab="")
polygon(c(0,100,100,0),c(100,100,0,0))

# Q1(b)
x <- c(0,100,100,0)
y <- c(100,100,0,0)

for(i in 1:100){
  polygon(x,y)
  
  a<-x[1]
  b<-y[1]
  
  for(j in 1:3){
    x[j]<-(x[j]+x[j+1])/2
    y[j]<-(y[j]+y[j+1])/2
  }
  x[4]<-(x[4]+a)/2
  y[4]<-(y[4]+b)/2 
}

# Q2(a)
checkmono <- function(x) {
  digit <- x%%10;
  while (x>9){
    x <- x%/%10 # %/% is integer division
    if (x%%10!=digit) 
      return(0)
  }
  return(digit)
}

# Q2(b)
sum<-0
mono <- function(x){
  for(i in 1:x){
    if (checkmono(i)!=0){
      digit<-checkmono(i)
      num_digit<-floor(log10(i)) + 1 # Finding number of digits # Only works for +ve numbers
      sum<-sum+digit*num_digit
    }
  }
  return(sum)
}

# Q2(c)
mono(100000)

# Q2(d)


# Q3(a)
apple<-rnorm(100,mean=5,sd=5)

modify <- function(x,y,m){
  apple[x:y]<<-apple[x:y]+m
  apple[apple<0] <<- 0
  return(apple)
}

# Q3(b)
count <- function(lower,upper){
  return(length(apple[apple>=lower&apple<=upper]))
}