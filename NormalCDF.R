
## CDF of normal random variable
Qn <- function(c,n=1000){
  ## Input:
  #   c: Number to check ie phi(c)
  #   n: Number of trials
  ## Output:
  #   Qn: Estimated value for phi(c)
  #   sigmaHat2: Estimated variance
  #   Theoretical variance
  
  vals <- rep(NA,n)
  
  for(i in 1:n){
    ui <- runif(1)
    vals[i] <- exp(-c^2*ui^2/2)
  }
  
  # Get Results and Stats
  #   Note simplify intergration with the 1/2
  Qn <- 1/2 + 1/n*sum(vals)*c/sqrt(2*pi)
  valsForSigmaHat <- 1/2+vals*c/sqrt(2*pi)
  sigmaHat2 <- sum((valsForSigmaHat-Qn)^2)/(n-1)
  
  list(Qn, sigmaHat2, 1/(n*c^2))
}

