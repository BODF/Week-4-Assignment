sessionInfo()# Built under R version 3.5.1
## Run from BASH as: $Rscript <Path to this file>
## Goal is to 1) Grab the data, 2) Label the variables, 3) Extract mean and
##      standard deviation of each dataset, 4) Name the activities in each
##      dataset, 5) Merge the training and test datasets, 6) Create a new
##      dataset with the average of each variable grouped by activity and
##      including all the subjects

## Load libraries
library(dplyr)
library(tidyr)
library(readr)

#*****************************************************************************
# This 'if' loop will grab the data for us, if it doesn't exist already.
if(!dir.exists("UCI HAR Dataset")){
        temp <- tempfile() # Provide a temporary file name for the zip archive
        dataURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
        download.file(dataURL, temp)
        unzip(temp)   # Unzip the archive. Produces a new directory, named above
        unlink(temp)  # Deletes temp file
        setwd('UCI HAR Dataset') # Change to the new directory
} else {
        setwd('UCI HAR Dataset')
}
# Now load the data and label the columns
## Loading
testSet <- as_tibble(read.table('./test/X_test.txt'))
testActivity <- as_tibble(read.table('./test/y_test.txt'))
trainingSet <- as_tibble(read.table('./train/X_train.txt'))
trainingActivity <- as_tibble(read.table('./train/y_train.txt'))
## Get the column names and add to the data sets
features <- read.table('features.txt')
features <- gsub('[\\(\\)-]', '', features$V2)# Remove control characters
colnames(testSet) <- features
colnames(trainingSet) <- features
## Select columns containing 'mean' or 'std'
testSet <- testSet[,grep('mean|std', colnames(testSet))]
trainingSet <- trainingSet[,grep('mean|std', colnames(trainingSet))]

#*****************************************************************************

# Apply row names based on activity labels in the 'y...txt' files
## First add an empty 'Activity' column to each dataset
testSet[,"Activity"] <- character()
trainingSet[,"Activity"] <- character()
## Usage: Input the training/test set as 'data' and activities as 'activity'
##       >data <- Namer(data, activity)
##       Output is the original data plus activity labels
Namer <- function(data, activity){
        nameVector <- character()
        for(i in 1:dim(activity)[1]){
                if(activity[i,1] == 1){
                        nameVector[i] <- "Walking"
                } else if(activity[i,1] == 2){
                        nameVector[i] <- "WalkingUpstairs"
                } else if(activity[i,1] == 3){
                        nameVector[i] <- "WalkingDownstairs"
                } else if(activity[i,1] == 4){
                        nameVector[i] <- "Sitting"
                } else if(activity[i,1] == 5){
                        nameVector[i] <- "Standing"
                } else if(activity[i,1] == 6){
                        nameVector[i] <- "Laying"
                } else {stop("Missing Activity Value!")} # If no matches, pass an error
        }
        mutate(data, Activity = nameVector)
}
# Execute the Namer function
testSet <- Namer(testSet, testActivity)
trainingSet <- Namer(trainingSet, trainingActivity)

#*****************************************************************************

# Make the final dataset
## Bind the data together in a new table and free up memory
Data <- rbind(testSet, trainingSet); rm(testSet, trainingSet)
## Group by activity and then take the mean if a column is numeric.
Data <- Data %>% group_by(Activity) %>%
        summarize_if(is.numeric, mean, na.rm=TRUE)
## Write the output file, named: "Combined_Activity_Means.txt"
dir.create("./Data_Analysis")
write_delim(Data, path = "./Data_Analysis/Combined_Activity_Means.txt", delim = " ")
