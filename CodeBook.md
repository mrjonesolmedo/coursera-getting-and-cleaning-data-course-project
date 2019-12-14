# Code Book
This is the code book for the data `tidy_data.txt`. It is compatible with R version 3.5.0 (2018-04-23). 

The dataset contains the average value of 79 smartphone inertial sensor signals collected from 30 participants while performing 6 activities. The signals are composed of mean values and standard deviation values of time domain (prefix 't') and frequency domain (prefix 'f') data. Mean values are identified with 'Mean' in the variable name, and standard deviation values are identified with 'Std' in the variable name. Units were not provided in the raw dataset so are omitted here.

# Variables
subjectId [Integer value between 1 and 30]\
activity [One of (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)]\
tBodyAccMeanX\
tBodyAccMeanY\
tBodyAccMeanZ\
tBodyAccStdX\
tBodyAccStdY\
tBodyAccStdZ\
tGravityAccMeanX\
tGravityAccMeanY\
tGravityAccMeanZ\
tGravityAccStdX\
tGravityAccStdY\
tGravityAccStdZ\
tBodyAccJerkMeanX\
tBodyAccJerkMeanY\
tBodyAccJerkMeanZ\
tBodyAccJerkStdX\
tBodyAccJerkStdY\
tBodyAccJerkStdZ\
tBodyGyroMeanX\
tBodyGyroMeanY\
tBodyGyroMeanZ\
tBodyGyroStdX\
tBodyGyroStdY\
tBodyGyroStdZ\
tBodyGyroJerkMeanX\
tBodyGyroJerkMeanY\
tBodyGyroJerkMeanZ\
tBodyGyroJerkStdX\
tBodyGyroJerkStdY\
tBodyGyroJerkStdZ\
tBodyAccMagMean\
tBodyAccMagStd\
tGravityAccMagMean\
tGravityAccMagStd\
tBodyAccJerkMagMean\
tBodyAccJerkMagStd\
tBodyGyroMagMean\
tBodyGyroMagStd\
tBodyGyroJerkMagMean\
tBodyGyroJerkMagStd\
fBodyAccMeanX\
fBodyAccMeanY\
fBodyAccMeanZ\
fBodyAccStdX\
fBodyAccStdY\
fBodyAccStdZ\
fBodyAccMeanFreqX\
fBodyAccMeanFreqY\
fBodyAccMeanFreqZ\
fBodyAccJerkMeanX\
fBodyAccJerkMeanY\
fBodyAccJerkMeanZ\
fBodyAccJerkStdX\
fBodyAccJerkStdY\
fBodyAccJerkStdZ\
fBodyAccJerkMeanFreqX\
fBodyAccJerkMeanFreqY\
fBodyAccJerkMeanFreqZ\
fBodyGyroMeanX\
fBodyGyroMeanY\
fBodyGyroMeanZ\
fBodyGyroStdX\
fBodyGyroStdY\
fBodyGyroStdZ\
fBodyGyroMeanFreqX\
fBodyGyroMeanFreqY\
fBodyGyroMeanFreqZ\
fBodyAccMagMean\
fBodyAccMagStd\
fBodyAccMagMeanFreq\
fBodyBodyAccJerkMagMean\
fBodyBodyAccJerkMagStd\
fBodyBodyAccJerkMagMeanFreq\
fBodyBodyGyroMagMean\
fBodyBodyGyroMagStd\
fBodyBodyGyroMagMeanFreq\
fBodyBodyGyroJerkMagMean\
fBodyBodyGyroJerkMagStd\
fBodyBodyGyroJerkMagMeanFreq\

# Study design
The raw data was downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

A full description of the raw data is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The data was then processed according to the script `run_analysis.R` which performs five steps:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
