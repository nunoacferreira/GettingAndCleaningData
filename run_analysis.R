library(plyr)

# 1 »» Merges the training and the test sets to create one data set.
xTrain <- read.table("data/UCI HAR Dataset/train/xTrain.txt")
yTrain <- read.table("data/UCI HAR Dataset/train/yTrain.txt")
subjectTrain <- read.table("data/UCI HAR Dataset/train/subjectTrain.txt")

xTest <- read.table("data/UCI HAR Dataset/test/xTest.txt")
yTest <- read.table("data/UCI HAR Dataset/test/yTest.txt")
subjectTest <- read.table("data/UCI HAR Dataset/test/subjectTest.txt")

# x, y and subject data set
xData <- rbind(xTrain, xTest)
yData <- rbind(yTrain, yTest)
subjectData <- rbind(subjectTrain, subjectTest)


# 2 » Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("data/UCI HAR Dataset/features.txt")
meanANDstd <- grep("-(mean|std)\\(\\)", features[, 2])
xData <- xData[, meanANDstd]
names(xData) <- features[meanANDstd, 2]


# 3 » Use descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt")
yData[, 1] <- activities[yData[, 1], 2]
names(yData) <- "activity"


# 4 »» Appropriately label the data set with descriptive variable names
names(subjectData) <- "subject"
allData <- cbind(xData, yData, subjectData)


# 5 »» Create a second, independent tidy data set with the average of each variable for each activity and each subject
averagesData <- ddply(allData, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averagesData, "averagesData.txt", row.name=FALSE)
