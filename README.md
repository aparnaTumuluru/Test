
The script run_analysis.R does the following:

Expects the "UCI HAR Dataset" Folder to be present in the working directory.

If not, please uncomment the below lines from  run_analysis.R for it to automatically download and run analysis on it.
 #download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",filename)
 # unzip(filename)
 
Loads the activity and feature details from files

Loads both the training and test datasets with only features corresponding to mean and Std

Merges the two datasets

sets the activity and subject columns into factors

Creates a tidy dataset that consists of the  mean value of each variable for each subject and activity pair.

The end result is shown in the file result.txt.
