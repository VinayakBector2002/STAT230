## STAT 230
## Spring 2022
## R Assignment

## By Erik Hintz

## Question 1  #################################################################

## Let X denote the number of cars won in one week. Then
## X ~ Hyp(N= 5000, r = 15, n = 10)

## In R, we use dhyper() for the probability function which has arguments m,n,k
## The parameters in R mean: 
##    m = r (number of successes)
##    n = N-r (number of failures)
##    k = n (sample size)

N <- 5000
r <- 15
n <- 10

## With 'dhyper()' and 'phyper()', we find

## i) P(X = 1)
dhyper(1, m = r, n = N-r, k = n) # 0.02925167
   
## ii) P(X >= 1) = 1 - P(X = 0)
1 - dhyper(0, m = r, n = N-r, k = n) # 0.02962454 - only slightly larger!

## iii) P(X = 0)
dhyper(0, m = r, n = N-r, k = n) # 0.9703755

## Next, we use a binomial distribution (r is small compared to N, n is small)
p <- r/N # success probability 

## i) P(X = 1)
dbinom(1, size = n, prob = p) # 0.02919965

## ii) P(X >= 1)
1 - dbinom(0, size = n, prob = p)

## iii) P(X = 0)
dbinom(0, size = n, prob = p) # 0.9704018


## ... the approximation works well, as expected!


## Question 2  #################################################################

## Poisson process with lambda = 50 / week

## i) Let X = number of accidents on one day
##    Then X ~ Poi(50/7), so P(X>2) = 1 - P(X <= 2) is

1 - ppois(2, lambda = 50/7)

## ii) Let X = number of accidents in one week
##     Then X ~ Poi(50), so P(30 <= X <= 70) is
sum(dpois(30:70, lambda = 50))

# ... can also use ppois():
ppois(70, lambda = 50) - ppois(29, lambda = 50)


## iii) Wait 5 days until there is an accident free day
##      First compute p = probability accident-free day

p <- dpois(0, lambda = 50/7)

## Number of days until first day with no accident is Geo(p), so
## the probability you need to wait 5 days is

dgeom(5, prob = p) 



## Question 3  #################################################################

## i) n = 800 independent trials with p = 0.002, so X~Bin(800,0.002)
##    thus, P(X>3) = 1-P(X<=2) is
1 - pbinom(2, size = 800, prob = 0.002)

## ii) X follows approximately a Poisson(np) = Poisson(16) distribution, so
1 - ppois(2, lambda = 800 * 0.002)
## ... which is almost the same!



## Question 4  #################################################################

## N = 800 gears; r = 50 defect gears; n = 40 sample size
## So, X ~ Hyp(N, r, n)

N <- 800
r <- 50
n <- 40

## i) 

## P(X = 4)
dhyper(4, m = r, n = N-r, k = n) # 0.1386404

## P(X >= 10) = 1 - P(X <= 9)
1 - phyper(9,  m = r, n = N-r, k = n)

## P(X odd) = P(X = 1, 3, 4, ...,39)
## Create a vector with the odd numbers between 0 and 40:
odd <- (1:20) * 2 - 1 # an odd number = even number - 1
## Now call dhyper()
sum(dhyper(odd, m = r, n = N-r, k = n)) # close to 0.5, as expected


## ii) Binomial approximation 

## Success probability is *approximately* r/N in each trial
p <- r/N

## P(X = 4)
dbinom(4, size = n, prob = p) # 0.1365792

## P(X>= 10)
1 - pbinom(9, size = n, prob = p) # 0.000135

## P(X odd)
sum(dbinom(odd, size = n, prob = p)) # 0.4976051

## iii) Poisson approximation
## X is *approximately* poisson with r/N * n

lambda <- (r/N) * n

## P(X = 4)
dpois(4, lambda = lambda) # 0.1336019

## P(X>= 10)
1 - ppois(9, lambda = lambda) # 0.0002773521

## P(X odd)
sum(dpois(odd, lambda = lambda)) # 0.496631


## iv)

## Binomial approximation works well. This makes sense,
## since we have many objects N, few successes r, and small
## sample size n (so it's rather unlikely we'd be drawing the same
## gear again if sampling was done with replacement)

## The poisson approximation does not work as well as the binomial.
## This makes sense, since the binomial is only an *approximation* to the
## true hypergeometric model. Now, the poisson is an approximation to the binomial,
## so an approximation of an approximation, which is why it doesn't
## work as good as the binomial. 

## v) P(Y >= 150) where Y = # of gears to sample so 10 are defective

## Note that Y >= 150 IFF we found fewer than 10 defectives in a sample of 149
## Let Z = nb of defective gears in a sample of 149 gears from a population of 800 gears
## Then (similarly as before) Z ~ HypGeo(800, 50, 149)
## Thus, P(Y >= 150) = P(Z < 10) = P(Z <= 9)
phyper(9, 50, 800 - 50, 149)

