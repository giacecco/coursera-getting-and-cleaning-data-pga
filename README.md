==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.1
==================================================================
By Gianfranco Cecconi, derived from version 1.0 by Jorge L.
Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universita' degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The original work is published on the website of UC Irvine's
Center for Machine Learning and Intelligent Systems:
https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' in the original data distribution for more details.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'CodeBook.md'

- 'har_averages.txt': a tidy, merged version of the files listed below from the original distribution, including only the average values of the mean and standard deviation for each measurement, grouped for each activity and each subject. Appropriate descriptive variable names are used to describe the columns in the data, instead of the original feature codes. Descriptive activity names also replace the numerical equivalent in the original data.

    - 'features.txt': List of all features.

    - 'activity_labels.txt': Links the class labels with their activity name.

    - 'train/X_train.txt': Training set.

    - 'train/y_train.txt': Training labels.

    - 'test/X_test.txt': Test set.

    - 'test/y_test.txt': Test labels.

    - 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

The script
==========

The R code to generate the files from the original distribution is also included: 'run_analysis.R'. The code is fully commented to describe its workings. It expects the original data distribution to be available in the 'UCI-HAR-Dataset' folder.

Notes:
======
- Features are normalized and bounded within [-1,1].

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1]

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
