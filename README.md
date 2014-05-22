## STUDY DESIGN

The following information was adapted from its [original source](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

The data were collected  at the Smartlab at the University of Genoa, Italy. The experiments have been carried out with a group of 30 volunteers (or subjects), aged 19 to 48 years. Each person performed six activities (i.e., walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using the phone's embedded accelerometer and gyroscope, the experiment captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 


## ANALYSIS STEPS

* **STEP 1**

Check whether the file to be processed (i.e., getdata-projectfiles-UCI HAR Dataset.zip) exists in your current working directory.  If it does not exist, the script will download the data set from the [web](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to your current working directory. It will also save the download date as a new character vector called datedownloaded.

Check whether unzipped folder called UCI HAR Dataset exists. If it does not exist, script will unzip the getdata-projectfiles-UCI HAR Dataset.zip file into your current working directory.

* **STEP 2**

Read a total of 7 files from the UCI HAR Dataset folder into your workspace:

From the train folder within the UCI HAR Dataset folder, it reads:

| Original file     | File description | R variable | R class   |
|-------------------|------------------|------------|-----------|
| X_train.txt       | raw train data   | trainraw   | numeric   |
| y_train.txt       | train activities | trainact   | character |
| subject_train.txt | train subjects   | trainsub   | numeric   |

From the test folder with the UCI HAR Dataset folder, it reads:
 
| File to be read  | File description | R variable | R class   |
|------------------|------------------|------------|-----------|
| X_test.txt       | raw test data    | testraw    | numeric   |
| y_test.txt       | test activities  | testact    | character |
| subject_test.txt | test subjects    | testsub    | numeric   |
 
 From the UCI HAR Dataset folder, it reads:

| Original file | File description | R variable | R class   |
|---------------|------------------|------------|-----------|
| features.txt  | variable names   | var        | character |

 * **STEP 3**
 
Merge the train and test raw data sets (i.e., trainraw, testraw) into one data frame (i.e., dsraw). The data frame dsraw will have 10299 rows and 561 columns. This can be checked using: `dim(dsraw)`.
 
Assign the merged data set dsraw column names that were previously stored as var. 

(Note: Specifically, the script calls the second column of var; the first column signifies the number of rows.) 

* **STEP 4**

Subset the data in such that all columns that have mean, Mean or std in the name get copied to a new dataset called dsreduced. This is done in three steps. First, the script subsets the data by mean or Mean, saving it as dsmean. Then, it subsets by std, saving it as dsstd. Finally, it combines dsmean and dsstad into dsreduced. The data frame dsreduced will have 10299 rows and 86 columns. This can be checked using: `dim(dsreduced)`.

(Note: The Course Project assignment did not specify which analyses will be conducted with the tidy data set. I therefore chose a rather conservative subsetting approach and included all columns that have mean, Mean, or std in it. Arguably, not all columns extracted do represent means and std; however, given that no details on further analyses were provided, this conservative approach made sure that all possible variables of interest were included into the tidy dataset.) 

* **STEP 5**

Merge train and test activity labels (i.e., trainact, testact) into one data frame called allact. Assign column name to allact.

For easier reading, the data frame allact is then recoded by adding a new character variable called ractitvity to allact. The recoding scheme is as follows:

| Original activity entry | Recoded activity entry |
|-------------------------|------------------------|
| 1                       | walking                |
| 2                       | walkingupstairs        |
| 3                       | walkingdownstairs      |
| 4                       | sitting                |
| 5                       | standing               |
| 6                       | laying                 |

The numeric activity column is then deleted. 

(Note: For easier calling of variables, allact is attached prior to and detached after recoding.)

* **STEP 6**

Merge subject data frames (i.e., trainsub, testsub) into new data frame called allsub. Assign column name sub to allsub.

Merge subject, activity and reduced data set data frames (i.e., allsub, allact, dsreduced) into new data frame called dsall. The data frame dsall will have 10299 rows and 88 columns. This can be checked using: `dim(dsall)`. 

* **STEP 7**

Adapt column names for better readability, that is, all lower case letters, remove dashes, round brackets, duplicates (e.g., bodybody becomes body), and commas. Also, expand names (e.g., mag becomes magnitude, acc becomes acceleration). Please see table below for original and adapted column names. 

(Note: Naming conventions followed Coursera Getting and Cleaning data guidelines, i.e., all lower case, no dashes or special characters.) 

| Old column name                      | Adapted column name                       |
|--------------------------------------|-------------------------------------------|
| tBodyAcc-mean()-X                    | tbodyaccelerationmeanx                    |
| tBodyAcc-mean()-Y                    | tbodyaccelerationmeany                    |
| tBodyAcc-mean()-Z                    | tbodyaccelerationmeanz                    |
| tGravityAcc-mean()-X                 | tgravityaccelerationmeanx                 |
| tGravityAcc-mean()-Y                 | tgravityaccelerationmeany                 |
| tGravityAcc-mean()-Z                 | tgravityaccelerationmeanz                 |
| tBodyAccJerk-mean()-X                | tbodyaccelerationjerkmeanx                |
| tBodyAccJerk-mean()-Y                | tbodyaccelerationjerkmeany                |
| tBodyAccJerk-mean()-Z                | tbodyaccelerationjerkmeanz                |
| tBodyGyro-mean()-X                   | tbodygyroscopemeanx                            |
| tBodyGyro-mean()-Y                   | tbodygyroscopemeany                            |
| tBodyGyro-mean()-Z                   | tbodygyroscopemeanz                            |
| tBodyGyroJerk-mean()-X               | tbodygyroscopejerkmeanx                        |
| tBodyGyroJerk-mean()-Y               | tbodygyroscopejerkmeany                        |
| tBodyGyroJerk-mean()-Z               | tbodygyroscopejerkmeanz                        |
| tBodyAccMag-mean()                   | tbodyaccelerationmagnitudemean            |
| tGravityAccMag-mean()                | tgravityaccelerationmagnitudemean         |
| tBodyAccJerkMag-mean()               | tbodyaccelerationjerkmagnitudemean        |
| tBodyGyroMag-mean()                  | tbodygyroscopemagnitudemean                    |
| tBodyGyroJerkMag-mean()              | tbodygyroscopejerkmagnitudemean                |
| fBodyAcc-mean()-X                    | fbodyaccelerationmeanx                    |
| fBodyAcc-mean()-Y                    | fbodyaccelerationmeany                    |
| fBodyAcc-mean()-Z                    | fbodyaccelerationmeanz                    |
| fBodyAcc-meanFreq()-X                | fbodyaccelerationmeanfreqx                |
| fBodyAcc-meanFreq()-Y                | fbodyaccelerationmeanfreqy                |
| fBodyAcc-meanFreq()-Z                | fbodyaccelerationmeanfreqz                |
| fBodyAccJerk-mean()-X                | fbodyaccelerationjerkmeanx                |
| fBodyAccJerk-mean()-Y                | fbodyaccelerationjerkmeany                |
| fBodyAccJerk-mean()-Z                | fbodyaccelerationjerkmeanz                |
| fBodyAccJerk-meanFreq()-X            | fbodyaccelerationjerkmeanfreqx            |
| fBodyAccJerk-meanFreq()-Y            | fbodyaccelerationjerkmeanfreqy            |
| fBodyAccJerk-meanFreq()-Z            | fbodyaccelerationjerkmeanfreqz            |
| fBodyGyro-mean()-X                   | fbodygyroscopemeanx                            |
| fBodyGyro-mean()-Y                   | fbodygyroscopemeany                            |
| fBodyGyro-mean()-Z                   | fbodygyroscopemeanz                            |
| fBodyGyro-meanFreq()-X               | fbodygyroscopemeanfreqx                        |
| fBodyGyro-meanFreq()-Y               | fbodygyroscopemeanfreqy                        |
| fBodyGyro-meanFreq()-Z               | fbodygyroscopemeanfreqz                        |
| fBodyAccMag-mean()                   | fbodyaccelerationmagmean                  |
| fBodyAccMag-meanFreq()               | fbodyaccelerationmagmeanfreq              |
| fBodyBodyAccJerkMag-mean()           | fbodyaccelerationjerkmagnitudemean        |
| fBodyBodyAccJerkMag-meanFreq()       | fbodyaccelerationjerkmagnitudemeanfreq    |
| fBodyBodyGyroMag-mean()              | fbodygyroscopemagnitudemean                    |
| fBodyBodyGyroMag-meanFreq()          | fbodygyroscopemagnitudemeanfreq                |
| fBodyBodyGyroJerkMag-mean()          | fbodygyroscopejerkmagnitudemean                |
| fBodyBodyGyroJerkMag-meanFreq()      | fbodygyroscopejerkmagnitudemeanfreq            |
| angle(tBodyAccMean,gravity)          | angletbodyaccelerationmeangravity         |
| angle(tBodyAccJerkMean),gravityMean) | angletbodyaccelerationjerkmeangravitymean |
| angle(tBodyGyroMean,gravityMean)     | angletbodygyroscopemeangravitymean             |
| angle(tBodyGyroJerkMean,gravityMean) | angletbodygyroscopejerkmeangravitymean         |
| angle(X,gravityMean)                 | anglexgravitymean                         |
| angle(Y,gravityMean)                 | angleygravitymean                         |
| angle(Z,gravityMean)                 | anglezgravitymean                         |
| tBodyAcc-std()-X                     | tbodyaccelerationstdx                     |
| tBodyAcc-std()-Y                     | tbodyaccelerationstdy                     |
| tBodyAcc-std()-Z                     | tbodyaccelerationstdz                     |
| tGravityAcc-std()-X                  | tgravityaccelerationstdx                  |
| tGravityAcc-std()-Y                  | tgravityaccelerationstdy                  |
| tGravityAcc-std()-Z                  | tgravityaccelerationstdz                  |
| tBodyAccJerk-std()-X                 | tbodyaccelerationjerkstdx                 |
| tBodyAccJerk-std()-Y                 | tbodyaccelerationjerkstdy                 |
| tBodyAccJerk-std()-Z                 | tbodyaccelerationjerkstdz                 |
| tBodyGyro-std()-X                    | tbodygyroscopestdx                             |
| tBodyGyro-std()-Y                    | tbodygyroscopestdy                             |
| tBodyGyro-std()-Z                    | tbodygyroscopestdz                             |
| tBodyGyroJerk-std()-X                | tbodygyroscopejerkstdx                         |
| tBodyGyroJerk-std()-Y                | tbodygyroscopejerkstdy                         |
| tBodyGyroJerk-std()-Z                | tbodygyroscopejerkstdz                         |
| tBodyAccMag-std()                    | tbodyaccelerationmagnitudestd             |
| tGravityAccMag-std()                 | tgravityaccelerationmagnitudestd          |
| tBodyAccJerkMag-std()                | tbodyaccelerationjerkmagnitudestd         |
| tBodyGyroMag-std()                   | tbodygyroscopemagnitudestd                     |
| tBodyGyroJerkMag-std()               | tbodygyroscopejerkmagnitudestd                 |
| fBodyAcc-std()-X                     | fbodyaccelerationstdx                     |
| fBodyAcc-std()-Y                     | fbodyaccelerationstdy                     |
| fBodyAcc-std()-Z                     | fbodyaccelerationstdz                     |
| fBodyAccJerk-std()-X                 | fbodyaccelerationjerkstdx                 |
| fBodyAccJerk-std()-Y                 | fbodyaccelerationjerkstdy                 |
| fBodyAccJerk-std()-Z                 | fbodyaccelerationjerkstdz                 |
| fBodyGyro-std()-X                    | fbodygyroscopestdx                             |
| fBodyGyro-std()-Y                    | fbodygyroscopestdy                             |
| fBodyGyro-std()-Z                    | fbodygyroscopestdz                             |
| fBodyAccMag-std()                    | fbodyaccelerationmagnitudestd             |
| fBodyBodyAccJerkMag-std()            | fbodyaccelerationjerkmagnitudestd         |
| fBodyBodyGyroMag-std()               | fbodygyroscopemagnitudestd                     |
| fBodyBodyGyroJerkMag-std()           | fbodygyroscopejerkmagnitudestd                 |

* **STEP 8**

As the reshape2 package is required for this step, the scripts checks first whether reshape 2 is installed. If it is not installed, it will install the reshape2 package. 

The script loads the reshape2 package. 

Calculate mean per subject (i.e., 1 thorugh 30), per activity (i.e., walking, walking upstairs, walking downstairs, sitting, standing, laying) for each variable and save into a data frame called dsfinal. Assign column names to dsfinal.

This is done in three steps. First, using melt from the reshape2 package, the dsall dataset is converted into a long dta frame called  dsallmelt with only 4 columns (i.e., sub, activity, variable and value). The data frame dsallmet will have 885714 rows and 4 columns. This can be checked using dim(dsallmelt`. Then, mean are calculated and saved into the final data frame called dsfinal. The data frame dsfinal will have 15480 rows and 4 columns. This can be checked using `dim(dsfinal)`. Lastly, column names are assigned to dsfinal. 

This step also assigns current date to a new character vector called dataanalyzed. 
  
(Note: Prior to the melting and mean calcucations steps, the data frames are attached for easier calling of variables. Once finished, the data frames are detached again.)

* **STEP 9**
 
Save dsfinal as a text file into the current working directory.

Print the following messages on-screen: (1) A tidy data set called tidyds.txt was saved into your current working directory. Please see README.md for specifics on the code used. Please see CodeBook.md for details on the variables in this data set. (2) The data for this analysis was downloaded on <datedownloaded>. The analysis was conducteded on <dateanalyzed>.