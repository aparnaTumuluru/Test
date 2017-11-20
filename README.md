
Notes:

1.Expects the "UCI HAR Dataset" Folder to be present in your working directory.

If not, please uncomment(remove # symbol) the below lines from run_analysis.R file for it to automatically download
 #download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",filename)
 #unzip(filename)  
  
 2. Expects tidyr and dplyr packages to be installed. 
  If not, please run the below lines before executing the R file. 
  install_packages("tidyr)
  
  install_packages("dplyr")
  
  library(tidyr)
  
  library(dplyr)  

3.The end result is shown in the file result.csv that is created in your working folder.

 
Execution steps:
Loads the activity and feature details from files

Loads both the training and test datasets with only features corresponding to mean and Std

Merges the two datasets to a single one and renames the columns.

Creates a tidy dataset that consists of the  mean value of each variable for each subject and activity pair.


