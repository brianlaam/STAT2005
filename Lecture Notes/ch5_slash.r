slash <- function(X) {
	m<-ncol(X)
	n<-nrow(X)
	(outer(1:n,1:m,"+")==min(m,n)+1)*X
	
	# for (i in 1:n) {
		# for (j in 1:m) {
			# if ((i+j)!=min(m,n)+1) X[i,j] <- 0
		# }
	# }
	# return(X)
}

slash(matrix(1:20,ncol=4))
slash(matrix(1:20,ncol=5))