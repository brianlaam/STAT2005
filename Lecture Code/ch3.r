# Chapter 3

# Histogram
d<-read.csv("popden1.csv", stringsAsFactors=T) 	# read in data
names(d)				# display names in d

par(mfrow=c(2,2))		# set up a 2x2 multi-frame for graphics
hist(d$year86)			# produce 4 histograms filled in row by row
hist(d$lnpd86)
hist(d$year90)
hist(d$lnpd90)


par(mfrow=c(1,2))		# set up a 1 by 2 multi-frame
hist(d$lnpd86,freq=F)	# histogram with density instead of frequency
x<-seq(5,12,0.1)		# set up sequence for x
lines(x,dnorm(x,mean(d$lnpd86),sd(d$lnpd86)),lty=2)	# add density lines
hist(d$lnpd90,freq=F) 	# repeat for lnpd90
lines(x,dnorm(x,mean(d$lnpd90),sd(d$lnpd90)),lty=2)


# Pie chart
pie(d$lnpd90,labels=d$district, cex=0.8, main="log(density) HK1990")


# Bar Chart
# bar chart with color
barplot(
	d$lnpd90, horiz=T, col=rainbow(20), 
	xlim=c(0,25), legend.text=d$district,
	args.legend=list(x=25, y=23, cex=0.8),  
	main="log(Density) HK1990"
)

# bar chart with legend inside and number at the end
y<-barplot(d$lnpd90,horiz=T,col="white",xlim=c(0,15), main="log(Density) HK1990")
x<-round(d$lnpd90,1)			
# obtain the x-coord. and round to 1 decimal
text(0.5*x,y,d$district,cex=0.8)	
# add legend inside the bar
text(x+0.8,y,labels=x,cex=0.8)	
# add number at the end


# Grouped bar chart
yr86<-by(d$lnpd86,d$Region,sum)	
# sum lnpd86 by Region
yr90<-by(d$lnpd90,d$Region,sum)	
# sum lnpd90 by Region
rs<-cbind(yr86,yr90)			
# form 3x2 matrix rs

# vertical
barplot(
	t(rs),
	beside=T,
	horiz=F, 
	legend.text=c("yr86","yr90"),
	main="log(density)"
)

# horizontal with legend without border
barplot(
	rs,
	beside=T, 
	horiz=T, 
	xlim=c(0,100), 
	ylim=c(0,10), 
	legend.text=c("HK","KL","NT"), 
	args.legend=list(horiz=T,bty="n"),
	main="log(density)"
)

prop.table(t(rs),margin=1)	# margin index=1 means row
barplot(
	prop.table(t(rs),1),
	horiz=F, 
	legend.text=c("yr86","yr90"), 
	main="log(density)"
)

prop.table(rs,margin=2)		# margin index=2 means column
barplot(
	prop.table(rs,2),
	horiz=F, 
	xlim=c(0,3),
	legend.text=c("HK","KL","NT"), 
	main= "log(density)"
)


# QQ-normal plot
par(mfrow=c(2,2))
qqnorm(d$year86,main="Normal Q-Q plot for 1986")	# qq-normal plot for year86
qqline(d$year86,col="red")							# add reference line in red color
qqnorm(d$lnpd86,main="Normal Q-Q plot for lnpd86")	# qq-normal plot for lnpd86
qqline(d$lnpd86,col="red")
qqnorm(d$year90, main="Normal Q-Q plot for 1990")	# qq-normal plot for year90
qqline(d$year90,col="red")
qqnorm(d$lnpd90,main="Normal Q-Q plot for lnpd90")	# qq-normal plot for lnpd90
qqline(d$lnpd90,col="red")


# General QQ plot
r<-runif(1000,-10,10)
qqnorm(r)
qqline(r, col="red")

hist(r)

n<-length(r)
r2<-sort(r)
i<-((1:n)-0.5)/n
q<-qunif(i)
plot(q,r2,main="Uniform QQ Plot")
abline(lsfit(q,r2), col="red")


# Box-plot with x label
par(mfrow=c(1,2))
yr<-c(rep(86,19),rep(90,19))			# create yr as year indictor
pd<-c(d$year86,d$year90)				# stack pd86 with pd90 as a vector
lnpd<-c(d$lnpd86,d$lnpd90)				# stack lnpd86 with lnpd90 as a vector
boxplot(pd~yr,main="pd86 vs pd90")		# boxplot for year86 and year90
boxplot(lnpd~yr,main="ln pd86 vs ln pd90")	# boxplot for lnpd86 and lnpd90



# Box-plot with y label
par(mfrow=c(2,1))									# set up a 2x1 multi-frame
boxplot(pd~yr,horizontal=T,main="pd86 vs pd90")		# horizontal boxplot 
boxplot(lnpd~yr,horizontal=T,main="ln pd86 vs ln pd90")	# hotizontal boxplot 



# Box-plot by region
s86<-split(d$lnpd86,d$Region)	# split year86 by Region
s90<-split(d$lnpd90,d$Region)	# split year90 by Region


