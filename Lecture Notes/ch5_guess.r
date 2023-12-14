guess<-function() {				# guessing game between player A and B
	cat("I will randomly choose an integer x from 1 to 100.\n\n")   
	ans<-sample(1:100,size=1)		# generate an integer between 0 and 100
	p<-"A"							# initialize p, low and up
	low<-1
	up<-100   
	repeat {
		repeat {
			cat("Player",p,", please pick an integer from",low,"to",up,": ")
			inp<-readline()				# input
			inp<-suppressWarnings(as.numeric(inp)) # change to numeric
			if (is.na(inp) == TRUE) {	# check for character input
				cat("Invalid input.\n")
				next
			}
			if (trunc(inp) != inp) {	# check for non-integer input
				cat("Please input integer.\n")
				next
			}
			if ((inp<=up)&(inp>=low))  break
			else cat("Number out of range!\n")
		}
		if (inp==ans) break				# inp=ans, lose game
		if (p=="A") p<-"B" else p<-"A"	# switch player
		if (inp>ans) up<-inp-1			# update up
		else low<-inp+1					# update low
	}
	cat("Player",p,"lose the game.\n")	# display end message
}   
