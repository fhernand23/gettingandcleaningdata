### Files in repo

* run_analysis.R: The script of the project
* UCI HAR Dataset: The folder with the source raw data to generate tidy data set
* data_step5.txt: The tidy data set generated with the script, with the average of each variable for each activity and each subject.

### Script detail

* load files with features names and activity labels
* load train data, subject, and activity in separate data.frames
* load test data, subject, and activity in separate data.frames
* set features as data column names
* set activity labels 
* bind train subject, activity and data in one data.frame
* bind test subject, activity and data in one data.frame
* fix column names and rbind test and train data.frames
* transform columns to variables
* filter variables mean and std
* separate observation and measure type in two different columns
* create returning data frame with the average of each variable for each activity and each subject
* write data.frame to file

### Running Script detail

To run the script, checkout all files, put on your workspace folder, and run:

source('run_analysis.R')
run_analysis()

NOTE: The data files should be en a folder named "UCI HAR Dataset", and script should be in root workspace folder.

Federico Hernandez
