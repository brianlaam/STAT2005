# Assignment 2
# Q1(a)
plot(pressure$temperature, pressure$pressure, pch=1)
curve((0.168 + 0.007*x)^(20/3), from = 0, to = 400, add = TRUE)

# Q1(b)
plot(pressure$temperature,(pressure$pressure)^(3/20))
abline(0.168,0.007)

# Q1(c)
plot(pressure$temperature,pressure$pressure, main = "Relationship between pressure and temperature")
curve((0.168 + 0.007*x)^(20/3), from = 0, to = 400, add = TRUE)


# Q1(d)
par(mfrow=c(1,2))

plot(pressure$temperature,pressure$pressure)
curve((0.168 + 0.007*x)^(20/3), from = 0, to = 400, add = TRUE)

plot(pressure$temperature,(pressure$pressure)^(3/20))
abline(0.168,0.007)  

# Q2
alt_matrix <- function(n) {
  if (n <= 0 | (n%%1!=0)) {
    stop("Please input a positive integer.")
  }
  else{
    result_matrix <- matrix(nrow = n, ncol = n)
    for (i in 1:n) {
      for (j in 1:n) {
        if ((i + j) %% 2 == 0) {
          result_matrix[i, j] <- 0
        }
        else{
          result_matrix[i, j] <- 1
        }
      }
    }
    return(result_matrix)    
  }
}

alt_matrix(7)

# Q3
plot(0, 0, type="n", xlim=c(0,10), ylim=c(0,10), bty="n", xlab="", ylab="")

# Red Loop
for(i in 1:6){
  if(i==1 | i==2){x0=0}
  else{x0 = i-2}
  x1=10-i+1
  
  y0=i-1
  y1=y0
    
  segments(x0=x0, y0=y0, x1=x1, y1=y1, col = "red")
}

# Blue Loop
for(i in 1:5){
  x0=i-1
  x1=x0
  
  y0=i
  y1=10-i+1
  
  segments(x0=x0, y0=y0, x1=x1, y1=y1, col = "blue")
}

# Green Loop
for(i in 1:5){
  x0=i-1
  x1=10-i+1
  
  y0=x1
  y1=x1
  
  segments(x0=x0, y0=y0, x1=x1, y1=y1, col = "green")
}

# Yellow Loop
for(i in 1:5){
  x0=5+i
  x1=x0
  
  y0=5-i
  y1=x0
  
  segments(x0=x0, y0=y0, x1=x1, y1=y1, col = "orange")
}


# Q4
twin_prime_list <- function(n) {
  if (n >= 5) {
    comp <- seq(2, n)
    primes <- c()
    for (i in seq(2, n)) {
      if (any(comp == i)) {
        primes <- c(primes, i)
        comp <- comp[(comp %% i) != 0]
      }
    }
    
    twin_primes <- c()
    
    for (i in 1:(length(primes)-1)) {
      if (primes[i+1] - primes[i] == 2) {
        twin_primes <- c(twin_primes, c(primes[i], primes[i+1]))
      }
    }
    return(twin_primes)
  } else {
    stop("Please input positive integer larger or equal than 5.")
  }
}