## Getting and Cleaning Data Course Project

## This code will get the data and produce a clean and
## tidy data set - according to the guidelines provide - 
## saved as a text file.

## Please see the README.MD and CODEBOOK.MD files 
## for further details on the process, rationale, and variables. 

## Check working directory for data folder. 
## Create data folder if necessary.
if (!file.exists("data")) {
	dir.create("data")
}

## Check newly created directory for data set.
## Download if necessary.
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("./data/ds.zip")) {
	download.file(fileURL, destfile = "./data/ds.zip", method = "curl")
	datedownloaded <- data()
}

## Set working directory to "data" folder.
setwd("./data")

## Check whether downloaded data was unzipped.
## Unzip if necessary.
if (!file.exists("UCI HAR Dataset")) {
	unzip("ds.zip")
}

## Read training data set and its labels. 
trainraw <- read.table("./UCI HAR Dataset/train/X_train.txt", comment.char = "", colClasses = "numeric")
trainact <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainsub <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## Read test data set and its labels.
testraw <- read.table("./UCI HAR Dataset/test/X_test.txt", comment.char = "", colClasses = "numeric")
testact <- read.table("./UCI HAR Dataset/test/y_test.txt")
testsub <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## Read variable names. 
var <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = F)

## Merge data sets.
dsraw <- rbind(trainraw, testraw)

## Assign variable names to merged data set.
names(dsraw) <- var$V2

## Choose all columns with mean, Mean, std in name. 
dsmean <- dsraw[, grep("[Mm]ean", names(dsraw))]
dsstd <- dsraw[, grep("std", names(dsraw))]
dsreduced <- cbind(dsmean, dsstd)

## Merge train and test labels. Name. 
allact <- rbind(trainact, testact)
names(allact) <- c("activity")

## Recode activity variable. Remove original numeric variable. 
attach(allact)
allact$chractivity[activity == 1] <- "walking" 
allact$chractivity[activity == 2] <- "walkingupstairs"
allact$chractivity[activity == 3] <- "walkingdownstairs"
allact$chractivity[activity == 4] <- "sitting"
allact$chractivity[activity == 5] <- "standing"
allact$chractivity[activity == 6] <- "laying"
allact$activity <- NULL
detach(allact)

## Merge train and test subject files. Assign column name. 
allsub <- rbind(trainsub, testsub)
names(allsub) <- c("sub")

## Merge all files. 
dsall <- cbind(allsub, allact, dsreduced)

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

## Check whether reshape2 package is installed. 
## Install, if neccessary.
if (!"reshape2" %in% rownames(installed.packages())){
	install.packages("reshape2")
}

## Load reshape 2 package.
library(reshape2)

## Calculate mean per subject per activity and save into final data frame.
attach(dsall)
dsallmelt <- melt(dsall, id = c("sub", "chractivity"))
detach(dsall)
attach(dsallmelt)
dsfinal <- aggregate(value, by = list(sub, chractivity, variable), FUN = mean)
detach(dsallmelt)
## Assign final data set column names.
names(dsfinal) <- c("sub", "activity", "feature", "featurevalue")

## Save as text.
write.table(dsfinal, file = "tidyds.txt", col.names = T, sep = "") 

## The end. :)
print("A tidy data set called tidyds.txt was saved in your current working directing.")