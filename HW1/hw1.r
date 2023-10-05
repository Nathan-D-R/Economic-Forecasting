# Step 1
# Create a scalar named "x" that calculates
# (((12000 * 45) - 10) / 5000) * 2^3. What is the answer?

x <- (((12000 * 45) - 10) / 5000) * 2^3
paste("The answer is", round(x, dig = 2))

# Step 2
# Create a character/string vector that include you name, where your first name is the first element of the vector and your last name is the second element.

name <- c("FirstName", "LastName")
paste("My name is", name[1], name[2])

# Step 3
# Load the data into R.

unrate <- read.csv("Unemployment Rate.csv")
sales <- read.csv("Total Vehicle Sales.csv")

# Merge data
data <- merge(unrate, sales, by = "DATE")
head(data)

# Rename columns to date, sales, and unrate
colnames(data) <- c("DATE", "UNRATE", "SALES")
head(data)

# Step 4
# What is the mean unemployment rate over this period?

q4 <- mean(data$UNRATE)
q4 <- formatC(q4, digits = 2, format = "f")
paste("Mean of unemployment rate is ", q4, "%", sep = "")

# Step 5
# What is the standard deviation of the unemployment rate over this period?

q5 <- sd(data$UNRATE)
q5 <- formatC(q5, digits = 2, format = "f")
paste("Standard Deviation of unemployment rate is ", q5, "%", sep = "")

# Step 6
# What is the mean monthly total vehicle sales over this period? Specify units.

q6 <- mean(data$SALES) # Thousands of units
q6 <- formatC(q6, digits = 2, format = "f", big.mark = ",")
paste("Average monthly vehicle sales is", q6, "Thousand Units")

# Step 7
# What is the standard deviation of monthly total vehicle sales over this period?

q7 <- sd(data$SALES)
q7 <- formatC(q7, digits = 2, format = "f", big.mark = ",")
paste("Standard deviation of monthly vehicle sales is", q7, "Thousand Units")

# Step 8
# Create a scatterplot with total vehicle sales on the X-axis and the unemployment rate on the Y-axis.
# Label the axes and give the graph a title.
plot(data$SALES,
     data$UNRATE,
     main = "Unemployment Rate vs. Total Vehicle Sales",
     xlab = "Total Vehicle Sales (Thousands)",
     ylab = "Unemployment Rate (%)",
     sub = "UNRATENSA and TOTALNSA from FRED, 2000/1/01-2023/7/1",
     col = "slateblue1",
     pch = 16,
)

# Step 9
# Estimate a simple linear regression model where the unemployment reate is the dependent variable and the total vehicle sales is the explanatory variable.
# Display the output (ie., coefficients, t-values, p-values, R², etc.)
# What is your interpretation of the output.

q9 <- lm(data$UNRATE ~ data$SALES)
summary(q9)

# Step 10
# Add the regression line to the scatterplot.

abline(q9,
  col = "darkslateblue",
  lwd = 3,
  lty = 2
)

# Step 11
# What is the correlation of the unemployment rate and total vehicle sales?
# Is this strong or weak? Positive or Negative?

q11 <- round(cor(data$UNRATE, data$SALES), dig = 2)
q11

# Step 13
# Find another data series that you think might explain the unemployment rate.
# Import it into R, and estimate a multiple regression model with the unemployment rate as the dependent variable, total vehicle sales as one of the explanatory variables, and your new variable as another explanatory variable.
# Show and interpret the output.

pce <- read.csv("Personal Consumption Expenditures.csv")
data <- merge(data, pce, by = "DATE")

colnames(data[4]) <- "PCE"

head(data) # DATE UNRATE SALES PCE

q13a <- lm(data$UNRATE ~ data$SALES + data$PCE)
q13b <- lm(data$UNRATE ~ data$PCE)

summary(q13a)
summary(q13b)

## Step 14
# Now, use the ts() function to create new variables for the unemployment rate and total vehicle sales, where each is stored as a time-series object.
tvm_ts <- ts(data$SALES, start = c(2000, 1), end = c(2023, 7), frequency = 12)

ue_ts <- ts(data$UNRATE, start = c(2000, 1), end = c(2023, 7), frequency = 12)

# Step 14:
# Plot each series individually (as a line graph, with labeled axes and a title).
# What do you notice?

plot(tvm_ts,
    main = "Total Vehicle Sales",
    xlab = "Date",
    ylab = "Total Vehicle Sales (Thousands)",
    col = "slateblue1",
    pch = 16,
    type = "l"
)

plot(ue_ts, # X
    main = "Unemployment Rate",
    xlab = "Date",
    ylab = "Unemployment Rate (%)",
    col = "slateblue1",
    pch = 16, # Marker Shape
    type = "l"
)

# Step 15:
# For each, plot the annual series (using the aggregate() function)
# What do you notice?

# Plot Total Vehicle Sales
plot(aggregate(tvm_ts, FUN = sum),
  main = "Total Vehicle Sales (Annual)",
  xlab = "Year",
  ylab = "Total Vehicle Sales (Thousands)",
  col = "slateblue1",
  pch = 16,
  type = "l"
)

plot(aggregate(ue_ts, FUN = sum),
  main = "Unemployment Rate (Annual)",
  xlab = "Year",
  ylab = "Unemployment Rate (%)",
  col = "slateblue1",
  pch = 16,
  type = "l"
)

# Step 16
# For each, create a boxplot showing the seasonal component.
# What do you notice?

boxplot(tvm_ts ~ cycle(tvm_ts),
  main = "Total Vehicle Sales (Seasonal)",
  xlab = "Month",
  ylab = "Total Vehicle Sales (Thousands)",
  col = "slateblue1"
)

boxplot(ue_ts ~ cycle(ue_ts),
  main = "Unemployment Rate (Seasonal)",
  xlab = "Month",
  ylab = "Unemployment Rate (%)",
  col = "slateblue1"
)

ue_decomp <- decompose(ue_ts)
tvs_decomp <- decompose(tvm_ts)

plot(ue_decomp,
  col = "slateblue1",
  lw = 2
)
plot(tvs_decomp,
  col = "slateblue1",
  lw = 2
)
