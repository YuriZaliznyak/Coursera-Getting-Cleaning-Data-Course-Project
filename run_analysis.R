## This R script run_analysis.R that does the following: 
## 1. Merges the training and the test sets to create one data set. Data is taken 
##    from the subfolder "UCI HAR Dataset" in the wroking directory.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.

library (data.table) # "data.table" library is to be intallled in R!

# Load the data from test and training datasets
# activity
activity_test  <- read.table ("UCI HAR Dataset/test/y_test.txt", header = FALSE)
activity_train <- read.table ("UCI HAR Dataset/train/y_train.txt", header = FALSE)

# subject
subject_test  <- read.table ("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
subject_train <- read.table ("UCI HAR Dataset/train/subject_train.txt", header = FALSE)

# fearures
features_test  <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
features_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)

# features names ans labels
feature_names <- read.table ("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

# preparing merged dataset
subject_merged <- rbind(subject_train, subject_test)
colnames(subject_merged) <- "Subject"
activity_merged <- rbind(activity_train, activity_test)
colnames(activity_merged) <- "Activity"
features_merged <- rbind(features_train, features_test)
colnames(features_merged) <- t(feature_names[2])

all_merged_data <- cbind(features_merged, activity_merged, subject_merged)

# find columns containing mean standart deviation daat by grep-ing colnames for "std" and "mean"
columns_with_mean_std <- grep("*mean*|*std*", names(all_merged_data), ignore.case=TRUE)

# add colnames 562, 563, where we put "Activity" and "Subject"
cols_4_extracted_data <- c(columns_with_mean_std, 562, 563)

# finally, extract part of data with mean std-s + Activity + Subject
extracted_mean_std <- all_merged_data[, cols_4_extracted_data]

# Label activities in accordance with descriptive activity names from "activity_labels.txt" 
# file, and make them as factor.
extracted_mean_std$Activity <- as.character(extracted_mean_std$Activity)
for (irow in 1:nrow(activity_labels)){
    extracted_mean_std$Activity[extracted_mean_std$Activity == irow] <- 
        as.character(activity_labels[irow, 2])
}
extracted_mean_std$Activity <- as.factor(extracted_mean_std$Activity)
extracted_mean_std$Subject <- as.factor(extracted_mean_std$Subject)


# Create a tidy dataset and save it to file
extracted_mean_std <- data.table(extracted_mean_std)
tidy_data_to_save <- aggregate(. ~Subject + Activity, extracted_mean_std, mean)
tidy_data_to_save <- tidy_data_to_save[order(tidy_data_to_save$Subject, 
                                             tidy_data_to_save$Activity),]
write.table(tidy_data_to_save, file = "tidy_data.txt", row.names = FALSE)
