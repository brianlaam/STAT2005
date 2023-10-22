## Exercise 1

# 1(a)
seq(5,50,5)

# 1(b)
rep(6:1, each=2)

# 1(c)
1:20-rep(seq(0,9, by=3), rep(5,4)) 

# 1(d)
1:12+rep(1:3,4)

# 2(a)
participants <- data.frame(
  school = c("CUHK", NA,"HKBU", "HKUST", "CUHK"),
  destination = c("Austria", "Japan", "Korea", "Austria", "Sweden"),
  age = c(18,20,22,NA,20)
)
participants

# 2(b) # Change data column
participants$destination <- factor(participants$destination)
levels(participants$destination) <- c("Australia","Japan","Korea","Sweden")
participants

# 2(c)
participants$school[2] <- "HKU"
participants

