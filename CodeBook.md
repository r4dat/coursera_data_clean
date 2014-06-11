Design of *Human Activity Recognition Using Smartphones*
==============
The raw data for this project has been obtained from the archives of University of California Irvine's Machine Learning Repository.
Information of dataset as described on the data set's website(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) is as follows

>Abstract:
>Human Activity Recognition database built from the recordings of 30 subjects performing activities of >daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
>
>Detail:
>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 >years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, >STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded >accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at >a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The >obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was >selected for generating the training data and 30% the test data. 
>
>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and >then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The >sensor acceleration signal, which has gravitational and body motion components, was separated using a >Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to >have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From >each window, a vector of features was obtained by calculating variables from the time and frequency >domain.

Underlying Source:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
Smartlab - Non Linear Complex Systems Laboratory 
DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy. 
activityrecognition '@' smartlab.ws 
www.smartlab.ws 

Citation:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Data may be obtained from either the above referenced repository, or (as of June 10th, 2014) the Coursera mirror at "https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip". 

Data Location
=================
The data extracts into the directory 'UCI HAR Dataset'. Data comes pre-split into training and test intervals as outlined below. Files will be referenced using POSIX style directory referencing, e.g. ./features.txt is shorthand for /UCI HAR Dataset/features.txt and so on.

Continuous features location: ./features.txt A space delimited list of features with feature id and feature name in each row corresponding to one of the 561 measurement based features as described in the abstract.

Activities location: ./activity_labels.txt A space delimited list of activities with activity id and activity label in each row corresponding to each of the 6 'Activity' which the 'Subject' is performing.

Raw data Training data set location: ./train/X_train.txt Test data set location: ./test/X_test.txt

A space delimited data file, which comprises of 561 measurement based features as described above as columns, and each row corresponds to a unique combination of a particular 'Subject' performing a particular 'Activity', both 'Subject' and 'Activity' belonging to the set of possible values as defined above.

Each row of the raw data is mapped to a unique combination of the two categorical features Activity and Subject. The data in raw data is linked to the Subject and Activity metadata using the following files:
Training data set subject id for each row, location: ./train/subject_train.txt Test data set subject id for each row, location: ./test/subject_test.txt

Training data set activity id for each row, location: ./train/y_train.txt Test data set activity id for each row, location: ./test/y_test.txt

*In the 'tidy' set, activity identifiers have been switched to their corresponding text strings for human readability.*


Categorical Features
=================
The raw dataset contains a Subject ID in the 'subject_   .txt' file, the 'Activity' identifier in the 'y_   .txt' file, and the features in the 'X_   .txt' file.
The presented 'tidy' dataset contains 2 categorical variables, a 'Subject' and 'Activity' performed for each sample.

Subject: Column name 'subjID', an integer identifier ranging from 1 to 30. R type numeric.

Activity: Column name 'activity' a text description (based on supplied transformation e.g. 1: Walking) of the activity being performed while data was being captured. R type: character.

Continuous Features
=================
The complete listing of continuous variables may be found in the 'features.txt' file within the dataset, and a complete description of raw feature capture and transformations can be found in 'features_info.txt'.

For the purpose of the 'tidy' dataset, we have extracted all features pertaining to the mean and standard deviation, as denoted by 'mean' and 'std' in the feature labels. These features have further been stripped of special characters such as ',' and '(' in order to improve readability and processing. The final set may be found below and comprises 88 extracted variables.

The extracted features were then split by Subject ID and Activity type from which the mean was calculated and the subset sample size was counted and returned.

Data Analysis Overview
=================
1. Read the raw training, test, subject, and activity files. Combine subject, activity, and features into coherent form.
2. Process feature labels and activity identifier for usability/readability.
3. Combine training and test sets. Extract features pertaining to mean and standard deviation as returned by a case-insensitive search for 'mean' and 'std'.
4. Split by Subject ID and Activity, calculate the mean of each extracted feature and and return the subset sample size.
5. Reform data into row-oriented structure with 1 row per subject-id-variable.
6. Return tidy data.


Variable Code Book or Data Dictionary
=================