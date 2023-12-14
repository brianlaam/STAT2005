repayment_time <- function(r, period, debt_initial, repayments) {	
	if (debt_initial*r*period >= repayments) { 
		stop("Repayment amount is too low.") 
	} else {
		time <- 0
		debt <- debt_initial
		while (debt > 0) {
			time <- time + period
			debt <- debt*(1 + r*period) - repayments
		}
		cat('Loan will be repaid in', time, 'years\n')
		return(time)
	}
}

repayment_time(0.12,1/12,1000,10)