---
title: "CodeBook.md"
author: "thielemansa"
date: "Wednesday, May 20, 2015"
output: html_document
---

##Codebook for 'tidy' dataset developed for the Getting and Cleaning data course project

###Introduction: 
The original data downloaded from the course project website is a collection of datasets derived from the built-in accelerometer and gyroscope from the Samsung Galaxy S smarthphone.

Data were collected from 30 volunteers each performing six different activities.
Sensor signals read from the accelerometer and gyroscope were pre-processed in fixed-width windows(128 readings per window). 
A number of different features(measurements) were derived/calculated on these 'windows'resulting in a 561 feature vector per window measured for each activity performed by each volunteer.

For a more complete description of the data (and source), please refer to the following original txt files that were delivered together with the datasets:

* README.txt
* features_info.txt
* features.txt

###Tidy dataset from course project assignment
The goal of the assignment was to transform the different original datasets that were provided into one 'tidy' dataset while selecting only the features relating to the 'window-mean' and 'window-standard deviation' and calculating an overall mean (over all window-records) for each selected feature per subject performing an activity.

Name of the dataset: datawidemean.txt

Dimensions: 180 rows (30 subjects x 6activities) x 68 columns

Columns:

* column 1 = SubjectID: subjectnumber from 1 to 30
* column 2 = Activity: 6 activities (LAYING,SITTING,STANDING,WALKING,WALKING_DOWNSTAIRS,WALKING _UPSTAIRS)
* column 3:35 = 'tBodyAcc.mean.X' to 'fBodyBodyGyroJerkMag.mean': Mean value per subject & activity of the 33 features relating to the window-mean
* column 36:68 ='tBodyAcc.std.X' to 'fBodyBodyGyroJerkMag.std': Mean value per subject & activity of the 33 features relating to the window-std

Note1: The columnheadings of the features were read in from the original features.txt files (while getting rid of some unnecessary characters); I don't have any affinity with the data and could not think of any abbreviations/descriptions that would be more meaningful than the original ones.

Note2: When reading the dataset into R, specify 'header=TRUE' in the read.table statement.


