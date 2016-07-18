##Coursera Data Science: Getting and Cleaning Data Course Project##
#Submission by Duncan Hendrick

# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.
# 
# One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
#         
#         http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# 
# Here are the data for the project:
#         
#         https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# 
# You should create one R script called run_analysis.R that does the following.
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#
# Good luck!


#Download and Unzip files
if(!file.exists("./data")){
        dir.create("./data")
 }
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/wearables.zip", method = "curl")
unzip(zipfile = "./data/wearables.zip", exdir = "./data")

#Read tables
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
features <- read.table("./data/UCI HAR Dataset/features.txt")
activityLabels = read.table("./data/UCI HAR Dataset/activity_labels.txt")

# Label column names
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"
colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"
colnames(activityLabels) <- c('activityId','activityType')

#Merge all datasets
merge_train <- cbind(y_train, subject_train, x_train)
merge_test <- cbind(y_test, subject_test, x_test)
mergeAll <- rbind(merge_train, merge_test)

#Extract mean and standard deviation only
colNames <- colnames(mergeAll)
mean_and_std <- (grepl("activityId", colNames) | 
                         grepl("subjectId", colNames) |
                         grepl("mean..", colNames) |
                         grepl("std..", colNames)
)
onlyMeanAndStd <- mergeAll[, mean_and_std == TRUE]

#Add more descriptive variable labels

colNames <- colnames(onlyMeanAndStd)
for (i in 1:length(colNames)){
        colNames[i] <- gsub("\\()", "", colNames[i])
        colNames[i] <- gsub("-std$", "StdDev", colNames[i])
        colNames[i] <- gsub("-mean", "Mean", colNames[i])
        colNames[i] <- gsub("^f", "freq", colNames[i])
        colNames[i] <- gsub("^t", "time", colNames[i])
        colNames[i] <- gsub("([Bb]ody[Bb]ody|[Bb]ody)", "Body", colNames[i])
        colNames[i] <- gsub("([Bb]odyaccjerkmag)","BodyAccJerkMag",colNames[i])
}
colnames(onlyMeanAndStd) <- colNames

#Add activity names to dataset

dataWithActivityNames <- merge(onlyMeanAndStd, activityLabels, by = "activityId", all.x = TRUE)


#Create second dataset with average of each variable

meanDataset <- aggregate(. ~subjectId + activityId, dataWithActivityNames, mean)
meanDataset <- meanDataset[order(meanDataset$subjectId, meanDataset$activityId),]
write.table(meanDataset, "meanDataset.txt", row.name=FALSE)