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

The extracted features were then split by Subject ID and Activity type from which the mean was calculated and the subset sample size was counted (*freq*) and returned.

Data Analysis Overview
=================
1. Read the raw training, test, subject, and activity files. Combine subject, activity, and features into coherent form.
2. Process feature labels and activity identifier for usability/readability.
3. Combine training and test sets. Extract features pertaining to mean and standard deviation as returned by a case-insensitive search for 'mean' and 'std'.
4. Split by Subject ID and Activity, calculate the mean of each extracted feature and and return the subset sample size.
5. Reform data into row-oriented structure with 1 row per subject-id-variable.
6. Return tidy data.


Code Book or Data Dictionary for tidy set
=================
### Subject
Variable Name: *subjID*  
Type: Numeric  
Range: Discrete, 1-30 inclusive.  


### Activity
Variable Name: *activity*  
Type: Character  
Values:  
WALKING  
WALKIN_UPSTAIRS  
WALKING_DOWNSTAIRS  
SITTING  
STANDING  
LAYING  

### Frequency
Variable Name: *freq*  
Type: Numeric  
Range: Discrete, 0-inf non-inclusive [max in set 95]  
Note: Frequency was included to aid in future analysis - e.g. weighting to create grand mean.
**Calculated field, counts number of observations in each Subject ID/Activity Combination. E.g. 1/Walking occurred 52 times.**  


### Continuous Features
Variable Name: *mean_'base_name'*  
**Mean of variable by Subject/ID combination. E.g 1/Walking 'mean_tBodyAcc.mean.X' is the mean of the 52 observations from subject 1, activity walking of the variable 'tBodyAcc.mean.X'**  *This naming convention is followed to make abundantly clear this is a summarization, not the raw data itself.*
Type: Numeric  
 1  mean_tBodyAcc.mean.X   
 2	mean_tBodyAcc.mean.Y   
 3	mean_tBodyAcc.mean.Z   
 4	mean_tBodyAcc.std.X   
 5	mean_tBodyAcc.std.Y   
 6	mean_tBodyAcc.std.Z   
 7	mean_tGravityAcc.mean.X   
 8	mean_tGravityAcc.mean.Y   
 9	mean_tGravityAcc.mean.Z   
10	mean_tGravityAcc.std.X   
11	mean_tGravityAcc.std.Y   
12	mean_tGravityAcc.std.Z   
13	mean_tBodyAccJerk.mean.X   
14	mean_tBodyAccJerk.mean.Y   
15	mean_tBodyAccJerk.mean.Z   
16	mean_tBodyAccJerk.std.X   
17	mean_tBodyAccJerk.std.Y   
18	mean_tBodyAccJerk.std.Z   
19	mean_tBodyGyro.mean.X   
20	mean_tBodyGyro.mean.Y   
21	mean_tBodyGyro.mean.Z   
22	mean_tBodyGyro.std.X   
23	mean_tBodyGyro.std.Y   
24	mean_tBodyGyro.std.Z   
25	mean_tBodyGyroJerk.mean.X   
26	mean_tBodyGyroJerk.mean.Y   
27	mean_tBodyGyroJerk.mean.Z   
28	mean_tBodyGyroJerk.std.X   
29	mean_tBodyGyroJerk.std.Y   
30	mean_tBodyGyroJerk.std.Z   
31	mean_tBodyAccMag.mean   
32	mean_tBodyAccMag.std   
33	mean_tGravityAccMag.mean   
34	mean_tGravityAccMag.std   
35	mean_tBodyAccJerkMag.mean   
36	mean_tBodyAccJerkMag.std   
37	mean_tBodyGyroMag.mean   
38	mean_tBodyGyroMag.std   
39	mean_tBodyGyroJerkMag.mean   
40	mean_tBodyGyroJerkMag.std   
41	mean_fBodyAcc.mean.X   
42	mean_fBodyAcc.mean.Y   
43	mean_fBodyAcc.mean.Z   
44	mean_fBodyAcc.std.X   
45	mean_fBodyAcc.std.Y   
46	mean_fBodyAcc.std.Z   
47	mean_fBodyAcc.meanFreq.X   
48	mean_fBodyAcc.meanFreq.Y   
49	mean_fBodyAcc.meanFreq.Z   
50	mean_fBodyAccJerk.mean.X   
51	mean_fBodyAccJerk.mean.Y   
52	mean_fBodyAccJerk.mean.Z   
53	mean_fBodyAccJerk.std.X   
54	mean_fBodyAccJerk.std.Y   
55	mean_fBodyAccJerk.std.Z   
56	mean_fBodyAccJerk.meanFreq.X   
57	mean_fBodyAccJerk.meanFreq.Y   
58	mean_fBodyAccJerk.meanFreq.Z   
59	mean_fBodyGyro.mean.X   
60	mean_fBodyGyro.mean.Y   
61	mean_fBodyGyro.mean.Z   
62	mean_fBodyGyro.std.X   
63	mean_fBodyGyro.std.Y   
64	mean_fBodyGyro.std.Z   
65	mean_fBodyGyro.meanFreq.X   
66	mean_fBodyGyro.meanFreq.Y   
67	mean_fBodyGyro.meanFreq.Z   
68	mean_fBodyAccMag.mean   
69	mean_fBodyAccMag.std   
70	mean_fBodyAccMag.meanFreq   
71	mean_fBodyBodyAccJerkMag.mean   
72	mean_fBodyBodyAccJerkMag.std   
73	mean_fBodyBodyAccJerkMag.meanFreq   
74	mean_fBodyBodyGyroMag.mean   
75	mean_fBodyBodyGyroMag.std   
76	mean_fBodyBodyGyroMag.meanFreq   
77	mean_fBodyBodyGyroJerkMag.mean   
78	mean_fBodyBodyGyroJerkMag.std   
79	mean_fBodyBodyGyroJerkMag.meanFreq   
80	mean_angletBodyAccMean.gravity   
81	mean_angletBodyAccJerkMean.gravityMean   
82	mean_angletBodyGyroMean.gravityMean   
83	mean_angletBodyGyroJerkMean.gravityMean   
84	mean_angleX.gravityMean   
85	mean_angleY.gravityMean   