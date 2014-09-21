#Code book

##Contents
* Transformations
* The raw data
* The tidy data
* References

## Transformations


The run_analysis.R script transforms the raw [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) [1] (see below at the raw data) into a tidy dataset.

1. It loads all raw datasets below and merges the training and the test sets to create one data set. ![sets](https://coursera-forum-screenshots.s3.amazonaws.com/ab/a2776024af11e4a69d5576f8bc8459/Slide2.png )Overview of the raw data sets [2].
2. Extracts only the measurements on the mean and standard deviation for each measurement.
The feature names are loaded from "features.txt". Specifically it searches for features containing mean() and std(), so features with meanFreq() will be ignored.

3. Uses descriptive activity names to name the activities in the data set. These are loaded from "activity_labels.txt"

4. Appropriately labels the data set with descriptive variable names. The subject number is called subject, the activities are called Activity. Special characters in the feature names like dashes, curly brackets and commas are removed, so that the tidy dataset can be exported.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Because the new features are averages now, they have a prefix "Avg".

## The raw data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

####For each record it is provided:


- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

####The dataset includes the following files:


- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

####Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

##The tidy data

The tidy dataset is stored in tidy.txt, created by the run_analysis.R script, which can be read into R with

`data <- read.csv("tidy.txt", header = TRUE)`

This is a data set with the average of each variable for each activity and each subject of the raw data. It contains 180 observations (30 subjects times the 6 different activities) and 68 variables (the Activity, Subject, and 66 Acceleromter/Gyro Features).


Each of the rows contains:
####Activity

The activity can be one of these activities:

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

####Subject

An integer [1-30], indicating the subject.

####Features

All these 66 features

* AvgtBodyAccMeanX
* AvgtBodyAccMeanY
* AvgtBodyAccMeanZ
* AvgtBodyAccStdX
* AvgtBodyAccStdY
* AvgtBodyAccStdZ
* AvgtGravityAccMeanX
* AvgtGravityAccMeanY
* AvgtGravityAccMeanZ
* AvgtGravityAccStdX
* AvgtGravityAccStdY
* AvgtGravityAccStdZ
* AvgtBodyAccJerkMeanX
* AvgtBodyAccJerkMeanY
* AvgtBodyAccJerkMeanZ
* AvgtBodyAccJerkStdX
* AvgtBodyAccJerkStdY
* AvgtBodyAccJerkStdZ
* AvgtBodyGyroMeanX
* AvgtBodyGyroMeanY
* AvgtBodyGyroMeanZ
* AvgtBodyGyroStdX
* AvgtBodyGyroStdY
* AvgtBodyGyroStdZ
* AvgtBodyGyroJerkMeanX
* AvgtBodyGyroJerkMeanY
* AvgtBodyGyroJerkMeanZ
* AvgtBodyGyroJerkStdX
* AvgtBodyGyroJerkStdY
* AvgtBodyGyroJerkStdZ
* AvgtBodyAccMagMean
* AvgtBodyAccMagStd
* AvgtGravityAccMagMean
* AvgtGravityAccMagStd
* AvgtBodyAccJerkMagMean
* AvgtBodyAccJerkMagStd
* AvgtBodyGyroMagMean
* AvgtBodyGyroMagStd
* AvgtBodyGyroJerkMagMean
* AvgtBodyGyroJerkMagStd
* AvgfBodyAccMeanX
* AvgfBodyAccMeanY
* AvgfBodyAccMeanZ
* AvgfBodyAccStdX
* AvgfBodyAccStdY
* AvgfBodyAccStdZ
* AvgfBodyAccJerkMeanX
* AvgfBodyAccJerkMeanY
* AvgfBodyAccJerkMeanZ
* AvgfBodyAccJerkStdX
* AvgfBodyAccJerkStdY
* AvgfBodyAccJerkStdZ
* AvgfBodyGyroMeanX
* AvgfBodyGyroMeanY
* AvgfBodyGyroMeanZ
* AvgfBodyGyroStdX
* AvgfBodyGyroStdY
* AvgfBodyGyroStdZ
* AvgfBodyAccMagMean
* AvgfBodyAccMagStd
* AvgfBodyAccJerkMagMean
* AvgfBodyAccJerkMagStd
* AvgfBodyGyroMagMean
* AvgfBodyGyroMagStd
* AvgfBodyGyroJerkMagMean
* AvgfBodyGyroJerkMagStd

The features are unitless, beacuse they already have been normalized and bounded within [-1,1] in the raw data.

The prefix Avg of the features indicates that it is the average of each variable for each activity and each subject of the raw data.  

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerkXYZ and tBodyGyroJerkXYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAccXYZ, fBodyAccJerkXYZ, fBodyGyroXYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


The set of variables that were estimated from these signals are: 

* Mean: Mean value
* Std: Standard deviation



## References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

