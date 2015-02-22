---
title: "codebook"
author: "ND"
date: "Friday, February 20, 2015"
output: html_document
---

##Overview

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Please refer to the base dataset readme.txt, features.txt, and features_info.txt files for details. The base data has been further analyzed to create a tidy dataset through following steps:
    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each         measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names. 
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###This code book describes the variables in tidy dataset ("tidyDSForCourseProject.txt") produced using run_analysis.R script.


Activity:    character string OR VARCHAR(50)
    
    Six activities performed by each subject. The original activity codes in y_train and y_test have been replaced by descriptive activity names retrieved from activity_labels.txt
    
    1 WALKING
    2 WALKING_UPSTAIRS
    3 WALKING_DOWNSTAIRS
    4 SITTING
    5 STANDING
    6 LAYING
    
Subject:     digit number between 1 to 30 
    
    The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.

    1 to 30
    

Features Variables - Description and transformation

    The features selected for this database come from the original dataset, in which the accelerometer and gyroscope 3-axial raw signals (X, Y, and Z) were processed to estimate there variables as time domain (t prefix) and frequence domain ('f' prefix) signals. The original 561 feature variables were subsequently processed to extract only two types of variables: mean and standard deviation resulting in 66 variables across X_train and X_test for 10299 observations. The 10299 observations were further grouped by activity and subject, and finally summarized by calculating mean. The final result set consists of 180 observations (for 30 subjects, 6 activities each). Note that postfix '-X', '-Y', '-Z' denotes 3-axial signals in the X, Y and Z directions.

TIDY Feature Variables:    numeric (double) values

NOTE: Features are normalized for time and frequency domains and hence specific units are not provided.

    tBodyAcc_mean_X
    tBodyAcc_mean_Y
    tBodyAcc_mean_Z
    tBodyAcc_std_X
    tBodyAcc_std_Y
    tBodyAcc_std_Z
    tGravityAcc_mean_X
    tGravityAcc_mean_Y
    tGravityAcc_mean_Z
    tGravityAcc_std_X
    tGravityAcc_std_Y
    tGravityAcc_std_Z
    tBodyAccJerk_mean_X
    tBodyAccJerk_mean_Y
    tBodyAccJerk_mean_Z
    tBodyAccJerk_std_X
    tBodyAccJerk_std_Y
    tBodyAccJerk_std_Z
    tBodyGyro_mean_X
    tBodyGyro_mean_Y
    tBodyGyro_mean_Z
    tBodyGyro_std_X
    tBodyGyro_std_Y
    tBodyGyro_std_Z
    tBodyGyroJerk_mean_X
    tBodyGyroJerk_mean_Y
    tBodyGyroJerk_mean_Z
    tBodyGyroJerk_std_X
    tBodyGyroJerk_std_Y
    tBodyGyroJerk_std_Z
    tBodyAccMag_mean
    tBodyAccMag_std
    tGravityAccMag_mean
    tGravityAccMag_std
    tBodyAccJerkMag_mean
    tBodyAccJerkMag_std
    tBodyGyroMag_mean
    tBodyGyroMag_std
    tBodyGyroJerkMag_mean
    tBodyGyroJerkMag_std
    fBodyAcc_mean_X
    fBodyAcc_mean_Y
    fBodyAcc_mean_Z
    fBodyAcc_std_X
    fBodyAcc_std_Y
    fBodyAcc_std_Z
    fBodyAccJerk_mean_X
    fBodyAccJerk_mean_Y
    fBodyAccJerk_mean_Z
    fBodyAccJerk_std_X
    fBodyAccJerk_std_Y
    fBodyAccJerk_std_Z
    fBodyGyro_mean_X
    fBodyGyro_mean_Y
    fBodyGyro_mean_Z
    fBodyGyro_std_X
    fBodyGyro_std_Y
    fBodyGyro_std_Z
    fBodyAccMag_mean
    fBodyAccMag_std
    fBodyBodyAccJerkMag_mean
    fBodyBodyAccJerkMag_std
    fBodyBodyGyroMag_mean
    fBodyBodyGyroMag_std
    fBodyBodyGyroJerkMag_mean
    fBodyBodyGyroJerkMag_std
