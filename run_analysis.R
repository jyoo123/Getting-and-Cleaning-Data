library(reshape2)

setwd("/Users/yooj1/Desktop/WORK/")

# (A) Load activity labels (6 activities) and features (measured as XYZ)
activityLabels <-     read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
features <-           read.table("UCI HAR Dataset/features.txt")
features[,2] <-       as.character(features[,2])

# (B) Extract only the mean and standard deviation from the features.
meanSD <-       grep(".*mean.*|.*std.*", features[,2])
meanSD.names <- features[meanSD,2]
meanSD.names =  gsub('-mean','*MEAN*',meanSD.names)
meanSD.names =  gsub('-std', '*STD*',meanSD.names)
meanSD.names <- gsub('[-()]','',meanSD.names)

# (C) Load the training and test datasets of "mean" or "std"
# the final dataset is (subject/person/volunteers, 6 activities, features...)
trainingSet <-      read.table("UCI HAR Dataset/train/X_train.txt")[meanSD]
trainingLables <-   read.table("UCI HAR Dataset/train/Y_train.txt")
trainingSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainingSet <-      cbind(trainingSubjects, trainingLables, trainingSet)

testSet <-          read.table("UCI HAR Dataset/test/X_test.txt")[meanSD]
testLabels <-       read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <-     read.table("UCI HAR Dataset/test/subject_test.txt")
testSet <-          cbind(testSubjects,testLabels,testSet)

# (D) merge train and test sets and add labels
trainTestSet <-           rbind(trainingSet, testSet)
colnames(trainTestSet) <- c("subject","activity",meanSD.names)

# (E) turn activities & subjects into factors
trainTestSet$activity <- factor(trainTestSet$activity,levels=activityLabels[,1],labels=activityLabels[,2])
trainTestSet$subject <-  as.factor(trainTestSet$subject)

# melt will set ("subject","activity", "variable", "value") - well sorted left to right
trainTestSet.melted <-   melt(trainTestSet,id = c("subject","activity"))
# for ea or 6 (subject,activity) pair, get the mean of value from the melt for each variable
trainTestSet.mean <-     dcast(trainTestSet.melted, subject + activity ~ variable, mean)

# (F) write the tidy data (30 subjects x 6 activities = 180 rows with varialble means)
write.table(trainTestSet.mean, "tidy.txt", row.names = FALSE, quote = FALSE)