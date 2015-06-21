This repo contains script run_analysis.R, which solves the course project problem of Coursera's "Getting and cleaning the data" course. 

Actual task description see at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, for the description of raw data being processed please consult README.txt file from  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

1. The data for activity, subject and features is loaded from test and train datafiles into table variables activity_test, activity_train, 
subject_test, subject_train, features_test, features_train. Feature names and activity labels are also loaded into tables feature_names 
and activity_labels.
2. Then, the subjects, activities and features are first merged separately with rbind() call, producing subject_merged, activity_merged 
and features_merged tables, which then are merged together into "all_merged_data" with cbind().
3. Column names of "all_merged_data" dataset containing "mean" and "std" (which corresponds to means and standart deviations) 
are then filtered by grep() call. These column names together with added "Activity" and "Subject" columns are used to subset the data of 
interest from all_merged_data. Result is put into variable "extracted_mean_std".
4. All columns of "extracted_mean_std" tables are then labeled in accordance with the names from "activity_labels" dataset, 
while "Activity" and "Subject" variables are then converted to factors.
5. Finally, averages of each variable were calculated by aggregate() call, a tidy dataset "tidy_data_to_save" is prepared and saved 
into file "tidy_data.txt" in the code working directory.

The detailed explanations of column names for the resulting tidy dataset can be found in datasource subdirectory, 
consult files "UCI HAR Dataset/features.txt" and "UCI HAR Dataset/features_info.txt".

The instructions how to run a script run_analysis.R can be found in README.md file of this repository.
