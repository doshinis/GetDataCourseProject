run_analysis <- function (){
    
    library(data.table)
    
    library(plyr)
    
    library(dplyr)
    

    # Use the current directoty where the dataset was extracted under "UCI HAR Dataset"

    # Read the 561 features from features.txt as data.table    
    dtFeatures <- data.table(read.table("UCI HAR Dataset/features.txt", nrows = 561))
    
    # Read train - x and y files as data.table    
    dtXtrain <- data.table(read.table("UCI HAR Dataset/train/X_train.txt"))
    dtytrain <- data.table(read.table("UCI HAR Dataset/train/y_train.txt"))

    # Read test - x and y files as data.table
    dtXtest <- data.table(read.table("UCI HAR Dataset/test/X_test.txt"))
    dtytest <- data.table(read.table("UCI HAR Dataset/test/y_test.txt"))

    # Read traing and test - subject files as data.table
    dtSubjecttrain <- data.table(read.table("UCI HAR Dataset/train/subject_train.txt"))
    dtSubjecttest <- data.table(read.table("UCI HAR Dataset/test/subject_test.txt"))
    
    # read activity lables as simple csv with stringsAsFactors = FALSE
    dtActivitylabels <- read.csv("UCI HAR Dataset/activity_labels.txt", header = 
                                     FALSE, stringsAsFactors = FALSE, sep = " ")

    # merge the X_train and X_test data using rbind in a single data.table 
    mrgX <- rbind(dtXtrain, dtXtest)
    
    # merge the y_train and y_test data using rbind in a single data.table 
    mrgY <- rbind(dtytrain, dtytest)

    # merge the subject from train and test data using rbind in a single data.table 
    mrgSubject <- rbind(dtSubjecttrain, dtSubjecttest)

    # extract the feature names and set it as column names of merged X data 
    tFeatures <- t(dtFeatures)
    
    setnames(mrgX, as.vector(tFeatures[2,]))

    # Set column name as 'Activity' for merged Y data 
    setnames(mrgY, "Activity")

    # Set column name as 'Subject' for merged Subject data. Although would have
    # preferred something like 'Participant' or 'Volunteer'.. I am assuming 'Subject'
    # is probably more commonly referred and understood terminology by the targetted users
    setnames(mrgSubject, "Subject")

    # apply the activity labels (before final merging / cbind) on merged Y data as per 6 activity ids
    mrgY$Activity[mrgY$Activity == "1"] <- dtActivitylabels[1, 2]
    mrgY$Activity[mrgY$Activity == "2"] <- dtActivitylabels[2, 2]
    mrgY$Activity[mrgY$Activity == "3"] <- dtActivitylabels[3, 2]
    mrgY$Activity[mrgY$Activity == "4"] <- dtActivitylabels[4, 2]
    mrgY$Activity[mrgY$Activity == "5"] <- dtActivitylabels[5, 2]
    mrgY$Activity[mrgY$Activity == "6"] <- dtActivitylabels[6, 2]
    
    # identify the column names for mean and std only from merged X data
    # - excluding meanFreq    
    meanstdColnames <- mrgX[1,setdiff(grep(paste0(c('-mean()','-std()'), collapse="|"),
                                           colnames(mrgX), value = TRUE),
                                      grep("Freq",colnames(mrgX), value = TRUE))]
    
    #extract DT out of merged X table for the identified column names
    dtMrgXstdmean <- subset(mrgX, select = meanstdColnames)
    
    # The tidy column "variable" names ideally should not have '-' and '()'
    # Replace '-' with '_', and remove '()'. Prepare tidy names for the columns
    tidyColNames1 <- gsub("-", "_", as.vector(colnames(dtMrgXstdmean)))
    tidyColNames <- gsub("\\(\\)", "", tidyColNames1)
    setnames(dtMrgXstdmean, tidyColNames)
    
    # Now create a single dataset of extracted X data, Y = activity data, and Subject data
    # we will go with wide format
    tidyDtFeaturesActivitySubject <- cbind(dtMrgXstdmean, mrgY, mrgSubject)

    # prepare group_by Activity, and Subject on the combined tidy dataset
    by_actsub <- tidyDtFeaturesActivitySubject %>% group_by(Activity, Subject)

    # summarize the the combined tidy dataset, by group_by    
    sumdtTidy <- by_actsub %>% summarise_each(funs(mean))
    
    # finally, for better reading, order the dataset by Subject
    sumdtTidyBySubject <- sumdtTidy[order(sumdtTidy$Subject)]
    
    # would like to end with the output into a file instead of returning dataset
    write.table(sumdtTidyBySubject, "tidyDSForCourseProject.txt", row.names = FALSE)
    
}