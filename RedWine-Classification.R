# !------- Red-Wine Quality Prediction--------!
setwd("/Users/srilakshmi/Desktop/Certification/Wine-Quality-Prediction/Datasets")
getwd()
install.packages("readxl")
install.packages("writexl")
library(readxl)
# Dataset Load
red <- read_excel("winequality-red.xlsx")
white <- read_excel("winequality-white.xlsx")
str(red)
str(white)
summary(red)
summary(white)
# Null value checking
colSums(is.na(red))
colSums(is.na(white))
red$wine_type <- "Red"
white$wine_type <- "White"
View(red)
View(white)
# Combining datasets after adding new column "wine_type"
combined_data <- rbind(red,white)
View(combined_data)
# Shuffling Dataset
shuffled_data <- combined_data[sample(nrow(combined_data)), ]
View(shuffled_data)
# changing the target variable to factor for classification
shuffled_data$Quality <- as.factor(shuffled_data$Quality)
# Initial Data Exploration
str(shuffled_data)
summary(shuffled_data)
# Applying prop.table for proportions
round(prop.table(table(shuffled_data$Quality))*100, digits = 1)
# Histogram
histogram <- hist(as.numeric(as.character(shuffled_data$Quality)),
     main = "Histogram of Count of Wine-Quality ",
     xlab = "Quality",
     ylab = "Count",
     col = blues9,
     breaks = 7
     )
text(histogram$mids, histogram$counts, labels = histogram$counts, pos = 3, cex = 0.7, col = "black")
normalize <- function(x){
  return ((x-min(x))/(max(x)-min(x)))
}
# Creating a new column based on Quality
shuffled_data$Quality_Label <- ifelse(
  shuffled_data$Quality %in% c(3, 4, 5), "Low",
  ifelse(shuffled_data$Quality == 6, "Medium", "High")
)
shuffled_data$Quality_Label <- as.factor(shuffled_data$Quality_Label)
# Checking the balance 
round(prop.table(table(shuffled_data$Quality_Label))*100)
# Normalize
Cols_to_Normalize <- c("Fixed Acidity", "Volatile Acidity", "Citric Acid",
                 "Residual Sugar", "Chlorides", "Free Sulfur Dioxide",
                 "Total Sulfur Dioxide", "Density", "pH", "Sulphates", "Alcohol")
shuffled_data[Cols_to_Normalize] <- lapply(shuffled_data[Cols_to_Normalize], function(x) {
  (x-min(x)) / (max(x) - min(x))
})
summary(shuffled_data$Alcohol)
# Training and Testing
set.seed(123)
data_train = sample(1:nrow(shuffled_data), 0.7*nrow(shuffled_data))
train_data <- shuffled_data[data_train, ]
test_data <- shuffled_data[-data_train, ]
training_data <- train_data[, Cols_to_Normalize]
testing_data <- test_data[,Cols_to_Normalize]
cls = train_data$Quality_Label
cls <- as.factor(cls)
cls <- as.factor(train_data$Quality_Label)
sum(is.na(cls))

# KNN
library(class)
mod <- knn(train = training_data, test = testing_data, cl=cls, k=50)
mod
tab <- table(Predicted = mod, Wine_Type = test_data$wine_type)
tab
acc <- mean(mod == test_data$Quality_Label)
acc
test_data$Predicted <- mod
library(ggplot2)
ggplot(test_data, aes(x = Predicted, fill = wine_type)) +
  geom_bar(position = "dodge") +
  labs(title = "Predicted Wine Quality by Type",
       x = "Predicted Quality",
       y = "Count",
       fill = "Wine Type") +
  theme_minimal()

# Decision Tree
install.packages("rpart")
library(rpart)
dec <- rpart(Quality_Label ~ ., data = train_data, method = "class")
library(rpart.plot)
rpart.plot(dec)

# Random
library(randomForest)
names(train_data) <- make.names(names(train_data))
names(test_data) <- make.names(names(test_data))
train_data$Quality_Label <- factor(train_data$Quality_Label, levels = c("Low", "Medium", "High"))
test_data$Quality_Label <- factor(test_data$Quality_Label, levels = c("Low", "Medium", "High"))
set.seed(123)
rand <- randomForest(Quality_Label ~ ., data = train_data, ntree = 100)
rand
pre <- predict(rand, test_data)
tab <- table(Predicted = pre, Wine_Type = test_data$wine_type)
tab
plot(rand)
acc <- mean(pre == test_data$Quality_Label)
acc

# SVM
install.packages("e1071")
library(e1071)
set.seed(123)
model <- svm(Quality_Label~ Alcohol + pH, train_data, kernal = "radial")
model
pre <- predict(model, test_data)
pre
table(pre, test_data$Quality_Label)
acc <- mean(pre == test_data$Quality_Label)
acc
plot(model, train_data, Alcohol ~ pH)

