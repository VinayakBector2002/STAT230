library(ggplot2) # This is only used to make some nicer plots
#########
#   Flip Coin(s)
#########
?rbinom

# 1 time, 1 flips, p=0.5
rbinom(1,1,0.5) # also rbinom(n=1, size=2, prob=0.5)

# X is RV counting heads if we flip coin once
#   Do this experiment 500 times
Xs = rbinom(500, 1, 0.5)
Xs

# Expected value is np = 1(0.5) = 0.5
mean(Xs)

# Var is np(1-p) = 1(0.5)(1-0.5) = 0.25
var(Xs)

# visualize
hist(Xs) # This is base R
ggplot(data.frame('val'=Xs, 'Color'=ifelse(Xs,'1','0')))+ # This uses library
  geom_histogram(aes(x=val, fill=Color), bins=2) +
  theme_bw()

#########
#   Roll Dice
#########
sides <- 6
n <- 600

Xs <- sample(1:sides,n, replace = T)

mean(Xs) #3.5
var(Xs) #35/12

# visualize
#hist(Xs)
ggplot(data.frame('val'=Xs, 'Color'=as.factor(Xs)))+
  geom_histogram(aes(x=val, fill=Color), bins=6) +
  theme_bw()

#########
#   Flip Coins
#########
# X is RV counting heads if we flip coin 1000 times
#   Do this experiment 500 times (X is an entry in Xs)
Xs = rbinom(500, 1000, 0.5)
Xs

# Expected value is np = 1000(0.5) = 500
mean(Xs)

# Var is np(1-p) = 1000(0.5)(1-0.5) = 250
var(Xs)

# Note: Expected Value is less variable than mean

## Median
median(Xs)
mode(Xs)

# Define Mode function
getMode <- function(X) {
  # There are better ways, but basic idea
  tab <- table(X)
  rownames(tab)[tab==max(tab)]
}
getMode(Xs)


# visualize
hist(Xs)
Xs = rbinom(500, 1000, 0.5)
ggplot(data.frame('val'=Xs))+
  geom_histogram(aes(x=val), fill='gray',color='black',bins=30) +
  theme_bw()