par(mfrow=c(1,3))		  		# set multiframe 1x3
boxplot(c(s86$HK,s90$HK)~rep(c(86,90),each=length(s86$HK)),main="HK",xlab="",ylab="")  # boxplot for HK
boxplot(c(s86$KL,s90$KL)~rep(c(86,90),each=length(s86$KL)),main="KL",xlab="",ylab="")  # boxplot for KL
boxplot(c(s86$NT,s90$NT)~rep(c(86,90),each=length(s86$NT)),main="NT",xlab="",ylab="")  # boxplot for NT

par(mfrow=c(1,1))			  	# reset multiframe to 1x1
title(sub="ln pd86 vs ln pd90 by Region")  # add sub-title



# Box-plot lnpd86~Region and lnpd90~Region
par(mfrow=c(1,2))				# set mfrow to (1,2)
boxplot(lnpd86~Region,data=d,main="lnpd86")	# boxplot using formula
boxplot(lnpd90~Region,data=d,main="lnpd90")


# Scatter plot
par(mfrow=c(1,1))									# reset mfrow to (1,1)
plot(d$lnpd86,d$lnpd90,main="Plot with case no.")	# plot lnpd90 vs lnpd86
text(d$lnpd86-0.1,d$lnpd90+0.1,cex=0.6)				# add case no to the points



# Using symbol and color in scatter plot
d$Region
plot(d$lnpd86,d$lnpd90,pch=21,bg=c("red","blue","green")[d$Region])


d[d$year86<d$year90,]		# select from d according to the condition

# create a numeric vector, id=2 if year86<year90; id=1 otherwise
id<-(d$year86<d$year90)+1	
par(mfrow=c(1,2)) # create 1x2 multiframe graphics
# plot lnpd90 vs lnpd86 with different symbols according to id
plot(d$lnpd86,d$lnpd90,pch=c(19,21)[id])
# plot lnpd90 vs lnpd86 with color according to id: red=decrease, blue=increase
plot(d$lnpd86,d$lnpd90,pch=21,bg=c("red","blue")[id])


# Matrix scatter plot
d<-read.csv("iris.csv")	# read in data
# produce the scatter plot matrix with color according to species
pairs(d[,1:4],pch=21,bg=c("red","blue","green")[d$Species])


# Time series plot
d<-read.table("stock.dat")	# read in data
names(d)					# display names in d
t1<-as.ts(d$HSBC)			# change to time series object
t2<-as.ts(d$CLP)
t3<-as.ts(d$CK)
par(mfrow=c(3,1))			# set up multiframe graphics
plot(t1)					# time series plots
plot(t2)
plot(t3)


t<-cbind(t1,t2,t3)	# combine these time series column-by-column
par(mfrow=c(1,1))	# reset the multiframe graphics into one plot
plot(t)				# plot the time series matrix


matplot(t,type="l")	# use matplot to plot on the same y-axis
grid()				# add in grid lines


par(mfrow=c(3,1))		# define 3x1 multiframe graphic
u1<-log(lag(t1)/t1)		# transform
u2<-log(lag(t2)/t2)
u3<-log(lag(t3)/t3)
plot(u1,main="HSBC")	# plot with main title
grid()					# add grid lines
plot(u2,main="CLP")
grid()
plot(u3,main="CK")
grid()


# Mathematical function
x1 <- seq(-0.4,-0.001, by=0.001)
x2 <- seq(0.001,0.4, by=0.001)
x <- c(x1, 0, x2) # x = 0 is a special case
y <- c(x1*sin(pi/x1), 0, x2*sin(pi/x2))
plot(x,y, type="l", ylim=c(-0.4,0.4))
abline(0,1, lty=2)
abline(0,-1, lty=2)


# Curve function
curve(x*sin(x),-4*pi,4*pi)


# Example: Orange data 
plot(circumference~age, pch = as.numeric(as.character(Tree)),data = Orange)
abline(lm(circumference~age, data = Orange, subset = Tree == "1"), lty = 1)
abline(lm(circumference~age, data = Orange, subset = Tree == "2"), lty = 2)
abline(lm(circumference~age, data = Orange, subset = Tree == "3"), lty = 3, lwd = 2)
abline(lm(circumference~age, data = Orange, subset = Tree == "4"), lty = 4)
abline(lm(circumference~age, data = Orange, subset = Tree == "5"), lty = 5)
legend("topleft", legend = paste("Tree", 1:5), lty = 1:5, pch = 1:5, lwd = c(1, 1, 2, 1, 1))


# Example: A sketch
plot(0, 0, type="n", xlim=c(0,10), ylim=c(0,10), 
	bty="n", xlab="", ylab="")
points(c(0,0,10,10), c(0,10,0,10))
text(
	c(0.5,0.5,9.5,9.5), 
	c(0.5,9.5,0.5,9.5), 
	labels = c("(0,0)","(0,10)","(10,0)","(10,10)")
)
abline(2,1,lwd=2,col="red")
abline(h=5,lty=2)
abline(v=5,lty=2)
polygon(c(2,4,4,2), c(6,6,8,8), col="yellow")
polygon(c(2,4,2,4), c(6,6,8,8), col="blue")
segments(1,6,1,8, col="darkgreen", lwd=2)
arrows(4,9,2,9, length = 0.1)
symbols(8,2, circles=1, add=T, inch=F)
mtext("x-axis",1,2)
box(lty=4, lwd=2, col="violet") 

