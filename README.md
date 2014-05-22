## Analysis steps

* **STEP 1**

Check whether the file to be processed (i.e., getdata-projectfiles-UCI HAR Dataset.zip) exists in your current working directory.  If it does not exist, the script will download the data set from the [web](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to your current working directory. It will also save the download date as a new character vector called datedownloaded.

Check whether unzipped folder called UCI HAR Dataset exists. If it does not exist, script will unzip the getdata-projectfiles-UCI HAR Dataset.zip file into your current working directory.

* Save dsfinal as a text file into the current working directory.

Print the following messages on-screen: (1) A tidy data set called tidyds.txt was saved into your current working directory. Please see README.md for specifics on the code used. Please see CodeBook.md for details on the variables in this data set. (2) The data for this analysis was downloaded on <datedownloaded>. The analysis was conducteded on <dateanalyzed>.