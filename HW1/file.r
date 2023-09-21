# Q1
x <- (((12000 * 45) - 10) / 5000) * 2^3

# Q2
name <- c("Nathan", "Riley")

# Q3

unrate <- read.csv("TOTALNSA.csv")
sales <- read.csv("UNRATENSA.csv")

data <- merge(unrate, sales, by = "DATE")

colnames(data) <- c("DATE", "UNRATE", "SALES")
head(data)

# Q4-7
q4 <- mean(data$UNRATE)
q4

q5 <- sd(data$UNRATE)
q5

q6 <- mean(data$SALES)
q6

q7 <- sd(data$SALES)
q7

# Step 8
plot(data$SALES,
  data$UNRATE,
  main = "Unemployment Rate vs. Total Vehicle Sales",
  xlab = "Total Vehicle Sales (Thousands)",
  ylab = "Unemployment Rate (%)",
)

q9 <- lm(data$UNRATE ~ data$SALES)
summary(q9)

abline(q9)
