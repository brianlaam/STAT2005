# Another version with pause
sierpinski <- function() {
	b1<-0; b2<-0; g1<-1; g2<-0; r1<-cos(pi/3); r2<-sin(pi/3)						
	xy<-rbind(c(b1,b2),c(g1,g2),c(r1,r2))	
	plot(xy,main="Sierpinski triangle",xlab="",ylab="")	
	points(b1,b2,pch=21,bg="blue")
	points(g1,g2,pch=21,bg="green")
	points(r1,r2,pch=21,bg="red")
	n<-5000; x0<-0.5; y0<-0.5
	set.seed(1234)	
	cat("Number of steps to go: ")
	pause<-as.numeric(readline())
	for (i in 1:n) {
		col<-sample(c("b","g","r"),prob=c(1/3,1/3,1/3),size=1)	
		if (col=="b") {
			x<-(x0+b1)/2; y<-(y0+b2)/2
			points(x,y,pch=21,bg="blue")	
		}
		if (col=="g") {		
			x<-(x0+g1)/2; y<-(y0+g2)/2
			points(x,y,pch=21,bg="green")
		}
		if (col=="r") {
			x<-(x0+r1)/2; y<-(y0+r2)/2
			points(x,y,pch=21,bg="red")
		}
		x0<-x; y0<-y
		if (i > pause) {
			cat("Number of steps to go: ")
			pause<-pause+as.numeric(readline())
		}
	} 
}

sierpinski()