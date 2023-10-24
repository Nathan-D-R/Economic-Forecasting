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

z <- read.table("./Time Series/pounds_nz.dat", header = TRUE)
z.ts <- ts(z, st=1991, fr=4)

z.ar <- ar(z.ts)
mean(z.ts)
z.ar$order
z.ar$ar
z.ar$ar + -2 * sqrt(z.ar$asy.var.coef); Z.ar$ar + 2 * sqrt(z.ar$asy.var.coef)

acf(z.ar$residual, na.action = na.pass)

global <- scan("./Time Series/global.dat")
global.ts <- ts(global, st = c(1856, 1), end = c(2005, 12), fr = 12)
global.ar <- ar(aggregate(global.ts, FUN = mean))
mean(aggregate(global.ts, FUN = mean))

global.ar$order
global.ar$ar

acf(global.ar$res, na.action = na.pass, lag = 50)


