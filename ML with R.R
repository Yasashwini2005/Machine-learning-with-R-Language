# Load necessary libraries
library(datasets)
library(caret)
library(glmnet) #for logistic regression
library(randomForest)#for random forest algorithm
library(gbm)#for gradient boosting machine
library(e1071)# for svm

# Load the iris dataset
data("iris")

# Set random seed for reproducibility
set.seed(123)

# Create indices for data partitioning
index <- createDataPartition(iris$Species, p = 0.7, list = FALSE)#70%training data

# Subset training data using the indices
training_data <- iris[index, ]

# Subset testing data using the complement of the indices
testing_data <- iris[-index, ]#taking the complement of training data as testing data

# Train a GLMnet model
model <- train(Species ~ ., data = training_data, method = "glmnet")
predictions <- predict(model, newdata = testing_data)

# Compute and print confusion matrix and accuracy for GLMnet
cm <- confusionMatrix(predictions, testing_data$Species)
print(cm)
accuracy <- cm$overall['Accuracy']
print(paste("GLMnet Accuracy:", round(accuracy, 4)))

# Plot confusion matrix for GLMnet
par(mar = c(2, 2, 2, 2))
plot(cm$table, col = cm$byClass, 
     main = paste("Confusion Matrix\nAccuracy =", round(accuracy, 4)))

# Train a Random Forest model
model_rf <- randomForest(Species ~ ., data = training_data)
predictions_rf <- predict(model_rf, newdata = testing_data)

# Compute and print confusion matrix and accuracy for Random Forest
cm_rf <- table(predictions_rf, testing_data$Species)
print("Random Forest Confusion Matrix:")
print(cm_rf)
accuracy_rf <- mean(predictions_rf == testing_data$Species)
print(paste("Random Forest Accuracy:", round(accuracy_rf, 4)))

# Train a GBM model
model_gbm <- gbm(Species ~ ., data = training_data, distribution = "multinomial")
predictions_gbm <- predict(model_gbm, newdata = testing_data, type = "response")
predictions_gbm <- colnames(predictions_gbm)[apply(predictions_gbm, 1, which.max)]

# Compute and print confusion matrix and accuracy for GBM
cm_gbm <- table(predictions_gbm, testing_data$Species)
print("GBM Confusion Matrix:")
print(cm_gbm)
accuracy_gbm <- mean(predictions_gbm == testing_data$Species)
print(paste("GBM Accuracy:", round(accuracy_gbm, 4)))

# Train an SVM model
model_svm <- svm(Species ~ ., data = training_data, kernel = "radial")
predictions_svm <- predict(model_svm, newdata = testing_data)

# Compute and print confusion matrix and accuracy for SVM
cm_svm <- table(predictions_svm, testing_data$Species)
print("SVM Confusion Matrix:")
print(cm_svm)
accuracy_svm <- mean(predictions_svm == testing_data$Species)
print(paste("SVM Accuracy:", round(accuracy_svm, 4)))

