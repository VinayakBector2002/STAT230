## R Tutorial
## Part 2: Simple operations and variable assignments

### Exercise 1.1 

## a)

a <- 1:10 # natural numbers 1, 2, ..., 10
b <- 10^(-(1:10)) # take 10 to the power of the vector -1, -2, ..., -10

## b)
d <- a * b

## c)
everyother <- seq(from = 1, to = 9, by = 2) # all 'uneven' indices
d[everyother] <-  0 # change 'd' at all uneven indices to 0

## d)
a+d # print



### Exercise 1.2

## a)

M <- matrix(1:9, ncol = 3) 

## b)

N <- M * M 

## c)

Ninv <- solve(N)

## d)

Ninv %*% N # should be diagonal matrix with entries 1 (which it is, up to rounding)



### Exercise 1.3

nvals <- 1:40 # {1, 2, ..., 40} for the x-axis
n_fact <- factorial(nvals) # apply factorial (!) to nvals componentwise
n_stirling <- sqrt(2*pi*nvals) * (nvals / exp(1))^nvals # Stirlings approx 

plot(nvals, n_fact, xlab = "n", ylab = "n!")
lines(nvals, n_stirling, col = 2)

## ... we don't see much! Let's change the 'y' axis to logarithmic spacing 
## (so exponential functions become lines)

plot(nvals, n_fact, xlab = "n", ylab = "n!", log = "y")
lines(nvals, n_stirling, col = 2)

## ... much better! 
