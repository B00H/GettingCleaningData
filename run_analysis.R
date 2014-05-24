## Getting and Cleaning Data Course Project

## This code will get the data and produce a clean and
## tidy data set - according to the guidelines provide - 
## saved as a text file.

## Please see the README.MD and CODEBOOK.MD files 
## for further details on the process, rational, and variables. 

## STEP 1
## Check current directory for data set.
## Download if necessary.
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("./getdata-projectfiles-UCI HAR Dataset.zip")) {
	download.file(fileURL, destfile = "./getdata-projectfiles-UCI HAR Dataset.zip", method = "curl")
	datedownloaded <- date()
}

## Check whether downloaded data was unzipped.
## Unzip if necessary.
if (!file.exists("UCI HAR Dataset")) {
	unzip("getdata-projectfiles-UCI HAR Dataset.zip")
}

## STEP 2
## Read training data set, activities and subject labels. 
trainraw <- read.table("./UCI HAR Dataset/train/X_train.txt", comment.char = "", colClasses = "numeric")
trainact <- read.table("./UCI HAR Dataset/train/y_train.txt", colClasses = "character")
trainsub <- read.table("./UCI HAR Dataset/train/subject_train.txt", colClasses = "numeric")

## Read test data set, activities and subject labels.
testraw <- read.table("./UCI HAR Dataset/test/X_test.txt", comment.char = "", colClasses = "numeric")
testact <- read.table("./UCI HAR Dataset/test/y_test.txt", colClasses = "character")
testsub <- read.table("./UCI HAR Dataset/test/subject_test.txt", colClasses = "numeric")

## Read variable names. 
var <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = F)

## STEP 3
## Merge data sets.
dsraw <- rbind(trainraw, testraw)

## Assign variable names to merged data set.
names(dsraw) <- var$V2

## STEP 4
## Choose all columns with mean, Mean, std in name. 
dsmean <- dsraw[, grep("[Mm]ean", names(dsraw))]
dsstd <- dsraw[, grep("std", names(dsraw))]
dsreduced <- cbind(dsmean, dsstd)

## STEP 5
## Merge train and test activity labels. Name column.  
allact <- rbind(trainact, testact)
names(allact) <- c("activity")

## Recode activity variable. Remove original numeric variable. 
attach(allact)
allact$ractivity[activity == 1] <- "walking" 
allact$ractivity[activity == 2] <- "walkingupstairs"
allact$ractivity[activity == 3] <- "walkingdownstairs"
allact$ractivity[activity == 4] <- "sitting"
allact$ractivity[activity == 5] <- "standing"
allact$ractivity[activity == 6] <- "laying"
allact$activity <- NULL
detach(allact)

## STEP 6
## Merge train and test subject files. Assign column name. 
allsub <- rbind(trainsub, testsub)
names(allsub) <- c("sub")

## Merge all files. 
dsall <- cbind(allsub, allact, dsreduced)

## STEP 7. 
## Adapt column names (all lower case; remove dashes, comma, round brackets, 
## duplicates such as bodybody; expand acc to acceleration). 
names(dsall) <- tolower(names(dsall))
names(dsall) <- sub("-", "", names(dsall))
names(dsall) <- sub("-", "", names(dsall))
names(dsall) <- sub("()", "", names(dsall), fixed = T)
names(dsall) <- sub("(", "", names(dsall), fixed = T)
names(dsall) <- sub(")", "", names(dsall), fixed = T)
names(dsall) <- sub(")", "", names(dsall), fixed = T)
names(dsall) <- sub("bodybody", "body", names(dsall))
names(dsall) <- sub(",", "", names(dsall))
names(dsall) <- sub("acc", "acceleration", names(dsall))
names(dsall) <- sub("mag", "magnitude", names(dsall))
names(dsall) <- sub("gyro", "gyroscope", names(dsall))
## STEP 8
## Check whether reshape2 package is installed. 
## Install, if neccessary.
if (!"reshape2" %in% rownames(installed.packages())){
	stop("This script requires the reshape 2 package. Please install the reshape2 package.") 
}

## Load reshape 2 package.
library(reshape2)

## Calculate mean per subject per activity and save into final data frame.
attach(dsall)
dsallmelt <- melt(dsall, id = c("sub", "ractivity"))
detach(dsall)
attach(dsallmelt)
dsfinal <- aggregate(value, by = list(sub, ractivity, variable), FUN = mean)
detach(dsallmelt)
## Assign final data set column names.
names(dsfinal) <- c("sub", "activity", "feature", "featurevalue")
dateanalyzed <- date()

## STEP 9
## Save as text.
write.table(dsfinal, file = "tidyds.txt", col.names = T, sep = "") 

## The end. Print message to user. :)
print("A tidy data set called tidyds.txt was saved in your current working directory.")
print(paste("The raw data set was downloaded on", datedownloaded, "."))
print(paste("The raw data set was processed on", dateanalyzed, "."))