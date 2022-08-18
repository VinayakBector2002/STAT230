## Set Params
nums <- 0:9
sims <- 100000
nDigits <- 3

results <- rep(NA, sims)

## Iterate many times
for(i in 1:sims){
  # Select 3 digit pin with replacement
  tmp <- sample(nums, nDigits, replace = T)
  
  # count the number of unique digits
  results[i] <- length(unique(tmp))
}

# Compare empirical to true (This is for 3 digits looking at 2 or 1 unique pins)
mean(results<=2) # Number of times we get 2 or 1 unique digits
(choose(3,2)*choose(10,1)*choose(9,1)+choose(10,1)) / 10^nDigits # 0.28

