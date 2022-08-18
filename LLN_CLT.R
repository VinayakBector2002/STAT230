####
##    This code is used to compare Law of large numbers (LLN) and Central limit
##      theorem (CLT)
##    LLN: Indicates estimate average will get closer to true
##    CLT: Indicates the distribution of estimates will look normal

set.seed(12345)

nsims <- 25
nTrials <- 10
die <- 1:6

results <- rep(NA, nTrials)

for(i in 1:nTrials){
  
  results[i] <- mean(sample(die,nsims, replace=T))
}

ggplot() +
  geom_histogram(aes(x=results, y=..density..), 
                 fill='red',alpha=0.5, color='black', bins=25) +
  geom_vline(aes(xintercept=3.5), color='Blue', size=1 ) +
  geom_vline(aes(xintercept=mean(results)), 
             color='red', linetype='dashed', size=1) +
  theme_bw()

################
nTrials <- 100

for(i in 1:nTrials){
  
  results[i] <- mean(sample(die,nsims, replace=T))
}

ggplot() +
  geom_histogram(aes(x=results, y=..density..), 
                 fill='red',alpha=0.5, color='black', bins=25) +
  geom_vline(aes(xintercept=3.5), color='Blue', size=1 ) +
  geom_vline(aes(xintercept=mean(results)), 
             color='red', linetype='dashed', size=1) +
  theme_bw()

################
nTrials <- 1000

for(i in 1:nTrials){
  
  results[i] <- mean(sample(die,nsims, replace=T))
}

ggplot() +
  geom_histogram(aes(x=results, y=..density..), 
                 fill='red',alpha=0.5, color='black', bins=25) +
  geom_vline(aes(xintercept=3.5), color='Blue', size=1 ) +
  geom_vline(aes(xintercept=mean(results)), 
             color='red', linetype='dashed', size=1) +
  theme_bw()

################
nTrials <- 10000

for(i in 1:nTrials){
  
  results[i] <- mean(sample(die,nsims, replace=T))
}

ggplot() +
  geom_histogram(aes(x=results, y=..density..), 
                 fill='red',alpha=0.5, color='black', bins=25) +
  geom_vline(aes(xintercept=3.5), color='Blue', size=1 ) +
  geom_vline(aes(xintercept=mean(results)), 
             color='red', linetype='dashed', size=1) +
  theme_bw()

################
nTrials <- 100000

for(i in 1:nTrials){
  
  results[i] <- mean(sample(die,nsims, replace=T))
}

ggplot() +
  geom_histogram(aes(x=results, y=..density..), 
                 fill='red',alpha=0.5, color='black', bins=25) +
  geom_vline(aes(xintercept=3.5), color='Blue', size=1 ) +
  geom_vline(aes(xintercept=mean(results)), 
             color='red', linetype='dashed', size=1) +
  theme_bw()

