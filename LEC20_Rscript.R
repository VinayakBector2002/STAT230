## STAT 230 - Section 2
## Spring 2022
## Lecture 20
## By Erik Hintz

set.seed(1) # fixes all randomness

## Sample realizations from the discrete uniform 
## distributin on {1,2,...,6} ("roll a fair die")

n <- 1000 # sample size
## We sample from the numbers 1:6, n times, with replacement
sample_dice <- sample(1:6, size = n, replace = TRUE)
## 'mysample' is now a vector of 1000 die rolls:
sample_dice

## We can compute the *sample mean* of 'sample_dice'
xbar_dice <- mean(sample_dice)
xbar_dice # close to 3.5!

## Sample realizations from a Poisson(3.5) distribution
sample_poisson <- rpois(n, lambda = 3.5)
sample_poisson

## We can compute the *sample mean* of 'sample_poisson'
xbar_poisson <- mean(sample_poisson)
xbar_poisson # also close to 3.5!

## => discrete uniform and Poisson(3.5) have the same mean
## (which we already knew!)

## We can see that they are still vastly different distributions by looking
## at a *histogram*

hist(sample_dice, breaks = 0:6, main = "Histogram of the dice rolls")
abline(v = xbar_dice, col = 2, lwd = 5)

hist(sample_poisson, main = "Histogram of the Poisson sample")
abline(v = xbar_poisson, col = 2, lwd = 5)
