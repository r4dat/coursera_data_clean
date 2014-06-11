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

Categorical Features
=================
The presented dataset contains 2 categorical variables, a 'Subject' and 'Activity' performed for each sample. Within the dataframe these are the vectors 'subjID' and 'activity'.


The complete list of variables of each feature vector is available in 'features.txt' within the dataset.