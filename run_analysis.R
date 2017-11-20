
setwd("D:\\DataScienceRepo\\Quiz4\\Q4")

run_analysis<-function()
  {
  filename <- "HAR_dataset.zip"
  ########uncomment the below line if file is not present in working directory
  #download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",filename)
  
  if(file.exists(filename)){
   ########uncomment the below line if file is not present in working directory
   # unzip(filename)    
    
    #Read activity names and Features
    activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")    
    features<-read.table("UCI HAR Dataset/features.txt")
    
    #Extract only the features with mean and standard deviation.
    selectedFeatures<- grep("mean|std",features[,2])
    
    #read training details
    train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
    train_activities <- read.table("UCI HAR Dataset/train/Y_train.txt")
    train_details <- read.table("UCI HAR Dataset/train/X_train.txt")[selectedFeatures]
    trainTable <-cbind(train_subjects,train_activities,train_details)
    
    #read test details
    test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
    test_activities <- read.table("UCI HAR Dataset/test/Y_test.txt")
    test_details <- read.table("UCI HAR Dataset/test/X_test.txt")[selectedFeatures]
    testTable <-cbind(test_subjects,test_activities,test_details)
    
    #merge the Test and training data 
    fullData<-rbind(trainTable,testTable)
     #get names of features with Indexes from selectedFeatures
    featureNames<-features[selectedFeatures,2]
    
     #remove all special characters
    featureNames<- gsub("\\()","" ,featureNames)
    featureNames<- gsub("-","" ,featureNames)
    
    #set column names 
    colnames(fullData)<-c("Subjects","activities",featureNames)
    
    #add activity labels  
    fullData$activities <- factor(fullData$activities, levels = activity_labels[,1], labels = activity_labels[,2])
        
     #tidy data - merge all the feature names into a single column and its values to another.
    tidyData<- gather(fullData,3:81,Values,-Subjects,-activities)
    colnames(tidyData)[3]<-"Variables"
    
    #Mean values group wise     
     tidyDataGrouped<- group_by(tidyData,Subjects,activities,Variables)
     summarize(tidyDataGrouped,mean(Values))
    
     write.table(result,"result.csv",row.names =FALSE,sep = "," )
                  
    
  }
  
  
}
