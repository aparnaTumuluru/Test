
run_analysis<-function()
  {
  filename <- "HAR_dataset.zip"
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",filename)
  ##unizp contents
  if(file.exists(filename)){
    unzip(filename)
    
    
    activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")
    activity_labels<-activity_labels[,2]
    
    features<-read.table("UCI HAR Dataset\\features.txt")
    
    #Extract only the measurements on the mean and standard deviation for each measurement.
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
    featureNames<-features[selectedFeatures,2]
    featureNames<- gsub("\\()","" ,featureNames)
    
    colnames(fullData)<-c("Subjects","activities",featureNames)
    
    #add activity labels  
    fullData$activities <- factor(fullData$activities, levels = activity_labels[,1], labels = activity_labels[,2])
    
    #tidy data 
    tidyData<- gather(fullData,3:81,Values,-Subjects,-activities)
      colnames(tidyData)[3]<-"Variables"
    #Mean values group wise
      tidyData%>%  group_by(Subjects,activities)%>%
        summarise(mean(Values))
    
  }
  
  
}
