## R Tutorial
## Part 3: Discrete Distributions in R

### Exercise 2

## a) Let X = nb of pranks in a week. Then X ~ Bin(5, 1/3) and we want P(X >= 3)

p <- 2/6 # probability Jim plays at least 5 (=5 or 6) pranks on any day

## Method i) via cdf
1 - pbinom(2, size = 5, prob = p)

## Method ii) via pf
sum(dbinom(c(3, 4, 5), size = 5, prob = p))


## b) Let X = nb of calls before getting in. Then X ~ Geo(0.01)

## Method i) via cdf
pgeom(100, prob = 0.01) - pgeom(49, prob = 0.01)
## Method ii) via pf
sum(dgeom(50:100, prob = 0.01))


## c)

lam <- 2 # parameter value of 'lambda' (if we want to change later, only once here!)
x <- seq(from = 0, to = 10, by = 0.01) # evaluation points
pfpois <- dpois(x, lambda = lam) # warning (0) for x not in the support
cdfpois <- ppois(x, lambda = lam) # cdf at 'x'

## Plot:
plot(x, pfpois, type = 'l', ylab = "", ylim = c(0, 1)) 
lines(x, cdfpois, col = 2)
legend("topleft", c("Probability fun.", "Cumulative distribution fun."),
       col = 1:2, lty = rep(1, 2), bty = 'n')

