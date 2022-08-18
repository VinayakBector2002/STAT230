## Organize Book Problem
## Set Params
books <- c(rep('O',13),rep('T',7))
sims = 100000
books_tw <- rep(NA,sims)

shelf <- 12

## Simulate
for(i in 1:sims){ 
  # Sample the books
  tmp <- sample(books,shelf)
  
  # Record the number that are Twain
  books_tw[i] <- length(tmp[tmp=='T'])
  
}

# Compare
sum(books_tw==3)/sims # Empirical number of Twain books
choose(13,9)*choose(7,3) / choose(20,12) # Theoretical solution


