## Travel Problem from 3.3
## Set Params
nStops <- 7
nPeople <- 5
nTrials <- 10000

## Iterate many times, having passengers select location
results <- rep(NA, nTrials) # make an empty vector
for(i in 1:nTrials){
  # Get sel cards without replacement from deck
  chosenFloors <- sample(1:nStops,nPeople, replace = T)
  
  # Count Number of unique stops (Hint: This will need to change for (c)-(e))
  results[i] <- length(unique(chosenFloors))
}

## Get estimate - Part (a)
sum(results==nPeople)/nTrials
7*6*5*4*3/7^5 # Sol
## Get estimate - Part (b)
sum(results==1)/nTrials
1/7^4 # Sol

## Can you solve the rest? Use the solutions to compare. 
#   Note, running more trials will get more accurate answers.
#   We will discuss Monte Carlo simulations later to better quantify our simulation