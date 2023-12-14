# Asm 3
# Q1
questionnaire <- function(){
  data <- matrix(, nrow = 0, ncol = 3)
  colnames(data) = c("Name", "Age", "Gender")
  data <- as.data.frame(data)
  
  cat("Please respond to the following three questions.\n\n")
  n <- 1
  
  repeat {
    cat("Question 1: What's your name? : ")
    data[n,1] <- readline()
    repeat {
      cat("Question 2: What's your age? <integer required>: ")
      age <- readline()
      age <- suppressWarnings(as.numeric(age))
      if (is.na(age) == TRUE | trunc(age) != age) {
        cat("Please input positive integer.\n")
        next
      }
      data[n,2] <- age
      break
    }
    repeat {
      cat("Question 3: What's your gender? <M/F>: ")
      gender <- toupper(readline())
      if ((gender == "M")|(gender == "F")) {
        data[n,3] <- gender
        break
      } else {
        cat("Please input M or F.\n")
      }
    }
    repeat {
      cat("New entry? <Y/N>: ")
      new <- toupper(readline())
      if ((new == "Y")|(new == "N")) {
        break
      } else {
        cat("Please input Y or N.\n")
      }
    }
    if (new == "Y") {
      n <- n+1
      next
    } else {
      break
    }
  }
  cat("The average age is", mean(data$Age),"from", n, "respondents.\n")
  m <- sum(data$Gender == "M")
  pie(c(m/n,1-m/n), labels = c("M", "F"), init.angle = 90)
  return(data)
}

# Q2(a)
T<-matrix(c(0.5,0.2,0.3,0.3,0.4,0.3,0.4,0.3,0.3),nrow=3,byrow=T)	
(T%*%T) # n-th step transition

# Q2(b)
T6 <- diag(3)
for (i in 1:6) {
  T6 <- T6 %*% T
}
T6[1,1]

# Q2(c)
S1 <- matrix(c(0.45,0.25,0.3,0.3,0.4,0.3,0.4,0.3,0.3),nrow=3,byrow=T)
eig1<-eigen(t(S1))
(eig1$vectors[,1]/sum(eig1$vectors[,1]))[2]


S2 <- matrix(c(0.5,0.2,0.3,0.3,0.4,0.3,0.4,0.35,0.25),nrow=3,byrow=T)
eig2<-eigen(t(S2))
(eig2$vectors[,1]/sum(eig2$vectors[,1]))[2]

# For strategy 1, P(Stays C2) = P(C2|C2) =  0.3117647
# For strategy 2, P(Stays C2) = P(C2|C2) =  0.3035714
# So, strategy 1 is more preferable for Channel 2.