This is a course project files for Coursera's "Getting and Cleaning the Data" course.

run_analysis.R script makes the following:

1. It merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average 
of each variable for each activity and each subject.

To run the script you should first download the datasets from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
to your computer and put it into 
subfolder "UCI HAR Dataset" of current directory, where script file run_analysis.R is located.
Library "data.table" is required to run the script, thus make sure that you have it properly 
installed in your R interpreter. As a result or run, a file "tidy_data.txt" containing tidy 
dataset with the average of each variable for each activity and each subject will appear in the 
current directory.
