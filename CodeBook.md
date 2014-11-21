# CodeBook

### Raw data

Raw data come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

For each record it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time (start with 't') and frequency (start with 'f') domain variables. 
* Its activity label (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). 
* An identifier of the subject who carried out the experiment (30 subjects).

Domain variables are:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

### Processed data

* Subject is the same as raw data (1:30)
* Activity is the description of raw data (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
* Observation is the observation. In raw data was in column, but it was reshaped to show in rows, and separated from the type of variable (mean, std, mad, max, min...)
* Measure is the type of measure. In raw data was in column with observation. It was reshaped to show in rows, as a factor variable. It was filtered to show only mean (Mean) and std (Standard deviation)
* Value where created with the mean of observations of the original variables grouped by Subject, Activity, Observation and Measure.

