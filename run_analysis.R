#This R Script does the following. 
#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement. 
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names. 
#From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
############################################################################################
#
setwd("~/UCI HAR Dataset/")
##############################################################################
# Step 1 : Read required Files
##############################################################################
#Read Train Files
#
trainSet= read.table("./train/x_train.txt",header=FALSE)
trainLabel= read.table("./train/y_train.txt",header=FALSE)
trainSubject = read.table("./train/subject_train.txt",header=FALSE)
#
#Read Test Files
#
testSet= read.table("./test/x_test.txt",header=FALSE)
testLabel= read.table("./test/y_test.txt",header=FALSE)
testSubject = read.table("./test/subject_test.txt",header=FALSE)
#
#Read features and types
#
features     = read.table("features.txt",header=FALSE)
activityType = read.table("activity_labels.txt",header=FALSE)
####
##############################################################################
# Step 2 : Assigning appropriate Column Names
##############################################################################
#
colnames(activityType)  = c("activityId","activityType")
#
featuresList <- features[,2]
colnames(trainSubject)  = "subjectId"
colnames(trainSet)      = featuresList 
colnames(trainLabel)    = "activityId"
#
colnames(testSubject)  = "subjectId"
colnames(testSet)      = featuresList 
colnames(testLabel)    = "activityId"
####
##############################################################################
# Step 3 : Extracts only the measurements on the mean and standard deviation for each measurement.
##############################################################################
# 
meanstd <- grepl("mean()|std()", featuresList) & !grepl("Freq", featuresList)
trainSetSel <- trainSet[,meanstd]
testSetSel <- testSet[,meanstd]
meanstdList <- subset(featuresList,meanstd)
##
##############################################################################
# Step 4 : Merges the training and the test sets to create one data set
##############################################################################
#
trainData <- cbind(trainLabel,trainSubject,trainSetSel)
testData <- cbind(testLabel,testSubject,testSetSel)
mergeData <- rbind(trainData,testData)
#
##############################################################################
# Step 5 : Create Tidy Data
##############################################################################
#
library(reshape2)
idList <- c("activityId","subjectId")
varList <- setdiff(colnames(mergeData), idList)
meltData <- melt(mergeData, id = idList , measure.vars = varList)
tidyDatatmp <- dcast(meltData, activityId+subjectId ~ variable, mean)
tidyData <- merge(tidyDatatmp,activityType,by='activityId',all.x=TRUE)
write.table(tidyData, "./tidyData.txt",row.names=FALSE)
