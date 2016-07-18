# Getting and Cleaning Data Course Project Code book

## Introduction

The purpose of run_analysis.R is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

I created a program that (1) merges several datasets into one, (2) extracts only the measurements on mean and standard deviation for each measurement, (3) adds descriptive activity names, (4) appropriately labels the data set with descriptive variable names, and finally (5) creates a second, independent tidy data set.

## Summary

Text files are downloaded and read as tables into R. Separate tables are merged into one data set, then pared down to only include means and standard deviations of each measurement. Activity labels are then added and the variable names are made more clear and descriptive using gsub() function to search and replace column names. Finally, a second, independent tidy data set is created that includes only the average of each varialbe for each activity and subject.

## Variables 

### These are the variables included in the final tidy datasets:

*"activityId"
*"subjectId"
*"timeBodyAccMean-X"
*"timeBodyAccMean-Y"
*"timeBodyAccMean-Z"
*"timeBodyAcc-std-X"
*"timeBodyAcc-std-Y"
*"timeBodyAcc-std-Z"
*"timeGravityAccMean-X"
*"timeGravityAccMean-Y"
*"timeGravityAccMean-Z"
*"timeGravityAcc-std-X"
*"timeGravityAcc-std-Y"
*"timeGravityAcc-std-Z"
*"timeBodyAccJerkMean-X"
*"timeBodyAccJerkMean-Y"
*"timeBodyAccJerkMean-Z"
*"timeBodyAccJerk-std-X"
*"timeBodyAccJerk-std-Y"
*"timeBodyAccJerk-std-Z"
*"timeBodyGyroMean-X"
*"timeBodyGyroMean-Y"
*"timeBodyGyroMean-Z"
*"timeBodyGyro-std-X"
*"timeBodyGyro-std-Y"
*"timeBodyGyro-std-Z"
*"timeBodyGyroJerkMean-X"
*"timeBodyGyroJerkMean-Y"
*"timeBodyGyroJerkMean-Z"
*"timeBodyGyroJerk-std-X"
*"timeBodyGyroJerk-std-Y"
*"timeBodyGyroJerk-std-Z"
*"timeBodyAccMagMean"
*"timeBodyAccMagStdDev"
*"timeGravityAccMagMean"
*"timeGravityAccMagStdDev"
*"timeBodyAccJerkMagMean"
*"timeBodyAccJerkMagStdDev"
*"timeBodyGyroMagMean"
*"timeBodyGyroMagStdDev"
*"timeBodyGyroJerkMagMean"
*"timeBodyGyroJerkMagStdDev"
*"freqBodyAccMean-X"
*"freqBodyAccMean-Y"
*"freqBodyAccMean-Z"
*"freqBodyAcc-std-X"
*"freqBodyAcc-std-Y"
*"freqBodyAcc-std-Z"
*"freqBodyAccMeanFreq-X"
*"freqBodyAccMeanFreq-Y"
*"freqBodyAccMeanFreq-Z"
*"freqBodyAccJerkMean-X"
*"freqBodyAccJerkMean-Y"
*"freqBodyAccJerkMean-Z"
*"freqBodyAccJerk-std-X"
*"freqBodyAccJerk-std-Y"
*"freqBodyAccJerk-std-Z"
*"freqBodyAccJerkMeanFreq-X"
*"freqBodyAccJerkMeanFreq-Y"
*"freqBodyAccJerkMeanFreq-Z"
*"freqBodyGyroMean-X"
*"freqBodyGyroMean-Y"
*"freqBodyGyroMean-Z"
*"freqBodyGyro-std-X"
*"freqBodyGyro-std-Y"
*"freqBodyGyro-std-Z"
*"freqBodyGyroMeanFreq-X"
*"freqBodyGyroMeanFreq-Y"
*"freqBodyGyroMeanFreq-Z"
*"freqBodyAccMagMean"
*"freqBodyAccMagStdDev"
*"freqBodyAccMagMeanFreq"
*"freqBodyAccJerkMagMean"
*"freqBodyAccJerkMagStdDev"
*"freqBodyAccJerkMagMeanFreq"
*"freqBodyGyroMagMean"
*"freqBodyGyroMagStdDev"
*"freqBodyGyroMagMeanFreq"
*"freqBodyGyroJerkMagMean"
*"freqBodyGyroJerkMagStdDev"
*"freqBodyGyroJerkMagMeanFreq"

## Study Design

Data was downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Information on data collection from the original data README doc:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details."