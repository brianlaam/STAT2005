# Checking bankrupt in random walk
# Generate sample
r <- sample(c(-1,1), prob=c(0.5,0.5), size=100, replace=T)
r <- c(10,r)
r

# Cumsum
w <- cumsum(r)
w <- as.ts(w)
plot(w, main="Random Walk")
abline(h=10)
abline(h=0)

w<0

# Biased coin
b <- sample(c(-1,1), prob=c(0.75,0.25), size=100, replace=T)
b <- c(10,b)
b

# Cumsum
k <- cumsum(b)
k <- as.ts(k)
plot(k, main="Random Walk")
abline(h=10)
abline(h=0)

k<0