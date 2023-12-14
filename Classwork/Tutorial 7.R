1. browser() function

Use browser() command at the beginning of your function or before the loop to run the code line by line.

# Example

my_function <- function(){

  # want to see the change of result during the loop
  browser()
  # record each time’s mean value
  result = NULL
  for (i in 1:10) {
    x <- rnorm(10)
    result = c(result,mean(x))
    }
  return(result)
}

my_function()

# Remark

You will see the result appending one by one. Specifically for loops, if you don’t want 
to run the code line by line, and want each time the code will stop at the exact line, 
you can use the breakpoint. You can do this in RStudio by clicking to the left of the 
line number in the editor, or by pressing Shift+F9 with your cursor on the desired line.

2. print() function

You can print the variables inside the function

# Example

my_function <- function(){
  # record each time’s mean value
  result = NULL
  for (i in 1:10) {
    x <- rnorm(10)
    result = c(result,mean(x))
    print(result) # cat(result)
    }
  return(result)
}

my_function()

3. outer() function

# Usage

The outer product of the arrays X and Y is the array A with dimension c(dim(X), dim(Y)) 
where element A[c(arrayindex.x, arrayindex.y)] = FUN(X[arrayindex.x], Y[arrayindex.y], ...).

FUN must be a vectorized function expecting at least two arguments and returning 
a value with the same length as the first (and the second).
  
# Example

# get the elements on the right diagonal
slash <- function(X) {
  m<-ncol(X)
  n<-nrow(X)
  # remain the elements whose summation of indexes is equal to 5
  # discard other elements
  (outer(1:n,1:m,"+")==min(m,n)+1)*X
}
matrix(1:20,ncol=4)
slash(matrix(1:20,ncol=4))

# Example

if we want to create a matrix a_ij = i + j and the dimension is c(3,3):
A = outer(1:dimension,1:dimension,'+')

Remark: not the "sum" function, why? Use the Vectorized one

4. Solutions to Exercises

(a) 
i<- 1:25
sum((2^i)/i+3^i/(i^2))

(b)
sum((1:20)^4)*sum(1/(4:8))
sum(outer((1:20)^4,4:8,"/"))

(c)
sum((1:20)^4/(3+outer(1:20,1:5,"*")))

(d)
sum(outer(1:10,1:10,function(i,j){(i>=j)*i^4/(3+i*j)}))