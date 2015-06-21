##This is a course project files for Coursera's "Getting and Cleaning the Data" course.

This repository contains run_analysis.R script, which processes the data obtained from mobile phones in order to recognize automatically current activity of phone holder based on accelerometer and position sensors. Description of the project can be found elsewhere, for details see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. Data being processed together with the detailed description is to be downloaded from  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The script makes the following:

1. It merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average 
of each variable for each activity and each subject.

To run the script you should first download the zipped datasets from the URL mentioned above, decompress it to your computer into  subfolder "UCI HAR Dataset" of current directory, where script file run_analysis.R is located.
Library "data.table" is required to run the script, thus make sure that you have it properly 
installed in your R interpreter. As a result or run, a file "tidy_data.txt" containing tidy 
dataset with the average of each variable for each activity and each subject will appear in the 
current directory.

Detailed description of variables and calls in run_analysis.R is placed into codebook.md file located in this repository.
