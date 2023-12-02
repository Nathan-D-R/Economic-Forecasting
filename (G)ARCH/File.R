library(MASS)

data(SP500)

plot(SP500, type="l")

acf(SP500)
acf((SP500 - mean(SP500))^2)

stemp <- scan("stemp.dat")

stemp.ts <- ts(stemp, start = c(1850, freq = 12))

plot(stemp.ts)

stemp.arima <- arima(stemp.ts,
  order = c(1, 1, 2),
  seas = list(order = c(1, 0, 1), 12)
)

summary(stemp.arima)

stemp.res <- resid(stemp.arima)

acf(stemp.res)
acf(stemp.res^2)

library(tseries)

stemp.garch <- garch(stemp.res, trace=F)

summary(stemp.garch)

stemp.garch.res <- resid(stemp.garch)[-1]

acf(stemp.garch.res)
acf(stemp.garch.res^2)


code <- readLines("File.R")
