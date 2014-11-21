run_analysis <- function() {
  ## load features file to set variable names
  features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("Feature_id", "Feature_name"))
  ## load activity labels to set descriptive activity
  activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("Activity_id", "Activity"))

  ## load train data
  x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
  ## load train subject
  subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = c("Subject"))
  ## load train activity
  y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = c("Activity_id"))
  ## load test data
  x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
  ## load test subject
  subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = c("Subject"))
  ## load test activity
  y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = c("Activity_id"))
  
  ## set variable names to column data
  names(x_train) <- features$Feature_name
  names(x_test) <- features$Feature_name
  
  ## join activity with description table
  library(plyr)
  y_train <- join(y_train, activity_labels, type="left")
  y_test <- join(y_test, activity_labels, type="left")
  
  ## bind train subject, activity and data in one data.frame
  train <- cbind(subject_train, y_train$Activity, x_train)
  ## bind test subject, activity and data in one data.frame
  test <- cbind(subject_test, y_test$Activity, x_test)
  ## set same name to activity column previous to rbind
  colnames(train)[2] <- "Activity"
  colnames(test)[2] <- "Activity"
  
  ## bind rows train & test data.frame
  data <- rbind(train, test)
  
  ## trasform data to tidy with tidyr
  library(tidyr)
  ## transform columns to variables
  data <- gather(data, "Observation_Measure", "Value", -Subject, -Activity)
  ## filter only mean() and std() variables
  data <- data[grepl("mean\\(\\)|std\\(\\)", data$Observation_Measure), ]
  ## transform Observation_Measure into 2 new columns
  ## create new column Measure with value mean or std
  data$Measure <- ifelse(grepl("mean\\(\\)", data$Observation_Measure),
                          "mean", "std")
  ## create new column Observation with the observation minus mean() or std()
  data$Observation <- sub("\\-mean\\(\\)|\\-std\\(\\)", "", data$Observation_Measure)
  ## recreate a new dataframe with tidy columns
  tidy_data <- data.frame(
    Subject=data$Subject, 
    Activity=data$Activity, 
    Observation=data$Observation, 
    Measure=data$Measure, 
    Value=data$Value)
  ## create returning data frame with the average of each variable for each activity and each subject
  res_data <- ddply(tidy_data, c("Subject", "Activity", "Observation", "Measure"), summarise,
        Mean = mean(Value))
  ## write data.frame to file
  write.table(res_data, "data_step5.txt", row.names = FALSE)
}