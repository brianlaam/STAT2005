# Ch5 Exercise
# Q1(a)
R = function(n){
  if (n==0|n==1){
    return(1)
  }
  else if (n%%2==1){
    return(4*R(n-1)-3*R(n-2))
  }
  else if (n%%2==0){
    return(3*R(n-1)-R(n-2))
  }
}

# Q1(b)
P = function(n){
  if(n==0|n==1|n==2){
    return(1)
  }
  else{
    return(P(n-2)+P(n-3))
  }  
}

# Q1(c)
S = function(n){
  if(n==0){
    return(0)
  }
  else if (n==1){
    return (1)
  }
  else if(n%%2==0){
    return(4*S(n/2))
  }
  else if(n%%2==1){
    return(4*S(n%/%2)+1)
  }
}

# Q2(a)
n <- as.integer(readline(prompt="Input n: "))
k <- as.integer(readline(prompt="Input k: "))
expected <- function(x){
  if (x*2>n) return(x)
  if (x*2+1>n) return(x+0.2*expected(x*2))
  return(x+0.2*expected(x*2)+0.3*expected(x*2+1))
}
expected(k)

# Q2(b)
maxearn <- function(d,c,remainingstamina){ # d = earning, c = cost
  n <- length(d)
  if (n==1) # base case
    return(ifelse(remainingstamina>=c,d,0)) # c and d are vectors with same length
  if (remainingstamina>=c[n])
    # if there is enough stamina,
    # compare the money earned by the two options
    # (choosing this task or not)
    return(max(
      d[n]+maxearn(d[1:(n-1)],c[1:(n-1)],remainingstamina-c[n]),
      # pick up task n
      maxearn(d[1:(n-1)],c[1:(n-1)],remainingstamina)
      # do not choose this task
    ))
  return(maxearn(d[1:(n-1)],c[1:(n-1)],remainingstamina)) # not enough stamina
}

# Q3(a)
repeat{
  n <- as.numeric(readline(prompt="Enter the number of toys: "))
  if (is.na(n)) cat("Please enter a positive integer!") # Check Null Input
  # check characters
  else if (n<=0) cat("Please enter a positive integer!") # Check Negative
  # check non-positive number
  else if (n-floor(n)>0) cat("Please enter a positive integer!") # Check floats
  # check floats
  else break
}

# Q3(b)
i <- n
j <- 1

while(i>0){
  repeat{
    input <- as.numeric(readline(prompt=cat("The current number of toys on the table is",i,". Player",j,", please enter the number of toys to be taken away (between 1 to",min(5,i),"): ")))
    if (is.na(input)) cat("Invalid input! ") # Null
    else if (input<=0|input>min(5,i)) cat("Invalid input! ") # Out of range
    else if (input-floor(input)>0) cat("Invalid input! ") # Floats
    else break # break if it is valid
  }
  i <- i - input
  
  ifelse(j==1,j<-2,j<-1)  # Change Player
  
}

ifelse(j==1,"Player 1 wins!","Player 2 wins!")







