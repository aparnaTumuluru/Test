# Test
The script run_analysis.R does the following:

Downlaods the zip file from the URL 
unzips it 
if the file exists only then 
Loads the activity and feature details
Loads both the training and test datasets with only features corresponding to mean and Std
Merges the two datasets
Converts the activity and subject columns into factors
Creates a tidy dataset that consists of the  mean value of each variable for each subject and activity pair.
The end result is shown in the file result.txt.
