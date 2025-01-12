#For 3d scatterplot
install.packages("scatterplot3d")
library(scatterplot3d)

#Importing data
raw_data = read.csv("C:\\Users\\Ehsan\\Desktop\\MyFiles\\FraUAS\\IDA\\Project\\Rental_Data.csv")
head(raw_data)

#Removing unnecessary columns
data <- subset(raw_data, select = c(1, 2, 3)) 
head(data)

#Renaming columns
colnames(data) <- c("Rent", "Size", "Distance")

summary(data)
str(data)

#Checking for null values
sum(is.na(data))


#Ploting distance vs rent
plot(data$Distance, data$Rent, 
     main = "Rent vs Distance",
     xlab = "Distance from City Center (km)",
     ylab = "Monthly Rent (€)",
     pch = 19, col = "blue")

# Scatterplot: Size vs Rent
plot(data$Size, data$Rent, 
     main = "Rent vs Apartment Size",
     xlab = "Apartment Size (m²)",
     ylab = "Monthly Rent (€)",
     pch = 19, col = "green")

# 3D scatterplot for Rent, size and distance

scatterplot3d(data$Distance, data$Size, data$Rent,
              main = "Impact of Size and Distance on Rent",
              xlab = "Distance from City Center (km)",
              ylab = "Size of Apartment (sqm)",
              zlab = "Monthly Rent (€)",
              pch = 19, color = "blue")

# Multiple linear regression model
model <- lm(Rent ~ Distance + Size, data = data)

summary(model)

# New data for prediction
new_apartments <- data.frame(Distance = c(3, 15, 38), Size = c(12, 15, 20))

# Predict rent
predicted_rent <- predict(model, newdata = new_apartments)

# View predictions
predicted_rent

new_apartments$Predicted_Rent <- predicted_rent

new_apartments

