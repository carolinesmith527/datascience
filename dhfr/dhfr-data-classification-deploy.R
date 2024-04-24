
# Importing libraries
library(datasets) # Contains the Iris data set
library(caret) # Package for machine learning algorithms / CARET stands for Classification And REgression Training

# Importing the Iris data set
data(dhfr)

# Check to see if there are missing data?
sum(is.na(dhfr))

# To achieve reproducible model; set the random seed number
set.seed(100)

# Performs stratified random split of the data set
TrainingIndex <- createDataPartition(dhfr$Y, p=0.8, list = FALSE)
TrainingSet <- dhfr[TrainingIndex,] # Training Set
TestingSet <- dhfr[-TrainingIndex,] # Test Set

plot(TrainingSet)
plot(TestingSet)


###############################
# SVM model (polynomial kernel)

# Build Training model
Model <- train(Y ~ ., data = TrainingSet,
               method = "svmPoly",
               na.action = na.omit,
               preProcess=c("scale","center"),
               trControl= trainControl(method="none"),
               tuneGrid = data.frame(degree=1,scale=1,C=1)
)

# save model to rds
saveRDS(Model,"Model.rds")

# read model from rds file
read.Model <- readRDS("Model.rds")

# Apply model for prediction
Model.training <-predict(read.Model, TrainingSet) # Apply model to make prediction on Training set
Model.testing <-predict(read.Model, TestingSet) # Apply model to make prediction on Testing set



# Model performance (Displays confusion matrix and statistics)
Model.training.confusion <-confusionMatrix(Model.training, TrainingSet$Y)
Model.testing.confusion <-confusionMatrix(Model.testing, TestingSet$Y)

# print confusion matrix
print(Model.training.confusion)
print(Model.testing.confusion)


# plot variable importance
Importance <- varImp(read.Model)
plot(Importance,top=25)
plot(Importance,top=25, col="red")




