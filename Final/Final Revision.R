# Final Revision

# 17-18 Sem 2
# Q1(a)
q1a <- function(n){
  M <- matrix(0, nrow=n, ncol=n)
  count <- 1
  for (i in 1:n){
    for (j in 1:i){
      M[i,j] <- count
      count <- count +1
    }
  }
  return(M)
}
q1a(2)
q1a(5)

# Q1(b)
q1b <- function(n, r) {
  M <- q1a(n)
  found <- FALSE
  for (i in 1:n) {
    for (j in 1:i) {
      if (r == M[i, j]){
        cat(r, " is in row ", i, " and column ", j, " of q1a(", n, ")" , sep = "")
        found <- TRUE
      }
    }
  }
  if (!found){
    cat("Error: q1b(n,r): r must be <= n*(n+1)/2")
  }
}
q1b(2,3)
q1b(2,6)

# Q1(c)
q1c <- function(n) diag(q1a(n))

# Q2 
Initials <- c("RC", "Iva")
Surname <- c("Fredericks", "Richards")
First <- c(0,30)
Second <- c(10,101)
game1 <- data.frame(Initials,Surname,First,Second)

First <- c(22,6)
Second <- c(50,98)
game2 <- data.frame(Initials,Surname,First,Second)

# Q2(a)
game1["Total"] <- game1["First"]+game1["Second"]

# Q2(b)
# Method 1
series <- merge(game1, game2, by = c("Initials", "Surname"))[order(-merge(game1, game2, by = c("Initials", "Surname"))$Second.y), ]
# Method 2
series = rbind(game1,game2)[-c(3,5,8,9),][order(series[,4]),] # Total of 6 obs

# Q2(c)
q2c <- data.frame(paste(Initials, Surname), First, Second)

# Q3
# Compare and contrast the following aspects in R and SAS programming:
# (a) Commenting;
# (b) Missing values in datasets;
# (c) Selecting subsets in datasets. 

# (a) Commenting
# R uses "#" and no direct multiple lines comments
# SAS uses "/" and "/*" & "*/" for multiple lines comments

# (b) Missing values in datasets
# R uses NA for missing values and is.na() for checking
# SAS uses . for missing values and MISSING() for checking

# (c) Selecting subsets in datasets. 
# R uses [] or subset()
# SAS uses WHERE statements

# ==============================================================================
# 18-19 Sem 1
# Q1(a)
T <- matrix(c(.5,.2,.3,.2,.6,.2,0,.1,.9), nrow=3, byrow=TRUE)

# Q1(b)
p <- c(1,0,0) # Since given X_1 = 1 # OR p <- diag(3)
T3 <- p
for (i in 1:3) {
  T3 <- T3 %*% T
}
T3[3] # X_3

# Q1(c) #n-th Transition
T50 <- diag(3)
for (i in 1:50){
  T50 <- T50 %*% T
}

# Q1(d)
eig1<-eigen(t(T))
(eig1$vectors[,1]/sum(eig1$vectors[,1]))[2]

# Q2(a)
fx <- function(x) {
  result <- ifelse(x<0, x^2+2*x+3, ifelse(x>=0 & x<2, x+3, x^2+4*x+7)) # Ifelse is necessary for vector input
  return(result)
}

# Q2(b)
x_vals <- seq(-3, 3, by = 0.01)
y_vals <- fx(x_vals)
plot(x_vals, y_vals, type = "l", col = "red", xlab = "x", ylab = "fx(x)", main = "Figure 1")

# Q2(c)
min(y_vals)
# x_vals[y_vals==2]
  
# ==============================================================================
# 20-21 Sem 1
# Q1(a)
q1a <- function(n){
  M <- matrix(0,ncol=n,nrow=n)
  for (i in 1:n){
    for (j in 1:n){
      for (x in 2:n){
        if ((i+j)==x | (i+j)==2*n-x+2){
          M[i,j] <- x-1
        } 
        if ((i+j)==(n+1)){
          M[i,j] <- n
        }
      }
    }
  }
  return(M)
}

# Q1(b)
q1b <- function(n){
  row <- matrix(1:n, nrow=n, ncol=n, byrow=TRUE)
  col <- matrix(1:n, nrow=n, ncol=n, byrow=FALSE)
  
  M1 <- row + col
  M2 <- n-abs(M1-(n+1))
  
  return(M2)
}

# Q1(c)
mirror <- function(A,m){
  if (m==1){
    A <- A[, ncol(A):1]
  } else if (m==2){
    A <- A[nrow(A):1,]
  } else{
    stop("m must be either 1 or 2")
  }
  return(A)
}

# Q2(a)

# Q2(b)
eq <- function(x){
  x^0.6+2*0.6-1-2*0.6*(1+0.4)*x
}

root <- uniroot(eq,c(0.001,1))

# Q3(a)(i)
id <- function(n){
  return(diag(n))
}

