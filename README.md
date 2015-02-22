---
title: "ReadMe"
author: "ND"
date: "Saturday, February 21, 2015"
output: html_document
---

==================================================================
Human Activity Recognition Using Smartphones - TIDY Dataset
Version 1.0
==================================================================
Original Dataset:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

This readme file describes the TIDY dataset version of the Human Activity Recognition, the analysis script, and relevant files.

For each record in the TIDY dataset, it is provided:
====================================================

1. Activities performed by volunteers
2. Subjects - identifiers for volunteers
3. Features - Summarized values calculated as mean() for mean and standard deviation feature variables (66). These variables originate from the base data records for:

    - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
    - Triaxial Angular velocity from the gyroscope. 
    - A 561-feature vector with time and frequency domain variables. 
    - Its activity label. 
    - An identifier of the subject who carried out the experiment.

The TIDY dataset and analysis work includes the following files:
===========================================================


1. Readme.txt: This file - readme file for tidy dataset

2. run_analysis.R: Actual R script to process the base dataset (described below). The script assumes the base data to be available in the current folder / directory. The base dataset directory is "UCI HAR Dataset". This will further contain the folders for "train" and "test" subdirectories. For example, the file features.txt will be opened as path "UCI HAR Dataset/features.txt". Similarly, X_train.txt will be opened as "UCI HAR Dataset/train/X_train.txt". 

    The dependencies for the script are data.table, plyr, and dplyr packages. The run_analysis.R script produces the tiday dataset output file "tidyDSForCourseProject.txt".
    
    To test and view the output file, use following commands from R or RStudio console:
    
        > tidyView <- read.table("tidyDSForCourseProject.txt", header = TRUE)
        
        > View(tidyView)

3. CodeBook.md: Describes the variables, the data, and any transformations or work performed to clean up the data and prouce tidy dataset.

4. tidyDSForCourseProject.txt: The tidy dataset produced using run_analysis.R



###The BASE dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

###Notes for BASE dataset: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

###License for BASE dataset:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The BASE dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
