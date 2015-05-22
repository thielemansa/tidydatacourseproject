setwd("C:/Users/Anne/Desktop/CourseraR/UCI HAR Dataset")
library(dplyr)
library(reshape2)

features <- read.table("features.txt", col.names=c("FeatureID", "FeatureLabel")) ## read measurementlabels
colnames <- features$FeatureLabel  ## vector with measurement labels to be used as column headings for measurement dataset
tmpmean <- grep("-mean()", colnames, fixed=TRUE) ## subset of 'mean' measurement labels
tmpstd <- grep("-std()", colnames, fixed=TRUE) ## subset of 'std' measurement labels
colnames1 <- gsub("\\()","",features$FeatureLabel) ## get rid of () in measurement labels to make column headings more readable

actlabel <- read.table("activity_labels.txt", col.names=c("ActivityID", "Activity")) ## read activity labels

subjecttest <- read.table("subject_test.txt", col.names=c("SubjectID")) ## read test subject records
activitytest <- read.table("y_test.txt", col.names=c("ActivityID")) ## read test activity records
feattest <- read.table("x_test.txt", col.names=colnames1) ## read test measurement records
 
feattestmean <- feattest[, c(tmpmean)] ## subset of 'mean' measurement records
featteststd <- feattest[, c(tmpstd)] ## subset of 'std' measurement records
datatest <- cbind(subjecttest, activitytest, feattestmean, featteststd) ## create test dataset by merging subject, activity, meanmeasurement, stdmeasurement data
 
subjecttrain <- read.table("subject_train.txt", col.names=c("SubjectID"))  ## read train subject records
activitytrain <- read.table("y_train.txt", col.names=c("ActivityID")) ## read train activity records
feattrain <- read.table("x_train.txt", col.names=colnames1) ## read train measurement records

feattrainmean <- feattrain[, c(tmpmean)] ## subset of 'mean' measurement records
feattrainstd <- feattrain[, c(tmpstd)] ## subset of 'std' measurement records
datatrain <- cbind(subjecttrain, activitytrain, feattrainmean, feattrainstd) ## create test dataset by merging subject, activity, meanmeasurement, stdmeasurement data

datatot <- rbind(datatest, datatrain) ## merge test and train dataset

datatot1 <- merge(actlabel, datatot, by="ActivityID") ## add activityname to dataset
datatot1 <- select(datatot1, SubjectID, Activity, 4:69) ## reorder columns, keep activityname and drop ActivityID
datatotal <- arrange(datatot1, SubjectID, Activity) ## reorder rows by subjectid and activity

datamelt <- melt(datatotal, id=1:2)
datawidemean <- dcast(datamelt, SubjectID + Activity ~ variable, mean) ## dataset(wide) with mean of each measurement(variable) for each subject and activity combination b

## datalongmean <- summarize(group_by(datamelt, SubjectID, ActivityID, variable), mean(value))
## the above should provide similar result but in long format

write.table(datawidemean, file="datawidemean.txt", row.names=FALSE)