# Q3(a)(ii)
id <- function(n){
  return(diag(n))
}

# Q3(a)(iii)
id <- function(n){
  M <- matrix(0,ncol= length(n),nrow=length(n))
  diag(M) <- n
  return(M)
}

# Q3(a)(iv)
id <- function(n){
  M <- outer(1:n,1:n,"==")+0  
  return(M)
}

# Q3(b)

# Q4(a)
x <- c(1,3,5,7,9)
y <- c(1.5,2.7,6.0,6.5,8.0)
d <- data.frame(x,y)

model <- lm(y~x)
c <- coef(model)[1]
m <- coef(model)[2]

objective <- function(a,d){
  return(abs(d[a,2]-m*d[a,1]))
}

# Q4(b)
fit <- optimise(f=objective,interval=c(1,nrow(d)),d=d)

# Q4(c)
plot(x,y)
abline(c,m)

# ==============================================================================
# 21/22 Sem1
# Q1
sum(1:100)**2-sum((1:100)**2)

# Q2(a)
q2a <- function(n){
  M <- matrix(0,ncol=n,nrow=n)
  for (i in 1:n){
    for (j in 1:n){
      M[i,j]<-i+j-1
    }
  }
  return(M)
}

# Q2(b)
q2b <- function(n){
  rowIndex <- matrix(1:n,nrow=n,ncol=n, byrow=TRUE)
  colIndex <- matrix(1:n,nrow=n,ncol=n, byrow=FALSE)
  M <- rowIndex+colIndex-1
  return(M)
}

# Q2(c)
rotate <- function(M){
  M <- M[,ncol(M):1]
  return(M)
}

# Q3
# Given matrix operator
"%m*%" <- function(A,B) {
  if (ncol(A)!=nrow(B)) stop ("Matrix dimension mismatch.")
  n < - nrow (A)
  p <- nrow (B)
  q < - ncol (B)
  C <- matrix (0,n,q)

  for (i in 1:n) {
    for (j in 1:q) {
      for (k in 1:p) {
        C[i,j] <- C[i,j]+A[i,k]*B[k,j]
      }
    }
  }
  return (C)
}

# Q3(a)
# n*p*q multiplicative operations are performed
# Simply Construct A(1-by-2), B(2-by-3) and C(1-by-3) to test

  
# Q3(b)(i)
# Let A4 = A1 %m*% A2 and Let A5 = A4 %m*% A3
# Then A4 is a 10-by-5 matrix
# Then A5 is a 10-by-50 matrix
# A1 %m*% A2 go through 10*100*15 multiplicative operations
# A4 %m*% A3 go through 10*5*50 multiplicative operations
(ans = 10*100*15+10*5*50)

# Q3(b)(ii)
# Let A4 = A2 %m*% A3, which is a 100-by-50 matrix
# A2 %m*% A3 go through 100*5*50 multiplicative operations
# A1 %m*% A4 go through 10*100*50 multiplicative operations
(ans = 100*5*50+10*100*50)
# ==============================================================================
# 19/20 Sem1
# Q1
my_det <- function(M) {
  if (!is.matrix(M) || nrow(M) != ncol(M)) {
    stop("Input matrix is not a square matrix.")
  }
  
  if (nrow(M) == 1) {
    return(M[1, 1])
  } else {
    det_value <- 0
    n <- nrow(M)
    
    for (i in 1:n) {
      sign <- (-1)**(i + 1)
      sub_matrix <- M[-1, -i, drop = FALSE]  # Exclude 1st row & ith column
      det_value <- det_value + sign * M[1, i] * my_det(sub_matrix)
    }
    return(det_value)
  }
}

# Q2
FUN = function(y){
  3*exp(-0.5*y)+3*exp(-y)+3*exp(-1.5*y)+103*exp(-2*y)-98.39
}

secant = function(f,x0,x1,n,err){
  count = 0
  while(abs(f(x1)) > err){
    x0_temp = x1
    x1 = x1 - f(x1)*(x1 - x0)/( f(x1) - f(x0) )
    x0 = x0_temp
    count = count + 1
  }
  if(n==TRUE){
    return(count)
  } else {
    return(x1)
  }
}
(sol = secant(FUN,-1,1,FALSE,0.001)) # Solution to the equation

bisection = function(f,x0,x1,n,err){
  count = 0
  c = (x0+x1)/2
  while(abs(f(c)) > err){
    if(f(x0)*f(c)<0)
      x1 = c
    if(f(x0)*f(c)>=0)
      x0 = c
    c = (x0 + x1)/2
    count = count + 1
  }
  if(n==TRUE){
    return(count)
  } else {
    return(c)
  }
}

n_secant = secant(FUN,-1,1,TRUE,0.001)
n_bisection = bisection(FUN,-1,1,TRUE,0.001)
c(n_secant,n_bisection) # Bisection Method takes more iteration

