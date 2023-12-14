# Chapter 7

library() 

install.packages("sas7bdat")
install.packages("rgl")
install.packages("quantmod")

# The sas7bdat package
library(sas7bdat) 
library(help=sas7bdat)
x <- read.sas7bdat("country.sas7bdat")


# The rgl package

library(rgl)
fxy<-function(x,y) {	
p<-sqrt((x-5)^2+(y-5)^2)
   -sin(p)/p }
x<-seq(-15,20,by=0.1)			
y<-x
z<-outer(x,y,fxy)				
persp3d(x,y,z,theta=-30, phi=30, col="gold", ticktype="detailed")


fxy<-function(x,y) {(x^2+3*y^2)*exp(-x^2-y^2)}
x<-seq(-5,5,by=0.1); y<-x; z<-outer(x,y,fxy)			
persp3d(x,y,z, col="gold", ticktype="detailed")


fxy<-function(x,y) {x*y^3-y*x^3}
x<-seq(-10,10,by=0.1); y<-x; z<-outer(x,y,fxy)
persp3d(x,y,z, col="gold", ticktype="detailed")	


fxy<-function(x,y) {((1-sign(-x-.9+abs(y*2)))/3*(sign(.9-x)+1)/3)*(sign(x+.65)+1)/2 - ((1-sign(-x-.39+abs(y*2)))/3*(sign(.9-x)+1)/3) + ((1-sign(-x-.39+abs(y*2)))/3*(sign(.6-x)+1)/3)*(sign(x-.35)+1)/2}
x<-seq(-2,2,by=0.005); y<-x; z<-outer(x,y,fxy)
persp3d(x,y,z, col="gold", ticktype="detailed")


# Torus
res <- 200
theta <- seq(0,2*pi,length=res)
alpha <- 1
beta <- 2
xm <- outer(theta,theta,
	function(t1,t2) (beta+alpha*cos(t2))*cos(t1)
)
ym <- outer(theta,theta,
	function(t1,t2) (beta+alpha*cos(t2))*sin(t1)
)
zm <- outer(theta,theta,
	function(t1,t2) alpha*sin(t2)
)
persp3d(x=xm,y=ym,z=zm,
	col="tan",aspect=c(1,1,0.4),
	axes=FALSE,xlab="",ylab="",zlab=""
)

donutcols <- rep("tan",res^2)
donutcols[as.vector(zm)>0] <- "pink"
sprinkles <- c("blue","green","red","violet","yellow")
donutcols[sample(
	x=which(as.vector(zm)>0),size=300
)] <- sprinkles
persp3d(xm,ym,zm,
	col=donutcols,aspect=c(1,1,0.4),
	axes=FALSE,xlab="",ylab="",zlab=""
)


# The quantmod package 
library(quantmod)
stk_price<-getSymbols("0005.HK", from="2017-01-01", to="2017-03-31", src="yahoo", auto.assign=FALSE)

# Example: Plotting financial data
getSymbols("GOOG", from="2016-01-01", to="2018-07-31")
barChart(GOOG)

# Add multi-coloring and change background to white
candleChart(GOOG, multi.col=TRUE, theme='white', subset='2016-12::2017-03')
addBBands()		# Bollinger Bands
addWMA()		# Weighted Moving Average
addRSI()		# Relative Strength Indicator


# tidyverse
# install.packages("tidyverse")
library(tidyverse)
vignette("manifesto", package = "tidyverse")

# pipe
x <- c(0.109, 0.359, 0.63, 0.996, 0.515, 0.142, 0.017, 0.829, 0.907)
round(exp(diff(log(x))), 1)

x %>% log() %>%
    diff() %>%
    exp() %>%
    round(1)


# ggplot2

# Random subset
set.seed(1410) 
dsmall <- diamonds[sample(nrow(diamonds),100),]

# Scatterplot
qplot(carat, price, data = diamonds)
qplot(log(carat), log(price), data = diamonds)

qplot(carat, x * y * z, data = diamonds)

# Colour, size, shape and other aesthetic attributes
qplot(carat, price, data = dsmall, colour = color)
qplot(carat, price, data = dsmall, shape = cut)

qplot(carat, price, data = diamonds, alpha = I(1/100))

# geom

# Smoother
qplot(carat, price, data = dsmall, geom = c("point", "smooth"))
qplot(carat, price, data = diamonds, geom = c("point", "smooth"))

# Boxplots and jittered points
qplot(color, price / carat, data = diamonds, geom = "boxplot")
qplot(color, price / carat, data = diamonds, geom = "jitter", alpha = I(1 / 50))

# Histogram and density plots
qplot(carat, data = diamonds, geom = "histogram")
qplot(carat, data = diamonds, geom = "density")

