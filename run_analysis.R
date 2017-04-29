#Download and decompression of data files. 
#Is created in the working directory a directory with the
#Uncompressed data named "/UCI HAR Dataset"

if(!file.exists("datosejercicio"))  {dir.create("datosejercicio")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./datosejercicio/ejercicio.zip") 
unzip("./datosejercicio/ejercicio.zip")

#Reading of files

activlab <- read.table("UCI HAR Dataset/activity_labels.txt")
varlab <- read.table("UCI HAR Dataset/features.txt")

subtrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <-  read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

subtest <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <-  read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

#Merge the training set and the test set

subjects <- rbind(subtrain, subtest)
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)

#Data table, add the names of variables

names(subjects) <- "subjects"
names(X) <- varlab[ , 2]
names(y) <- "activity"

#Selection of mean and standard deviation for feature

fmean <- grepl("-mean\\()|-std\\()", names(X))
Xmean <- X[, fmean]

#Table with tidy data

Xymean <- cbind(y, subjects, Xmean)

#activity as factor

Xymean$activity <- factor(Xymean$activity, labels=activlab[,2])

#we save the tidy data

write.table(Xymean, file="HumanActivity.txt")
print("file HumanActivity.txt created")

#Calculation of the average per subject and activity

medias <- aggregate( . ~ activity + subjects, data = Xymean, FUN = mean )
medias <- medias[order(medias$activity, medias$subjects), ]

write.table(medias, file="averageHumanActivity.txt")
print("file averageHumanActivity.txt created")
