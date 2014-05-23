## CODE BOOK

### STUDY DESIGN

The following information was adapted from its [original source](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

The data were collected  at the Smartlab at the University of Genoa, Italy. The experiments have been carried out with a group of 30 volunteers (or subjects), aged 19 to 48 years. Each person performed six activities (i.e., walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using the phone's embedded accelerometer and gyroscope, the experiment captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The variables selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tbodyaccelerationXYZ and tgravityaccelerationXYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tbodyaccelerationjerkxyz and tbodygyroscopejerkxyz). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tbodyaccelerationmagnitude, tgravityaccelerationmagnitude, tbodyaccelerationjerkmagnitude, tbodygyroscopemagnitude, tbodygyroscopejerkmagnitude). Finally a Fast Fourier Transform (FFT - labeled as f in the data set) was applied to some of these signals producing fbodyaccelerationxyz, fbodyaccelerationjerkxyz, fgodygyroscopexyz, fbodyaccelerationjerkmagnitude, fgodygyroscopemagnitude, fbodygyroscopejerkmagnitude. These signals were used to estimate variables of the feature vector for each pattern: 'XYZ' is used to denote 3-axial signals in the X, Y and Z directions. Mean denotes mean, std denote standard deviation. 

### VARIABLES OF TIDY DATA SET

The following table lists the variables used in the analysis, including variable name, description of variables and summary measure. As outlined in README.md, only those columns containing the words mean or Mean or std were carried over into the reduced data set. For further details, see README.md. Please note that all variables in tidyds.txt represent means, including means of standard deviations.  

| Variable name                             | Type      | Description                                                                                   |
|-------------------------------------------|-----------|-----------------------------------------------------------------------------------------------|
| sub                                       | numeric   | subjects (values 1 through 30)                                                                |
| ractivity                                 | character | activity subjects performed                                                                   |
| tbodyaccelerationmeanx                    | numeric   | time body linear acceleration in X axis mean                                                  |
| tbodyaccelerationmeany                    | numeric   | time body linear acceleration in Y axis mean                                                  |
| tbodyaccelerationmeanz                    | numeric   | time body linear acceleration in Z axis mean                                                  |
| tgravityaccelerationmeanx                 | numeric   | time gravity acceleration in X axis mean                                                      |
| tgravityaccelerationmeany                 | numeric   | time gravity acceleration in Y axis mean                                                      |
| tgravityaccelerationmeanz                 | numeric   | time gravity acceleration in Z axis mean                                                      |
| tbodyaccelerationjerkmeanx                | numeric   | time body linear acceleration jerk signal in X axis mean                                      |
| tbodyaccelerationjerkmeany                | numeric   | time body linear acceleration jerk signal in Y axis mean                                      |
| tbodyaccelerationjerkmeanz                | numeric   | time body linear acceleration jerk signal in Z axis mean                                      |
| tbodygyroscopescopemeanx                  | numeric   | time body angular velocity in X axis mean                                                     |
| tbodygyroscopemeany                       | numeric   | time body angular velocity in Y axis mean                                                     |
| tbodygyroscopemeanz                       | numeric   | time body angular velocity in Z axis mean                                                     |
| tbodygyroscopejerkmeanx                   | numeric   | time body angular velocity jerk signal in X axis mean                                         |
| tbodygyroscopejerkmeany                   | numeric   | time body angular velocity jerk signal in Y axis mean                                         |
| tbodygyroscopejerkmeanz                   | numeric   | time body angular velocity jerk signal in Z axis mean                                         |
| tbodyaccelerationmagnitudemean            | numeric   | time body linear acceleration velocity magnitude mean                                         |
| tgravityaccelerationmagnitudemean         | numeric   | time gravity linear acceleration magnitude mean                                               |
| tbodyaccelerationjerkmagnitudemean        | numeric   | time body linear acceleration jerk signal magnitude mean                                      |
| tbodygyroscopemagnitudemean               | numeric   | time body angular velocity magnitude mean                                                     |
| tbodygyroscopejerkmagnitudemean           | numeric   | time body angular velocity jerk signal magnitude mean                                         |
| fbodyaccelerationmeanx                    | numeric   | fourier transformed body linear acceleration in X axis mean                                   |
| fbodyaccelerationmeany                    | numeric   | fourier transformed body linear acceleration in Y axis mean                                   |
| fbodyaccelerationmeanz                    | numeric   | fourier transformed body linear acceleration in Z axis mean                                   |
| fbodyaccelerationmeanfreqx                | numeric   | fourier transformed body linear acceleration mean frequency in X axis mean                    |
| fbodyaccelerationmeanfreqy                | numeric   | fourier transformed body linear acceleration mean frequency in Y axis mean                    |
| fbodyaccelerationmeanfreqz                | numeric   | fourier transformed body linear acceleration mean frequency in Z axis mean                    |
| fbodyaccelerationjerkmeanx                | numeric   | fourier transformed body linear acceleration jerk signal in X axis mean                       |
| fbodyaccelerationjerkmeany                | numeric   | fourier transformed body linear acceleration jerk signal in Y axis mean                       |
| fbodyaccelerationjerkmeanz                | numeric   | fourier transformed body linear acceleration jerk signal in Z axis mean                       |
| fbodyaccelerationjerkmeanfreqx            | numeric   | fourier transformed body linear acceleration jerk signal mean frequency in X axis mean        |
| fbodyaccelerationjerkmeanfreqy            | numeric   | fourier transformed body linear acceleration jerk signal mean frequency in Y axis mean        |
| fbodyaccelerationjerkmeanfreqz            | numeric   | fourier transformed body linear acceleration jerk signal mean frequency in Z axis mean        |
| fbodygyroscopemeanx                       | numeric   | fourier transformed body angular velocity in X axis mean                                      |
| fbodygyroscopemeany                       | numeric   | fourier transformed body angular velocity in Y axis mean                                      |
| fbodygyroscopemeanz                       | numeric   | fourier transformed body angular velocity in Z axis mean                                      |
| fbodygyroscopemeanfreqx                   | numeric   | fourier transformed body angular velocity mean frequency in X axis mean                       |
| fbodygyroscopemeanfreqy                   | numeric   | fourier transformed body angular velocity mean frequency in Y axis mean                       |
| fbodygyroscopemeanfreqz                   | numeric   | fourier transformed body angular velocity mean frequency in Z axis mean                       |
| fbodyaccelerationmagnitudemean            | numeric   | fourier transformed body linear acceleration magnitude mean                                   |
| fbodyaccelerationmagnitudemeanfreq        | numeric   | fourier transformed body linear acceleration magnitude mean frequency mean                    |
| fbodyaccelerationjerkmagnitudemean        | numeric   | fourier transformed body linear acceleration jerk signal magnitude mean                       |
| fbodyaccelerationjerkmagnitudemeanfreq    | numeric   | fourier transformed body linear acceleration jerk signal magnitude mean frequency mean        |
| fbodygyroscopemagnitudemean               | numeric   | fourier transformed body angular velocity magnitude mean                                      |
| fbodygyroscopemagnitudemeanfreq           | numeric   | fourier transformed body angular velocity magnitude mean frequency mean                       |
| fbodygyroscopejerkmagnitudemean           | numeric   | fourier transformed body angular velocity jerk signal magnitude mean                          |
| fbodygyroscopejerkmagnitudenitudemeanfreq | numeric   | fourier transformed body angular velocity jerk signal magnitude mean frequency mean           |
| angletbodyaccelerationmeangravity         | numeric   | angle between time body linear acceleration and mean gravity mean                             |
| angletbodyaccelerationjerkmeangravitymean | numeric   | angle between time body linear acceleration jerk signal and mean gravity mean                 |
| angletbodygyroscopemeangravitymean        | numeric   | angle between time body angular velocity mean and mean gravity mean                           |
| angletbodygyroscopejerkmeangravitymean    | numeric   | angle between time body angular velocity jerk signal and mean gravity mean                    |
| anglexgravitymean                         | numeric   | angle between X axis gravity vectors mean                                                     |
| angleygravitymean                         | numeric   | angle between Y axis gravity vectors mean                                                     |
| anglezgravitymean                         | numeric   | angle between Y axis gravity vectors mean                                                     |
| tbodyaccelerationstdx                     | numeric   | time body linear acceleration in X axis mean of standard deviation                            |
| tbodyaccelerationstdy                     | numeric   | time body linear acceleration in Y axis mean of standard deviation                            |
| tbodyaccelerationstdz                     | numeric   | time body linear acceleration in Z axis mean of standard deviation                            |
| tgravityaccelerationstdx                  | numeric   | time gravity acceleration in X axis mean of standard deviation                                |
| tgravityaccelerationstdy                  | numeric   | time gravity acceleration in Y axis mean of standard deviation                                |
| tgravityaccelerationstdz                  | numeric   | time gravity acceleration in Z axis mean of standard deviation                                |
| tbodyaccelerationjerkstdx                 | numeric   | time body linear acceleration jerk signal in X axis mean of standard deviation                |
| tbodyaccelerationjerkstdy                 | numeric   | time body linear acceleration jerk signal in Y axis mean of standard deviation                |
| tbodyaccelerationjerkstdz                 | numeric   | time body linear acceleration jerk signal in Y axis mean of standard deviation                |
| tbodygyroscopestdx                        | numeric   | time body angular velocity in X axis mean of standard deviation                               |
| tbodygyroscopestdy                        | numeric   | time body angular velocity in Y axis mean of standard deviation                               |
| tbodygyroscopestdz                        | numeric   | time body angular velocity in Z axis mean of standard deviation                               |
| tbodygyroscopejerkstdx                    | numeric   | time body angular velocity jerk signal in X axis mean of standard deviation                   |
| tbodygyroscopejerkstdy                    | numeric   | time body angular velocity jerk signal in Y axis mean of standard deviation                   |
| tbodygyroscopejerkstdz                    | numeric   | time body angular velocity jerk signal in Z axis mean of standard deviation                   |
| tbodyaccelerationmagnitudestd             | numeric   | time body linear acceleration magnitude mean of standard deviation                            |
| tgravityaccelerationmagnitudestd          | numeric   | time gravity acceleration magnitude mean of standard deviation                                |
| tbodyaccelerationjerkmagnitudestd         | numeric   | time body linear acceleration jerk signal magnitude mean of standard deviation                |
| tbodygyroscopemagnitudenitudestd          | numeric   | time body angular velocity magnitude mean of standard deviation                               |
| tbodygyroscopejerkmagnitudestd            | numeric   | time body angular velocity jerk signal magnitude mean of standard deviation                   |
| fbodyaccelerationstdx                     | numeric   | fourier transformed body linear acceleration in X axis mean of standard deviation             |
| fbodyaccelerationstdy                     | numeric   | fourier transformed body linear acceleration in Y axis mean of standard deviation             |
| fbodyaccelerationstdz                     | numeric   | fourier transformed body linear acceleration in Z axis mean of standard deviation             |
| fbodyaccelerationjerkstdx                 | numeric   | fourier transformed body linear acceleration jerk signal in X axis mean of standard deviation |
| fbodyaccelerationjerkstdy                 | numeric   | fourier transformed body linear acceleration jerk signal in Y axis mean of standard deviation |
| fbodyaccelerationjerkstdz                 | numeric   | fourier transformed body linear acceleration jerk signal in Z axis mean of standard deviation |
| fbodygyroscopestdx                        | numeric   | fourier transformed body angular velocity in X axis mean of standard deviation                |
| fbodygyroscopestdy                        | numeric   | fourier transformed body angular velocity in Y axis mean of standard deviation                |
| fbodygyroscopestdz                        | numeric   | fourier transformed body angular velocity in Z axis mean of standard deviation                |
| fbodyaccelerationmagnitudestd             | numeric   | fourier transformed body linear acceleration magnitude mean of standard deviation             |
| fbodyaccelerationjerkmagnitudestd         | numeric   | fourier transformed body linear acceleration jerk signal magnitude mean of standard deviation |
| fbodygyroscopemagnitudestd                | numeric   | fourier transformed body angular magnitude mean of standard deviation                         |
| fbodygyroscopejerkmagnitudestd            | numeric   | fourier transformed body angular velocity jerk signal magnitude mean of standard deviation    |

