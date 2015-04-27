library(plyr)

# Step 1
# Merge the training and test sets to create one data set
###############################################################################

trainX <- read.table("train/trainX.txt")
trainY <- read.table("train/trainY.txt")
subject_train <- read.table("train/subject_train.txt")

testX <- read.table("test/testX.txt")
testY <- read.table("test/testY.txt")
subject_test <- read.table("test/subject_test.txt")

# create 'x' data set
dataX <- rbind(trainX, testX)

# create 'y' data set
dataY <- rbind(trainY, testY)

# create 'subject' data set
subject_data <- rbind(subject_train, subject_test)

# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement
###############################################################################

features <- read.table("features.txt")

# get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
dataX <- dataX[, mean_and_std_features]

# correct the column names
names(dataX) <- features[mean_and_std_features, 2]

# Step 3
# Use descriptive activity names to name the activities in the data set
###############################################################################

activities <- read.table("activity_labels.txt")

# update values with correct activity names
dataY[, 1] <- activities[dataY[, 1], 2]

# correct column name
names(dataY) <- "activity"

# Step 4
# Appropriately label the data set with descriptive variable names
###############################################################################

# correct column name
names(subject_data) <- "subject"

# bind all the data in a single data set
all_data <- cbind(dataX, dataY, subject_data)

# Step 5
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
###############################################################################

# 66 <- 68 columns but last two (activity & subject)
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
