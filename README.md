## Analysis steps

* **STEP 1**

Check whether the file to be processed (i.e., getdata-projectfiles-UCI HAR Dataset.zip) exists in your current working directory.  If it does not exist, the script will download the data set from the [web](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to your current working directory. It will also save the download date as a new character vector called datedownloaded.

Check whether unzipped folder called UCI HAR Dataset exists. If it does not exist, script will unzip the getdata-projectfiles-UCI HAR Dataset.zip file into your current working directory.

* STEP 2

Read a total of 7 files from the UCI HAR Dataset folder into your workspace:

From the train folder within the UCI HAR Dataset folder, it reads:

| File to be read     | File description | R variable | R class   |
|-------------------|------------------|------------|-----------|
| X_train.txt       | raw train data   | trainraw   | numeric   |
| y_train.txt       | train activities | trainact   | character |
| subject_train.txt | train subjects   | trainsub   | numeric   |

From the test folder with the UCI HAR Dataset folder, it reads:

| File to be read    | File description | R variable | R class   |
|------------------|------------------|------------|-----------|
| X_test.txt       | raw test data    | testraw    | numeric   |
| y_test.txt       | test activities  | testact    | character |
| subject_test.txt | test subjects    | testsub    | numeric   |

From the UCI HAR Dataset folder, it reads:

| File to be read | File description | R variable | R class   |
|---------------|------------------|------------|-----------|
| features.txt  | variable names   | var        | character |

* STEP 3

Merge the train and test raw data sets (i.e., trainraw, testraw) into one data frame (i.e., dsraw). The data frame dsraw will have 10299 rows and 561 columns. This can be checked using: `dim(dsraw)`.

Assign the merged data set dsraw column names that were previously stored as var. 

(Note: Specifically, the script calls the second column of var; the first column signifies the number of rows.)
 
* STEP 4

Subset the data in such that all columns that have mean, Mean or std in the name get copied to a new dataset called dsreduced. This is done in three steps. First, the script subsets the data by mean or Mean, saving it as dsmean. Then, it subsets by std, saving it as dsstd. Finally, it combines dsmean and dsstad into dsreduced. The data frame dsreduced will have 10299 rows and 86 columns. This can be checked using: `dim(dsreduced)`.

(Note: The Course Project assignment did not specify which analyses will be conducted with the tidy data set. I therefore chose a rather conservative subsetting approach and included all columns that have mean, Mean, or std in it. Arguably, not all columns extracted do represent means and std; however, given that no details on further analyses were provided, this conservative approach made sure that all possible variables of interest were included into the tidy dataset.) 

* STEP 5

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

* STEP 6

Merge subject data frames (i.e., trainsub, testsub) into new data frame called allsub. Assign column name sub to allsub.

Merge subject, activity and reduced data set data frames (i.e., allsub, allact, dsreduced) into new data frame called dsall. The data frame dsall will have 10299 rows and 88 columns. This can be checked using: `dim(dsall)`. 

* STEP 7

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
| tBodyGyro-mean()-X                   | tbodygyromeanx                            |
| tBodyGyro-mean()-Y                   | tbodygyromeany                            |
| tBodyGyro-mean()-Z                   | tbodygyromeanz                            |
| tBodyGyroJerk-mean()-X               | tbodygyrojerkmeanx                        |
| tBodyGyroJerk-mean()-Y               | tbodygyrojerkmeany                        |
| tBodyGyroJerk-mean()-Z               | tbodygyrojerkmeanz                        |
| tBodyAccMag-mean()                   | tbodyaccelerationmagnitudemean            |
| tGravityAccMag-mean()                | tgravityaccelerationmagnitudemean         |
| tBodyAccJerkMag-mean()               | tbodyaccelerationjerkmagnitudemean        |
| tBodyGyroMag-mean()                  | tbodygyromagnitudemean                    |
| tBodyGyroJerkMag-mean()              | tbodygyrojerkmagnitudemean                |
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
| fBodyGyro-mean()-X                   | fbodygyromeanx                            |
| fBodyGyro-mean()-Y                   | fbodygyromeany                            |
| fBodyGyro-mean()-Z                   | fbodygyromeanz                            |
| fBodyGyro-meanFreq()-X               | fbodygyromeanfreqx                        |
| fBodyGyro-meanFreq()-Y               | fbodygyromeanfreqy                        |
| fBodyGyro-meanFreq()-Z               | fbodygyromeanfreqz                        |
| fBodyAccMag-mean()                   | fbodyaccelerationmagmean                  |
| fBodyAccMag-meanFreq()               | fbodyaccelerationmagmeanfreq              |
| fBodyBodyAccJerkMag-mean()           | fbodyaccelerationjerkmagnitudemean        |
| fBodyBodyAccJerkMag-meanFreq()       | fbodyaccelerationjerkmagnitudemeanfreq    |
| fBodyBodyGyroMag-mean()              | fbodygyromagnitudemean                    |
| fBodyBodyGyroMag-meanFreq()          | fbodygyromagnitudemeanfreq                |
| fBodyBodyGyroJerkMag-mean()          | fbodygyrojerkmagnitudemean                |
| fBodyBodyGyroJerkMag-meanFreq()      | fbodygyrojerkmagnitudemeanfreq            |
| angle(tBodyAccMean,gravity)          | angletbodyaccelerationmeangravity         |
| angle(tBodyAccJerkMean),gravityMean) | angletbodyaccelerationjerkmeangravitymean |
| angle(tBodyGyroMean,gravityMean)     | angletbodygyromeangravitymean             |
| angle(tBodyGyroJerkMean,gravityMean) | angletbodygyrojerkmeangravitymean         |
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
| tBodyGyro-std()-X                    | tbodygyrostdx                             |
| tBodyGyro-std()-Y                    | tbodygyrostdy                             |
| tBodyGyro-std()-Z                    | tbodygyrostdz                             |
| tBodyGyroJerk-std()-X                | tbodygyrojerkstdx                         |
| tBodyGyroJerk-std()-Y                | tbodygyrojerkstdy                         |
| tBodyGyroJerk-std()-Z                | tbodygyrojerkstdz                         |
| tBodyAccMag-std()                    | tbodyaccelerationmagnitudestd             |
| tGravityAccMag-std()                 | tgravityaccelerationmagnitudestd          |
| tBodyAccJerkMag-std()                | tbodyaccelerationjerkmagnitudestd         |
| tBodyGyroMag-std()                   | tbodygyromagnitudestd                     |
| tBodyGyroJerkMag-std()               | tbodygyrojerkmagnitudestd                 |
| fBodyAcc-std()-X                     | fbodyaccelerationstdx                     |
| fBodyAcc-std()-Y                     | fbodyaccelerationstdy                     |
| fBodyAcc-std()-Z                     | fbodyaccelerationstdz                     |
| fBodyAccJerk-std()-X                 | fbodyaccelerationjerkstdx                 |
| fBodyAccJerk-std()-Y                 | fbodyaccelerationjerkstdy                 |
| fBodyAccJerk-std()-Z                 | fbodyaccelerationjerkstdz                 |
| fBodyGyro-std()-X                    | fbodygyrostdx                             |
| fBodyGyro-std()-Y                    | fbodygyrostdy                             |
| fBodyGyro-std()-Z                    | fbodygyrostdz                             |
| fBodyAccMag-std()                    | fbodyaccelerationmagnitudestd             |
| fBodyBodyAccJerkMag-std()            | fbodyaccelerationjerkmagnitudestd         |
| fBodyBodyGyroMag-std()               | fbodygyromagnitudestd                     |
| fBodyBodyGyroJerkMag-std()           | fbodygyrojerkmagnitudestd                 |

