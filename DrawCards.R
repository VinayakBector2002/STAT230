## Set Params
suits <- c('diamonds','spades','hearts','clubs')
values <- c('A',2,3,4,5,6,7,8,9,10,'J','Q','K')
n <- 1000
sel <- 5
results <- rep(NA, n) # make an empty vector

## Build Deck
deck <- expand.grid(suits,values)
colnames(deck) <- c('Suit','Value')

## Draw  cards without replacement, independently over n trials
for(i in 1:n){
  # Get sel cards without replacement from deck
  hand <- deck[sample(nrow(deck),sel),]
  
  # Count number drawn that are hearts
  results[i] <- nrow(hand[hand$Suit=='hearts',])
}

## Get average number of hearts drawn
mean(results)
# What should be the true solution?



