rho <- function(k, alpha) alpha^k
layout(1:2)

plot(0:10, rho(0:10, 0.7), type - "b")
plot(0:10, rho(0:10, 0.4), type - "b")
plot(0:10, rho(0:10, 0.1), type - "b")
plot(0:10, rho(0:10, 0.01), type - "b")

set.seed(1)

x <- w <- rnorm(100)

for (t in 2:100) x[t] <- 0.7 * x[t-1] + w[t]
plot(x, type = "l")

acf(x)
pacf(x)
