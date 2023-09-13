# Libraries
library(corrplot)

# Import oliverperez.csv as dataframe
data <- read.csv("oliverperez.csv",
                 header = TRUE, sep = ",",
                 fileEncoding = "UTF-8-BOM")

# ==> Fields for reference
# "Year"   "Age"    "Tm"     "Lg"     "W"      "L"      "W.L."   "ERA"
# "G"      "GS"     "GF"     "CG"     "SHO"    "SV"     "IP"     "H"
# "R"      "ER"     "HR"     "BB"     "IBB"    "SO"     "HBP"    "BK"
# "WP"     "BF"     "ERA."   "FIP"    "WHIP"   "H9"     "HR9"    "BB9"
# "SO9"    "SO.W"   "Awards"

# ==> Scatterplot
# Exploratory scatterplot of SO ~ WP + IP
plot(data$SO ~ data$WP + data$IP, data = data)

# ==> Regression
# Multiple linear regression on SO ~ WP + IP
model <- lm(data$SO ~ data$WP + data$IP, data = data)
summary(model)

# ==> Correlation
# Correlation matrix of numeric columns
cor <- cor(data[, sapply(data, is.numeric)])

# ==> Subsetting operators as filter (Another example directly above)
# Print correllation matrix greater than 0.75 (High Correlation)
summary(cor[cor > 0.75])

# ==> Plotting using the corrplot package
# Plot correlation matrix
corrplot(cor,
         method = "square",
         col = c("red", "green"),
         type = "lower")

# Display warnings for debugging
warnings()
