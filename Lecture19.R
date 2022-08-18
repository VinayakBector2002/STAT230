##
#     Katy sells homes on average 3 a day, according to a Poisson distribution.
#     (1) How do the sample mean and variance compare to the theoretical?
#     (2) What is the probability the number sold tomorrow will be 2?
#     (3) What is the probability Katy sell over 4 tomorrow?
#     (4) Give the number which Katy is 95% less likely to sell than?
##

Xs <- rpois(1000, 3)

# (1)
sum(Xs)/length(Xs)
mean(Xs)

sum((Xs-mean(Xs))^2)/(length(Xs)-1)
var(Xs)

# (2)
dpois(2,3)

# (3)
1-ppois(4,3)
sum(dpois(5:100,3)) # Should go to infinity, but this is good enough
                    #     In fact, based on (4), try qpois(0.99999,3)
#                   #     This shows we could use much less than 100

# (4)
qpois(0.95,3)
