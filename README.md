# CourseraCleaningData
---
title: "README"
author: "Alberto J."
date: "29 de abril de 2017"
---

#README


The script named "run_analysis.R" does the following:

*Download and unzip from the "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" a compressed folder that contains the data for the project "Human Activity Recognition using Smartphones Dataset".

*The decompression of files creates a folder in your working directory, called "ICU HAR Dataset". in it the file "README" explains the project and the data supplied.

*The script reads the data files and labels, merging the training data and test, creating a new dataset to which are added the labels of subjects and activities.

*The script select the variables with the mean and standard deviation of each measure and composes a new data table only with these variables by adding the columns that report on the activity and the subject.

*The script writes in the working directory of the new data table with the name of the "HumanActivity.txt".

*Finally, the script calculates the average per activity and subject of the variables selected in the section above, recording a new data table called "averageHumanActivity.txt". This file is the same as that included in this repo.
