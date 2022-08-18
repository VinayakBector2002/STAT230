## Lecture 26

doPDF <- TRUE # if TRUE, this R Script produces pdf files of the plots

## Sample from U(0,1) and plug into F^{-1}(u)=-log(1-u), which is 
## the inverse of the cdf of Exp(1). 
## By theorem, resulting sample should look like it comes from Exp(1)

set.seed(123) # fix "randomness"
n <- 1000 # sample size
uniforms <- runif(n) 
exponentials <- -log(1 - uniforms)

## Histogram of uniforms
if(doPDF)
   pdf(file = "fig_unifhist.pdf", width = 6, height = 6)
hist(uniforms, freq = FALSE, ylim = c(0, 1.2))
curve(dunif, from = 0, to = 1, add = TRUE, col = "blue")
legend("topright", legend = "Density of Unif(0, 1)", lty = 1, col = "blue",
       bty = "n")
if(doPDF)
   dev.off()

## Histogram of exponentials
if(doPDF)
   pdf(file = "fig_exphist.pdf", width = 6, height = 6)
hist(exponentials, freq = FALSE)
curve(dexp, from = 0, to = 8, add = TRUE, col = "blue")
legend("topright", legend = "Density of Exp(1)", lty = 1, col = "blue",
       bty = "n")
if(doPDF)
   dev.off()
