library(forecast)

www <- "https://raw.githubusercontent.com/dallascard/Introductory_Time_Series_with_R_datasets/master/wave.dat"

wave <- read.table(www, header = T)

waveht.ts <- as.ts(wave$waveht)

layout(1:3)

plot(waveht.ts, ylab="Wave Height")

acf(waveht.ts)
pacf(waveht.ts)
wave.arma <- arima(waveht.ts, order = c(4,0,4))
wave.arma
wave.arma <- auto.arima(waveht.ts, d = F, ic="aic", approx = F, seasonal = F)
wave.arma
