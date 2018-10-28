---
title: "Codebook.Rmd"
author: "BODF"
date: "10/28/2018"
output: html_document
---

# Description of Variables
Most of the below is a direct quotation from 'features_info.txt' with some modification to
match the review criteria: "...a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information"

See the end of this codebook for an explanation of the analysis script steps.

Begin Quoted Material (with minor changes):
>##Feature Selection 
>The original features selected for this database came from accelerometer and gyroscope 3-axial raw signals. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>
>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
>
>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
>
>tBodyAcc-XYZ
>tGravityAcc-XYZ
>tBodyAccJerk-XYZ
>tBodyGyro-XYZ
>tBodyGyroJerk-XYZ
>tBodyAccMag
>tGravityAccMag
>tBodyAccJerkMag
>tBodyGyroMag
>tBodyGyroJerkMag
>fBodyAcc-XYZ
>fBodyAccJerk-XYZ
>fBodyGyro-XYZ
>fBodyAccMag
>fBodyAccJerkMag
>fBodyGyroMag
>fBodyGyroJerkMag
>
>Several variables were estimated from these signals, only the below were taken
for the attached data analysis, and the means across subjects and by activity
were measured:
>
>mean = Mean value of the given variable
>std = Standard deviation of the given variable
>
>Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable, which is excluded in this analyzed data:
>
>gravityMean
>tBodyAccMean
>tBodyAccJerkMean
>tBodyGyroMean
>tBodyGyroJerkMean
>
>The complete list of variables of each feature vector is available in 'features.txt'
*NOTE that 'features.txt' will be downloaded by the analysis script provided.*

End Quotation

There were six activities measured, described here:

* Walking

* Walking Upstairs

* Walking Downstairs

* Sitting

* Standing

* Laying

## Data Analysis (Explanation of AccelerometerAnalysis.R)
List of actions:

* The R script checks if the data are downloaded, if not it grabs the data. In
either case, the data are loaded into R.

* The column names are added in from the "features.txt" file after some parsing

* The mean and standard deviation of the data (except angles based on mean values)
are selected.

* The activities of each row are defined in a new column

* Both the test and training data sets are merged by rows (`rbind`)

* The data from all the subjects are then grouped by the "Activity" column and the
mean is taken for each variable.
        + The resulting data frame is the output of this R script. It is saved
        in a space delimited file called "Combined_Activity_Means.txt" in a new
        folder called "Data_Analysis"
