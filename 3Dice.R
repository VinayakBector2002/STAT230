###
#   Roll 3 die and see how the estimates fare with confidence intervals

nsims <- 1000000
dice_vals <- 1:6

results <- rep(NA, nsims)

for(i in 1:nsims){
  cat(i,'/',nsims,'\n')
  results[i] <- max(sample(dice_vals,3, replace = T))
}

## P(X=x)
est <- sum(results==1)/nsims
cat(paste0(round(est,6),
           ' (',round(est-1.96*sqrt(var(results==1)/nsims),6),
           ', ',round(est+1.96*sqrt(var(results==1)/nsims),6),')'))
est <- sum(results==2)/nsims
cat(paste0(round(est,6),
           ' (',round(est-1.96*sqrt(var(results==2)/nsims),6),
           ', ',round(est+1.96*sqrt(var(results==2)/nsims),6),')'))
#sum(results==3)/nsims
#sum(results==4)/nsims
#sum(results==5)/nsims
#sum(results==6)/nsims

## Expected Value
est <- sum(results)/nsims
cat(paste0(round(est,6),
           ' (',round(est-1.96*sqrt(var(results)/nsims),6),
           ', ',round(est+1.96*sqrt(var(results)/nsims),6),')'))

