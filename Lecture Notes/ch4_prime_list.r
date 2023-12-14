prime_list <- function(n) {
	if (n >= 2) {
		comp <- seq(2, n)
		primes <- c()
		for (i in seq(2, n)) {
			cat("i = ", i, "\n")
			cat("any(comp == i): ", any(comp == i), "\n")
			if (any(comp == i)) {
				cat("prime_old: ", primes,"\n")
				cat("comp_old: ", comp, "\n")
				primes <- c(primes, i)
				comp <- comp[(comp %% i) != 0]
				cat("prime_new: ", primes, "\n")
				cat("comp_new: ", comp, "\n")
				readline()
			}
		}
		return(primes)
	} else {
		stop("Input value of n should be at least 2.")
	}
}
	