qplot(carat, data = diamonds, geom = "histogram", binwidth = 1, xlim = c(0,3))
qplot(carat, data = diamonds, geom = "histogram", binwidth = 0.1, xlim = c(0,3))
qplot(carat, data = diamonds, geom = "histogram", binwidth = 0.01, xlim = c(0,3))

qplot(carat, data = diamonds, geom = "density", colour = color)
qplot(carat, data = diamonds, geom = "histogram", fill = color)

# Time series with line and path plots
qplot(date, unemploy / pop, data = economics, geom = "line")

qplot(unemploy / pop, uempmed, data = economics, geom = c("point", "path"))

# Faceting
qplot(carat, data = diamonds, facets = color ~ ., geom = "histogram", binwidth = 0.1, xlim = c(0, 3))

# ggplot()

# Histogram using layer
p <- ggplot(diamonds, aes(x = carat))
p <- p + layer(
	geom = "bar",
	stat = "bin",
	position = "identity",
	params = list(fill = "steelblue", binwidth = 0.3)
)
p

# Shortcut function 
p + geom_histogram(binwidth = 0.3, fill = "steelblue")

# Equivalent plots
qplot(sleep_rem / sleep_total, awake, data = msleep) + geom_smooth()
qplot(sleep_rem / sleep_total, awake, data = msleep, geom = c("point", "smooth"))
ggplot(msleep, aes(sleep_rem / sleep_total, awake)) + geom_point() + geom_smooth()

# Aesthetic mappings
p <- ggplot(data=mtcars, aes(x=hp, y=mpg, color=cyl))
p + geom_point(size=3)
p + geom_point(size=3) + geom_smooth(method="lm", aes(fill=cyl))

# stat_bin
ggplot(diamonds, aes(carat)) + geom_histogram(aes(y = ..density..), binwidth = 0.1)

# Combining geoms and stats
d <- ggplot(diamonds, aes(carat)) + xlim(0, 3)
d + stat_bin(aes(ymax = ..count..), binwidth = 0.1, geom = "area")
d + stat_bin(
	aes(size = ..density..), binwidth = 0.1,
	geom = "point", position="identity"
)


# List of geoms
geoms <- help.search("^geom_", package = "ggplot2")
geoms$matches[, 1:2]

# List of stats
stats <- help.search("^stat_", package= "ggplot2")
stats$matches[, 1:2]

# Example: Plotting a heart 
dat <- data.frame(x=seq(0, 2*pi, length=100))
heart <- function(x) {2-2*sin(x) + sin(x)*(sqrt(abs(cos(x))))/(sin(x)+1.4)}
ggplot(dat, aes(x=x)) + stat_function(fun=heart) + coord_polar(start=-pi/2)


# tibble
tibble(x = 1:2, y = x + 1)


# readr
data <- "x,y,z
		 1,2,3
		 4,5,6
		 7,B,9"
read_csv(data)

read_csv(data, col_types = "nnn") # three numeric columns


# stringr
df = tibble(
	phone = c(
	"705 555 0100",
	"+1 519 555 0101",
	"4165550102",
	"514 555-0103",
	"011-800-555-0104"
	)
)

phone <- df$phone %>%
str_remove_all("[^0-9]") %>% # removes all digits
# the pattern [ˆ0-9] means a single character that is not in the range 0 to 9.
str_replace("1(..........)", "\\1") %>%
# 1(..........) means the character 1 followed by a grouping of 10 characters
# "\\1" is a numbered capturing group. A capturing group stores the part of the string matched by the part of the regular expression inside the parentheses.
"[<-"(., str_length(.) != 10, NA) %>%
# This is same as temp[str_length(temp) != 10] <- NA
"str_sub<-"(7, 6, value = "-") %>%
# insert "-" between 6th and 7th character
# This is same as str_sub(temp, 7, 6) <- "-"
"str_sub<-"(4, 3, value = "-")
# insert "-" between 3th and 4th character
phone


# dplyr
# filter
mpg %>% filter(cyl == 5)

# arrange
mpg %>% arrange(cty, hwy)
mpg %>% arrange(desc(cty), desc(hwy))

# select
mpg %>% select(manufacturer, model, cty, hwy)
mpg %>% select(manufacturer, model, City = cty, Highway = hwy)

# mutate
lper100km <- mpg %>% mutate(cty = 235.215/cty, hwy = 235.215/hwy)
lper100km

# summerize
lper100km %>% group_by(cyl) %>%
summarize(cty = mean(cty), hwy = mean(hwy))

# sample_n
lper100km %>% group_by(cyl) %>% sample_n(1)