# ==============================================================================
# 22/23 Sem1
# Q1(a)
q1a <- function(n){
  M <- matrix(0, ncol=n,nrow=n)
  for(i in 1:n){
    for(j in 1:n){
     if (i==j){
       M[i,j] <- 1
     } 
      else{
        M[i,j] <- 2
      }
    }
  }
  return(M)
}

# Q1(b)
TFT <- function(n){
  if (n==1){
    return(TRUE)
  }
  else{
    vec <- vector("logical",n)
    vec[1] <- vec[n] <- TRUE
    n[1] <- n
    return(vec)
  }
}

# Q1(c)
q1c <- function(n){
  M <- matrix(2,ncol=n,nrow=n)
  for (i in 1:n){
    for (j in 1:n){
      if (i==1 | i==n | j==1 | j==n){
        M[i,j] <- 1
      }
    }
  }
  return(M)
}

# Using TFT()
q1c <- function(n){
  M <- matrix(0,ncol=n,nrow=n)
  for (i in 1:n){
    for (j in 1:n){
      if (i==1 | i==n){
        M[1,] <- M[n,] <- vector("logical",n)+1
      }
      else{
        M[i,] <- rep(2,n) - TFT(n)
      }
    }
  }
  return(M)
}

m<-matrix(TFT(n),nrow=n,bycol=T)
# Q1(d)
q1d <- function(n){
  M <- matrix(2,ncol=n,nrow=n)
  for(i in 1:n){
    for (j in 1:n){
      if (i==j | i==1 | j==1 | i==n |j==n | i+j==n+1){
        M[i,j] <- 1
      }
    }
  }
  return(M)
}

# Q2(a)
obj <- function(p,x){
  ans <- sum(log(dnorm(x,p[1],p[2])))
  return(-ans)
}

# Q2(b)
d <- rnorm(1000,mean=10, sd=sqrt(25))

# Q2(c)
p <- c(0,1)
f <- log(dnorm(d,0,1))
max(f)

# ==============================================================================
# 22/23 Sem2
# Q1

"%xor%" <- function(x,y){
  ifelse(x==y,FALSE,TRUE)
}

# Q2(a)
is.square <- function(A){
  return(ncol(A)==nrow(A))
}

# Q2(b)
is.sym <- function(A){
  if(!is.square(A)){
    return(FALSE)
  }
  n <- nrow(A) 
  for(i in 1:n){
    for (j in 1:n){
      if (A[i,j]!=A[j,i]){
        return(FALSE)
      }
    }
  }
  return(TRUE)
}

# Q2(c)
is.sspd <- function(A){
  if(!is.sym(A)){
    return(FALSE)
  }
  eig <- eigen(t(A))
  ans <- ifelse(eig$values>=0, TRUE, FALSE)
  return(all(ans))
}

# Q2(d)
cov2corr <- function(C){
  if(!is.sspd(C)){
    stop("Input matrix is not symmetric semi-positive definite")
  }
  n <- ncol(C)
  S_Inv <- matrix(0,ncol=n, nrow=n)
  for (i in 1:n){
    for (j in 1:n){
      if (i==j){
        S_Inv[i,j] <- 1/sqrt(C[i,j])
      }
    }
  }
  R <- S_Inv %*% C %*% S_Inv
  return(R)
}

# 23/24 Sem1
# Q1(a)
MinMaxRatio <- function(x){
  v <- vector("numeric", length(x))
  max <- max(x)
  for (i in 1:length(x)){
    v[i] <- x[i]/max
  }
  return(v)
}

# Q1(b)
Standardize <- function(x){
  smean <- mean(x)
  sd <- sd(x)
  v <- vector("numeric", length(x))
  for (i in 1:length(x)){
    v[i] <- (x[i]-smean)/sd
  }
  return(v)
}

# Q2(a)
euclidean <- function(x,y){
  v <- vector("numeric", length(x))
  for (i in 1:length(x)){
    v[i] <- (x[i]-y[i])**2
  }
  return(sqrt(sum(v)))
}

# Q2(b)
d <- matrix(c(0,0,0,3,4,0), nrow=3, byrow=TRUE)
distance_v1 <- function(d){
  n <- nrow(d)
  M <- matrix(0, ncol=n, nrow=n)
  for (i in 1:n){
    for (j in 1:n){
      if (i==j){
        M[i,j] <- 0 
      }
      else{
        M[i,j] <- euclidean(d[i,],d[j,])
      }
    }
  }
  return(M)
}

# Q2(c)
distance_v2 <- function(d){
  n <- nrow(d)
  M <- matrix(0, ncol=n, nrow=n)
  for(i in 1:n){
    for (j in 1:n){
      if (i==j){
        M[i,j] <- 0
      }
      else{
        M[i,j] <- euclidean(d[i,],d[j,])
        M[j,i] <- M[i,j]
      }
    }
  }
  return(M)
}

