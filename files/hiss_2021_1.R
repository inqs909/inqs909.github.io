## Load libraries ------
library(parallel)

## Pre - Parallel Analysis -----

# Parallel Parameters

parallel::detectCores()
ncores <- parallel::detectCores() 

# Simulation Parameters

nsim <- 10000
nn <- 100

# Simulating Data

x_norm_data <- lapply(rep(nn, nsim), rnorm, mean = 5, sd = sqrt(8))
x_pois_data <- lapply(rep(nn, nsim), rpois, lambda = 2)
x_bin_data  <- lapply(rep(nn, nsim), rbinom, size = 30, prob = 0.2)

Start <- Sys.time()
x_norm_s <- unlist(lapply(x_norm_data, mean))
x_pois_s <- unlist(lapply(x_pois_data, mean))
x_bin_s  <- unlist(lapply(x_bin_data, mean))
Sys.time() - Start

#Truth: 5, 2, 6, respectively
mean(x_norm_s)
mean(x_pois_s)
mean(x_bin_s)

#Truth: .08, 0.02, 0.048, respectively
var(x_norm_s)
var(x_pois_s)
var(x_bin_s)

## Parallel Analysis ------

# Mac and Linux

Start <- Sys.time()
x_norm_mc <- unlist(mclapply(x_norm_data, mean, mc.cores = ncores))
x_pois_mc <- unlist(mclapply(x_pois_data, mean, mc.cores = ncores))
x_bin_mc  <- unlist(mclapply(x_bin_data, mean, mc.cores = ncores))
Sys.time() - Start

#Truth: 5, 2, 6, respectively
mean(x_norm_mc)
mean(x_pois_mc)
mean(x_bin_mc)

#Truth: .08, 0.02, 0.048, respectively
var(x_norm_mc)
var(x_pois_mc)
var(x_bin_mc)

# Windows, Mac, and Linux

cl <- makeCluster(ncores)
Start <- Sys.time()
x_norm_par <- unlist(parLapply(cl, x_norm_data, mean))
x_pois_par <- unlist(parLapply(cl, x_pois_data, mean))
x_bin_par  <- unlist(parLapply(cl, x_bin_data, mean))
Sys.time() - Start
stopCluster(cl)

#Truth: 5, 2, 6, respectively
mean(x_norm_par)
mean(x_pois_par)
mean(x_bin_par)

#Truth: .08, 0.02, 0.048, respectively
var(x_norm_par)
var(x_pois_par)
var(x_bin_par)


## Longer Computation

new_mean <- function(x){
  Sys.sleep(0.001)
  results <- mean(x)
  return(results)
}

Start <- Sys.time()
x_norm_s <- unlist(lapply(x_norm_data, new_mean))
x_pois_s <- unlist(lapply(x_pois_data, new_mean))
x_bin_s  <- unlist(lapply(x_bin_data, new_mean))
Sys.time() - Start

Start <- Sys.time()
x_norm_mc <- unlist(mclapply(x_norm_data, new_mean, mc.cores = ncores))
x_pois_mc <- unlist(mclapply(x_pois_data, new_mean, mc.cores = ncores))
x_bin_mc  <- unlist(mclapply(x_bin_data, new_mean, mc.cores = ncores))
Sys.time() - Start

cl <- makeCluster(ncores)
clusterExport(cl, "new_mean")
Start <- Sys.time()
x_norm_par <- unlist(parLapply(cl, x_norm_data, new_mean))
x_pois_par <- unlist(parLapply(cl, x_pois_data, new_mean))
x_bin_par  <- unlist(parLapply(cl, x_bin_data, new_mean))
Sys.time() - Start
stopCluster(cl)
