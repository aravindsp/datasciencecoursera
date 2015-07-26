# datasciencecoursera

#Getting and Cleaning Data Course Project
===========================================

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis.

##Info Regarding Experiment
==========================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, 
where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec 
and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth 
low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

##Source Data Files
==========================
* 'features_info.txt': Shows information about the variables used on the feature vector.

* 'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

##Processing Steps
==========================

* Step 1 : Read required Files

			Read training and test files along with subject and activity info.

* Step 2 : Assigning appropriate Column Names

			Assign column names to the data files.

* Step 3 : Extracts only the measurements on the mean and standard deviation for each measurement.

			Using grep select only the mean() and std() measures

* Step 4 : Merges the training and the test sets to create one data set

			Merge the training and test data sets using cbind and rbind.

* Step 5 : Create Tidy Data

			Create and write tidy data set using reshare functions.
			Tidy data set contain 180 rows with  3 ID values and 66 measures.





