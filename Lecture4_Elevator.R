## Elevator Problem
## Set Params
passengers <- 4
floors <- 1:5

sims <- 10000
selections <- data.frame(matrix(ncol=4))
numDiffFloors <- rep(NA, sims) # Use this to count the number of different (unique) floors
floor2floor3 <- 0 # Use this to indicate if 2 got off on floor 2 and 2 on floor 3
groupsOf2 <- 0 # Use this to indicate 2 on a floor and 2 on another, different floor


## Simulate
for(i in 1:sims){
  # Get the floors each passenger ended on
  tmp <- sample(floors,passengers,replace = T)
  
  # Record passenger selections
  selections[i,] <- tmp
  
  # Record number of different floors
  numDiffFloors[i] <- length(unique(tmp))==4
  
  # Record if 2 went on floor 2 and 2 on floor 3
  if(length(tmp[tmp==2])==2 && length(tmp[tmp==3])==2)
    floor2floor3 <- floor2floor3 + 1
  # Record if 2 groups of two departed
  if(length(unique(tmp))==2){
    if(sum(tmp==unique(tmp)[1])==2 && sum(tmp==unique(tmp)[2])==2)
      groupsOf2 <- groupsOf2 + 1
  }
}

# Part (1)
mean(numDiffFloors) # Empirical solution
(5*4*3*2)/5^4 # True solution

# Part (2)
floor2floor3 / sims # Empirical solution
choose(4,2)/5^4 # True solution

# Part (3)
groupsOf2 / sims # Empirical solution
(choose(5,2)*choose(4,2))/5^4 # True solution
(choose(4,2)*5*choose(4,1))/5^4 # Wrong solution
