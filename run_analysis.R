library(reshape2)

## Download data if doesn't exist locally
filename <- "dataset.zip"
if(!file.exists(filename)) {
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  success <- download.file(url, filename, method="curl")
  if (success != 0) {
    stop("Failed to download dataset")
  }
}

## Unzip data if hasn't been previously unzipped
dataFolder <- "UCI HAR Dataset"
if(!file.exists(dataFolder)) {
  unzip("dataset.zip")
}

## Read data files
feature_labels <- read.table("./UCI HAR Dataset/features.txt")
# Trim to vector so that column names can be set when reading training and test data
feature_labels <- as.character(feature_labels[,2])

training_data <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names=feature_labels)
training_activities <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names="activityId")
training_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names="subjectId")

test_data <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names=feature_labels)
test_activities <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names="activityId")
test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names="subjectId")

# Lookup table for activity codes
activity_lut <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("index","activity"))

## Step 1: Merges the training and the test sets to create one data set
merged_data <- rbind(training_data, test_data)

## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
# Identify indexes that correspond to mean or std measurements
feature_labels_trimmed_logical <- grepl("mean()|std()",feature_labels)
# Trim dataset 
merged_data_trimmed <- merged_data[,feature_labels_trimmed_logical]

## Step 3: Uses descriptive activity names to name the activities in the data set
merged_activities <- rbind(training_activities, test_activities)
# Resolve list of activity codes to activity names
merged_activities_resolved <- lapply(merged_activities, function(x) activity_lut$activity[match(x, activity_lut$index)])
merged_activities_resolved <- merged_activities_resolved[[1]]
merged_data_trimmed$activity <- merged_activities_resolved

## Step 4: Appropriately labels the data set with descriptive variable names
new_colnames <- gsub(".mean" ,"Mean", colnames(merged_data_trimmed))
new_colnames <- gsub(".std" ,"Std", new_colnames)
new_colnames <- gsub("[.+]" ,"", new_colnames)
tidy_data_1 <- merged_data_trimmed
colnames(tidy_data_1) <- new_colnames

## Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_data_2 <- tidy_data_1
merged_subjects <- rbind(training_subjects, test_subjects)
tidy_data_2 <- cbind(merged_subjects, tidy_data_2)
# Create tall, skinny dataset using subjectId and activity as index variables
tidy_data_2_melt <- melt(tidy_data_2, id.vars=c("subjectId","activity"))
# Calculate mean value for each subject, activity, and variable
tidy_data_2_mean <- dcast(tidy_data_2_melt, subjectId + activity ~ variable, mean)
write.table(tidy_data_2_mean, "tidy_data.txt", quote=FALSE, row.names=FALSE)

