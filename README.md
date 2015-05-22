---
title: "README"
author: "thielemansa"
date: "Friday, May 22, 2015"
output: html_document
---
##Content of repo

Files for evaluation of the 'Getting and Cleaning data' course project assignment:

* run_analysis.R : script that produces one tidy dataset (from a set of original provided datasets) following the instructions from the course project assignment. The steps included in the script are clarified below (the script is also documented with clarification statements) 
* datawidemean.txt : tidy dataset - output produced by run_analysis.R
* CodeBook.md : brief information about original data and summary information about tidy dataset
* README.md : general info

####run_analysis.R script - clarification of steps

Set working directory, initialize dplyr and reshape2 libraries

1. Read in dataset with feature labels

2. Prepare for subsetting by creating two temp vectors selecting 'mean' and 'std' features respectively

3. Clean up feature labels (to function as column headings for the feature datasets)

4. Read in dataset with activity labels

5. Read in subject, activity and feature test datasets while assigning appropriate column labels

6. Take subset of 'mean' features from feature testdata

7. Take subset of 'std' features from feature testdata

8. Merge (columns of) subject, activity, mean feature, std feature test datasets into one test dataset

9. Repeat steps 5 to 8 for train datasets to obtain one train dataset

10. Merge (rows of) test and train dataset into one total dataset

11. Read in activity labels by merging total dataset with activity label dataset

12. Reorder columns (and drop activityID) and reorder rows by subjectid and activity

13. Reshape data (wide to long) by subject, activity, feature (to prepare for 'mean' calculation)

14. Obtain mean for each feature by subject and activity (using dcast(reshape2 library) transforms dataset back to wide; using summarize/group_by(dplyr library) keeps data in long format; wide has been chosen)

15. Save resulting dataset (wide format) as txt file using write.table() with row.name=FALSE

Note: when reading dataset back to R using read.table(), specify header=TRUE.



