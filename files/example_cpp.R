library(Rcpp)
library(RcppArmadillo)
library(bench)

sourceCpp("files/example_cpp.cpp")

## Functions ----

mean_R <- function(x){
  n <- length(x)
  sum_x <- sum(x)
  mean_x <- sum_x / n
  return(mean_x)
}

## Data Generation ----

y <- rnorm(1000)

## Benchmarking ----

mark(
  mean(y),
  mean_R(y),
  mean_cpp(y)
     )
