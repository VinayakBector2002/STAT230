########
##      RISK: World Domination
#######


## FUll Attack
riskAttack <- function(aArmies, dArmies){
  # Params
  nsims <- 10000
  die <- 1:6
  
  return_data <- data.frame('Winner'=rep(NA,nsims),
                        'aArmies'=NA,
                        'dArmies'=NA,
                        'turns'=rep(NA,nsims))
  
  # For each iteration
  for(i in 1:nsims){
    # Setup
    livingA <- aArmies
    livingD <- dArmies
    done <- FALSE
    turns <- 0
    
    # Fight until someone wins
    while(!done){
      turns <- turns + 1
      
      aDice <- sample(die, min(livingA-1,3),replace=T)
      dDice <- sample(die, min(livingD,2),replace=T)
      
      minDiceCt <- min(length(aDice), length(dDice))
      
      aDice <- sort(aDice,decreasing = T)[1:minDiceCt]
      dDice <- sort(dDice,decreasing = T)[1:minDiceCt]
      
      # True means attacker wins
      results <- (aDice > dDice)
      
      livingA <- livingA - (minDiceCt-sum(results))
      livingD <- livingD - sum(results)
      
      if(livingA==1 || 
         livingD==0){
        done=T
      }
    }
    
    return_data[i,] <- c(ifelse(livingD>0,0,1),
                     livingA,
                     livingD,
                     turns)
    
  }
  
  return_data
}

res <- riskAttack(10,10)

nrow(res[res$Winner=='A',])/nrow(res)


## Win Percentage A
est <- nrow(res[res$Winner==1,])/nrow(res)
cat(paste0(round(est,6),
           ' (',round(est-1.96*sqrt(var(res[,"Winner"])/nrow(res)),6),
           ', ',round(est+1.96*sqrt(var(res[,"Winner"])/nrow(res)),6),')'))

## Avg Turns
est <- mean(res$turns)
cat(paste0(round(est,6),
           ' (',round(est-1.96*sqrt(var(res$turns)/nrow(res)),6),
           ', ',round(est+1.96*sqrt(var(res$turns)/nrow(res)),6),')'))



## Table

riskSituation <- function(){
  # Params
  nsims <- 10000
  die <- 1:6
  
  def <- 1:2
  att <- 1:3
  return_data <- cbind(expand.grid(att,def),NA,NA,NA,NA,NA)
  colnames(return_data) <- c('attDice','defDice','attLosses','defLosses',
                             'AL2','AL1','AL0')
  
  # For each scenario
  for(i in 1:nrow(return_data)){
    tmp_data <- data.frame('attLosses'=rep(NA,nsims),
                           'defLosses'=NA)
    
    # Run nsims simulations
    for(j in 1:nsims){
      aDice <- sample(die, return_data[i,"attDice"],replace=T)
      dDice <- sample(die, return_data[i,"defDice"],replace=T)
      
      minDiceCt <- min(length(aDice), length(dDice))
      
      aDice <- sort(aDice,decreasing = T)[1:minDiceCt]
      dDice <- sort(dDice,decreasing = T)[1:minDiceCt]
      
      # True means attacker wins
      results <- (aDice > dDice)
      
      aLosses <- minDiceCt-sum(results)
      dLosses <- sum(results)
      
      tmp_data[j,]<-c(aLosses,dLosses)
    }
    est <- mean(tmp_data$attLosses)
    return_data[i,'attLosses'] <- round(est,3)
    est <- mean(tmp_data$defLosses)
    return_data[i,'defLosses'] <- round(est,3)
    return_data[i,'AL2'] <- ifelse(max(tmp_data$attLosses)==1,'NA', 
                                   sum(tmp_data$attLosses==2)/nsims)
    return_data[i,'AL1'] <- sum(tmp_data$attLosses==1)/nsims
    return_data[i,'AL0'] <- sum(tmp_data$attLosses==0)/nsims
  }
  
  return_data
}

riskSituation()