* STEP 8

As the reshape2 package is required for this step, the scripts checks first whether reshape 2 is installed. If it is not installed, it will install the reshape2 package. 

The script loads the reshape2 package. 

Calculate mean per subject (i.e., 1 thorugh 30), per activity (i.e., walking, walking upstairs, walking downstairs, sitting, standing, laying) for each variable and save into a data frame called dsfinal. Assign column names to dsfinal.

This is done in three steps. First, using melt from the reshape2 package, the dsall dataset is converted into a long dta frame called  dsallmelt with only 4 columns (i.e., sub, activity, variable and value). The data frame dsallmet will have 885714 rows and 4 columns. This can be checked using dim(dsallmelt`. Then, mean are calculated and saved into the final data frame called dsfinal. The data frame dsfinal will have 15480 rows and 4 columns. This can be checked using `dim(dsfinal)`. Lastly, column names are assigned to dsfinal. 

This step also assigns current date to a new character vector called dataanalyzed. 
  
(Note: Prior to the melting and mean calcucations steps, the data frames are attached for easier calling of variables. Once finished, the data frames are detached again.)

* Step 9

Save dsfinal as a text file into the current working directory.

Print the following messages on-screen: (1) A tidy data set called tidyds.txt was saved into your current working directory. Please see README.md for specifics on the code used. Please see CodeBook.md for details on the variables in this data set. (2) The data for this analysis was downloaded on <datedownloaded>. The analysis was conducteded on <dateanalyzed>.