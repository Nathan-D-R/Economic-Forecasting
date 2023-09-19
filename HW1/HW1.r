# Import the data

unrate <- read.csv("Unemployment Rate.csv")
head(unrate, 1)

sales <- read.csv("Total Vehicle Sales.csv")
head(sales, 1)

# Combine unrate and sales by date

data <- merge(unrate, sales, by="DATE")
data

# Scatterplot of unrate and sales
plot(data$UNRATE, data$TOTALSA, xlab="Unemployment Rate", ylab="Total Vehicle Sales", main="Unemployment Rate vs. Total Vehicle Sales")
