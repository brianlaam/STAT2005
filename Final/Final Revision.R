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
series <- merge(game1, game2, by = c("Initials", "Surname"))[order(-merge(game1, game2, by = c("Initials", "Surname"))$Second.y), ]

# Q2(c)
Name <-  paste(Initials, Surname)
q2c <- data.frame(Name, First, Second)

# Q3
# Compare and contrast the following aspects in R and SAS programming:
# (a) Commenting;
# (b) Missing values in datasets;
# (c) Selecting subsets in datasets. 

# (a) Commenting
# R uses "#" and no direct mutiple lines comments
# SAS uses "/" and "/*" & "*/" for mutiple lines comments

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
Fifth <- matrix(0)
for (i in 1:5){
  Fifth <- T%*%T
}

# Q1(d)
eig1<-eigen(t(T))
(eig1$vectors[,1]/sum(eig1$vectors[,1]))
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




