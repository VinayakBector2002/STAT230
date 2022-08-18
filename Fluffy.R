
## Set up Params and simulate
full <- c('f','l','u','f','f','y')
sub <- c('f','l','u','ff','y')

S <- (factorial(6)/factorial(3))

n <- 1000000

res_full <- c()
res_sub <- c()

for(i in 1:n){
  res_full[i] <- paste(sample(full), collapse = '')
  res_sub[i] <- paste(sample(sub), collapse = '')
}


## Probability of Fluffy
test <- (res_full=='fluffy')
est <- sum(test)/n
cat(paste0(round(est,6),
           ' (',round(est-1.96*sqrt(var(test)/n),6),
           ', ',round(est+1.96*sqrt(var(test)/n),6),')'))
1/(factorial(6)/factorial(3))

## Probability of Fluffy given FF at first
test <- (res_sub=='fluffy')
est <- sum(test)/n
cat(paste0(round(est,6),
           ' (',round(est-1.96*sqrt(var(test)/n),6),
           ', ',round(est+1.96*sqrt(var(test)/n),6),')'))
1/factorial(5)

## Probability of Fluffy given FF occurs
onlyff <- res_full[grepl('ff',res_full)] # this {has FF}
correct <- (onlyff=='fluffy') # this {fluffy and FF}
est <- sum(correct)/length(onlyff)
cat(paste0(round(est,6),
           ' (',round(est-1.96*sqrt(var(correct)/length(onlyff)),6),
           ', ',round(est+1.96*sqrt(var(correct)/length(onlyff)),6),')'))
ProbNotFF <- 4*factorial(3)
(1/S)/((S-ProbNotFF)/S)

## Probability of FF together
test <- grepl('ff',res_full)
est <- sum(test)/n
cat(paste0(round(est,6),
           ' (',round(est-1.96*sqrt(var(test)/n),6),
           ', ',round(est+1.96*sqrt(var(test)/n),6),')'))
ProbNotFF <- 4*factorial(3)
(S-ProbNotFF)/(S)


