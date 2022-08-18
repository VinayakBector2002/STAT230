## Set Params
weaponDamage <- function(D, p){
  x<- rbinom(1,1,p)
  D*(1+x)
}

n <- 1000
sword_damage <- rep(NA, n) # make an empty vector
gloves_damage <- rep(NA, n) # make an empty vector


## Attack n time 
for(i in 1:n){
  # Get damage from weapon on hit i
  sword_damage[i] <- weaponDamage(80,0)
  gloves_damage[i]<- weaponDamage(70,0.1)
}

## Compare average empirical damages to calculated results
mean(sword_damage)
80
mean(gloves_damage)
77