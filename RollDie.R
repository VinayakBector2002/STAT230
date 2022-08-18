## Set Params
x <- 6
n <- 1000

## Sample a x sided die n times
rolls <- sample(1:x,n, replace = T)

## Count percentage of 6s
sum(rolls==6) / n
1/6 # True solution