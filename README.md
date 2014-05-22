## STUDY DESIGN

The following information was adapted from its [original source](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

The data were collected  at the Smartlab at the University of Genoa, Italy. The experiments have been carried out with a group of 30 volunteers (or subjects), aged 19 to 48 years. Each person performed six activities (i.e., walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using the phone's embedded accelerometer and gyroscope, the experiment captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 



## ANALYSIS STEPS

* **STEP 1**

Check whether the file to be processed (i.e., getdata-projectfiles-UCI HAR Dataset.zip) exists in your current working directory.  If it does not exist, the script will download the data set from the [web](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to your current working directory. It will also save the download date as a new character vector called datedownloaded.

Check whether unzipped folder called UCI HAR Dataset exists. If it does not exist, script will unzip the getdata-projectfiles-UCI HAR Dataset.zip file into your current working directory.

* Save dsfinal as a text file into the current working directory.

Print the following messages on-screen: (1) A tidy data set called tidyds.txt was saved into your current working directory. Please see README.md for specifics on the code used. Please see CodeBook.md for details on the variables in this data set. (2) The data for this analysis was downloaded on <datedownloaded>. The analysis was conducteded on <dateanalyzed>.