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


Code Book or Data Dictionary for tidy set
=================
### Subject
Variable Name: *subjID* or *sid*  
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
**Calculated field, counts number of observations in each Subject ID/Activity Combination. E.g. 1/Walking occurred 52 times.** 

### Continuous Features
Variable Name: *mean_'base_name'*  
Type: Numeric  
1	  mean_tBodyAcc.mean.X   
2	  mean_tBodyAcc.mean.Y   
3	  mean_tBodyAcc.mean.Z   
4	  mean_tBodyAcc.std.X   
5	  mean_tBodyAcc.std.Y   
6	  mean_tBodyAcc.std.Z   
7	  mean_tBodyAcc.mad.X   
8	  mean_tBodyAcc.mad.Y   
9	  mean_tBodyAcc.mad.Z   
10	mean_tBodyAcc.max.X   
11	mean_tBodyAcc.max.Y   
12	mean_tBodyAcc.max.Z   
13	mean_tBodyAcc.min.X   
14	mean_tBodyAcc.min.Y   
15	mean_tBodyAcc.min.Z   
16	mean_tBodyAcc.sma   
17	mean_tBodyAcc.energy.X   
18	mean_tBodyAcc.energy.Y   
19	mean_tBodyAcc.energy.Z   
20	mean_tBodyAcc.iqr.X   
21	mean_tBodyAcc.iqr.Y   
22	mean_tBodyAcc.iqr.Z   
23	mean_tBodyAcc.entropy.X   
24	mean_tBodyAcc.entropy.Y   
25	mean_tBodyAcc.entropy.Z   
26	mean_tBodyAcc.arCoeff.X.1   
27	mean_tBodyAcc.arCoeff.X.2   
28	mean_tBodyAcc.arCoeff.X.3   
29	mean_tBodyAcc.arCoeff.X.4   
30	mean_tBodyAcc.arCoeff.Y.1   
31	mean_tBodyAcc.arCoeff.Y.2   
32	mean_tBodyAcc.arCoeff.Y.3   
33	mean_tBodyAcc.arCoeff.Y.4   
34	mean_tBodyAcc.arCoeff.Z.1   
35	mean_tBodyAcc.arCoeff.Z.2   
36	mean_tBodyAcc.arCoeff.Z.3   
37	mean_tBodyAcc.arCoeff.Z.4   
38	mean_tBodyAcc.correlation.X.Y   
39	mean_tBodyAcc.correlation.X.Z   
40	mean_tBodyAcc.correlation.Y.Z   
41	mean_tGravityAcc.mean.X   
42	mean_tGravityAcc.mean.Y   
43	mean_tGravityAcc.mean.Z   
44	mean_tGravityAcc.std.X   
45	mean_tGravityAcc.std.Y   
46	mean_tGravityAcc.std.Z   
47	mean_tGravityAcc.mad.X   
48	mean_tGravityAcc.mad.Y   
49	mean_tGravityAcc.mad.Z   
50	mean_tGravityAcc.max.X   
51	mean_tGravityAcc.max.Y   
52	mean_tGravityAcc.max.Z   
53	mean_tGravityAcc.min.X   
54	mean_tGravityAcc.min.Y   
55	mean_tGravityAcc.min.Z   
56	mean_tGravityAcc.sma   
57	mean_tGravityAcc.energy.X   
58	mean_tGravityAcc.energy.Y   
59	mean_tGravityAcc.energy.Z   
60	mean_tGravityAcc.iqr.X   
61	mean_tGravityAcc.iqr.Y   
62	mean_tGravityAcc.iqr.Z   
63	mean_tGravityAcc.entropy.X   
64	mean_tGravityAcc.entropy.Y   
65	mean_tGravityAcc.entropy.Z   
66	mean_tGravityAcc.arCoeff.X.1   
67	mean_tGravityAcc.arCoeff.X.2   
68	mean_tGravityAcc.arCoeff.X.3   
69	mean_tGravityAcc.arCoeff.X.4   
70	mean_tGravityAcc.arCoeff.Y.1   
71	mean_tGravityAcc.arCoeff.Y.2   
72	mean_tGravityAcc.arCoeff.Y.3   
73	mean_tGravityAcc.arCoeff.Y.4   
74	mean_tGravityAcc.arCoeff.Z.1   
75	mean_tGravityAcc.arCoeff.Z.2   
76	mean_tGravityAcc.arCoeff.Z.3   
77	mean_tGravityAcc.arCoeff.Z.4   
78	mean_tGravityAcc.correlation.X.Y   
79	mean_tGravityAcc.correlation.X.Z   
80	mean_tGravityAcc.correlation.Y.Z   
81	mean_tBodyAccJerk.mean.X   
82	mean_tBodyAccJerk.mean.Y   
83	mean_tBodyAccJerk.mean.Z   
84	mean_tBodyAccJerk.std.X   
85	mean_tBodyAccJerk.std.Y   
86	mean_tBodyAccJerk.std.Z   
87	mean_tBodyAccJerk.mad.X   
88	mean_tBodyAccJerk.mad.Y   
89	mean_tBodyAccJerk.mad.Z   
90	mean_tBodyAccJerk.max.X   
91	mean_tBodyAccJerk.max.Y   
92	mean_tBodyAccJerk.max.Z   
93	mean_tBodyAccJerk.min.X   
94	mean_tBodyAccJerk.min.Y   
95	mean_tBodyAccJerk.min.Z   
96	mean_tBodyAccJerk.sma   
97	mean_tBodyAccJerk.energy.X   
98	mean_tBodyAccJerk.energy.Y   
99	mean_tBodyAccJerk.energy.Z   
100	mean_tBodyAccJerk.iqr.X   
101	mean_tBodyAccJerk.iqr.Y   
102	mean_tBodyAccJerk.iqr.Z   
103	mean_tBodyAccJerk.entropy.X   
104	mean_tBodyAccJerk.entropy.Y   
105	mean_tBodyAccJerk.entropy.Z   
106	mean_tBodyAccJerk.arCoeff.X.1   
107	mean_tBodyAccJerk.arCoeff.X.2   
108	mean_tBodyAccJerk.arCoeff.X.3   
109	mean_tBodyAccJerk.arCoeff.X.4   
110	mean_tBodyAccJerk.arCoeff.Y.1   
111	mean_tBodyAccJerk.arCoeff.Y.2   
112	mean_tBodyAccJerk.arCoeff.Y.3   
113	mean_tBodyAccJerk.arCoeff.Y.4   
114	mean_tBodyAccJerk.arCoeff.Z.1   
115	mean_tBodyAccJerk.arCoeff.Z.2   
116	mean_tBodyAccJerk.arCoeff.Z.3   
117	mean_tBodyAccJerk.arCoeff.Z.4   
118	mean_tBodyAccJerk.correlation.X.Y   
119	mean_tBodyAccJerk.correlation.X.Z   
120	mean_tBodyAccJerk.correlation.Y.Z   
121	mean_tBodyGyro.mean.X   
122	mean_tBodyGyro.mean.Y   
123	mean_tBodyGyro.mean.Z   
124	mean_tBodyGyro.std.X   
125	mean_tBodyGyro.std.Y   
126	mean_tBodyGyro.std.Z   
127	mean_tBodyGyro.mad.X   
128	mean_tBodyGyro.mad.Y   
129	mean_tBodyGyro.mad.Z   
130	mean_tBodyGyro.max.X   
131	mean_tBodyGyro.max.Y   
132	mean_tBodyGyro.max.Z   
133	mean_tBodyGyro.min.X   
134	mean_tBodyGyro.min.Y   
135	mean_tBodyGyro.min.Z   
136	mean_tBodyGyro.sma   
137	mean_tBodyGyro.energy.X   
138	mean_tBodyGyro.energy.Y   
139	mean_tBodyGyro.energy.Z   
140	mean_tBodyGyro.iqr.X   
141	mean_tBodyGyro.iqr.Y   
142	mean_tBodyGyro.iqr.Z   
143	mean_tBodyGyro.entropy.X   
144	mean_tBodyGyro.entropy.Y   
145	mean_tBodyGyro.entropy.Z   
146	mean_tBodyGyro.arCoeff.X.1   
147	mean_tBodyGyro.arCoeff.X.2   
148	mean_tBodyGyro.arCoeff.X.3   
149	mean_tBodyGyro.arCoeff.X.4   
150	mean_tBodyGyro.arCoeff.Y.1   
151	mean_tBodyGyro.arCoeff.Y.2   
152	mean_tBodyGyro.arCoeff.Y.3   
153	mean_tBodyGyro.arCoeff.Y.4   
154	mean_tBodyGyro.arCoeff.Z.1   
155	mean_tBodyGyro.arCoeff.Z.2   
156	mean_tBodyGyro.arCoeff.Z.3   
157	mean_tBodyGyro.arCoeff.Z.4   
158	mean_tBodyGyro.correlation.X.Y   
159	mean_tBodyGyro.correlation.X.Z   
160	mean_tBodyGyro.correlation.Y.Z   
161	mean_tBodyGyroJerk.mean.X   
162	mean_tBodyGyroJerk.mean.Y   
163	mean_tBodyGyroJerk.mean.Z   
164	mean_tBodyGyroJerk.std.X   
165	mean_tBodyGyroJerk.std.Y   
166	mean_tBodyGyroJerk.std.Z   
167	mean_tBodyGyroJerk.mad.X   
168	mean_tBodyGyroJerk.mad.Y   
169	mean_tBodyGyroJerk.mad.Z   
170	mean_tBodyGyroJerk.max.X   
171	mean_tBodyGyroJerk.max.Y   
172	mean_tBodyGyroJerk.max.Z   
173	mean_tBodyGyroJerk.min.X   
174	mean_tBodyGyroJerk.min.Y   
175	mean_tBodyGyroJerk.min.Z   
176	mean_tBodyGyroJerk.sma   
177	mean_tBodyGyroJerk.energy.X   
178	mean_tBodyGyroJerk.energy.Y   
179	mean_tBodyGyroJerk.energy.Z   
180	mean_tBodyGyroJerk.iqr.X   
181	mean_tBodyGyroJerk.iqr.Y   
182	mean_tBodyGyroJerk.iqr.Z   
183	mean_tBodyGyroJerk.entropy.X   
184	mean_tBodyGyroJerk.entropy.Y   
185	mean_tBodyGyroJerk.entropy.Z   
186	mean_tBodyGyroJerk.arCoeff.X.1   
187	mean_tBodyGyroJerk.arCoeff.X.2   
188	mean_tBodyGyroJerk.arCoeff.X.3   
189	mean_tBodyGyroJerk.arCoeff.X.4   
190	mean_tBodyGyroJerk.arCoeff.Y.1   
191	mean_tBodyGyroJerk.arCoeff.Y.2   
192	mean_tBodyGyroJerk.arCoeff.Y.3   
193	mean_tBodyGyroJerk.arCoeff.Y.4   
194	mean_tBodyGyroJerk.arCoeff.Z.1   
195	mean_tBodyGyroJerk.arCoeff.Z.2   
196	mean_tBodyGyroJerk.arCoeff.Z.3   
197	mean_tBodyGyroJerk.arCoeff.Z.4   
198	mean_tBodyGyroJerk.correlation.X.Y   
199	mean_tBodyGyroJerk.correlation.X.Z   
200	mean_tBodyGyroJerk.correlation.Y.Z   
201	mean_tBodyAccMag.mean   
202	mean_tBodyAccMag.std   
203	mean_tBodyAccMag.mad   
204	mean_tBodyAccMag.max   
205	mean_tBodyAccMag.min   
206	mean_tBodyAccMag.sma   
207	mean_tBodyAccMag.energy   
208	mean_tBodyAccMag.iqr   
209	mean_tBodyAccMag.entropy   
210	mean_tBodyAccMag.arCoeff1   
211	mean_tBodyAccMag.arCoeff2   
212	mean_tBodyAccMag.arCoeff3   
213	mean_tBodyAccMag.arCoeff4   
214	mean_tGravityAccMag.mean   
215	mean_tGravityAccMag.std   
216	mean_tGravityAccMag.mad   
217	mean_tGravityAccMag.max   
218	mean_tGravityAccMag.min   
219	mean_tGravityAccMag.sma   
220	mean_tGravityAccMag.energy   
221	mean_tGravityAccMag.iqr   
222	mean_tGravityAccMag.entropy   
223	mean_tGravityAccMag.arCoeff1   
224	mean_tGravityAccMag.arCoeff2   
225	mean_tGravityAccMag.arCoeff3   
226	mean_tGravityAccMag.arCoeff4   
227	mean_tBodyAccJerkMag.mean   
228	mean_tBodyAccJerkMag.std   
229	mean_tBodyAccJerkMag.mad   
230	mean_tBodyAccJerkMag.max   
231	mean_tBodyAccJerkMag.min   
232	mean_tBodyAccJerkMag.sma   
233	mean_tBodyAccJerkMag.energy   
234	mean_tBodyAccJerkMag.iqr   
235	mean_tBodyAccJerkMag.entropy   
236	mean_tBodyAccJerkMag.arCoeff1   
237	mean_tBodyAccJerkMag.arCoeff2   
238	mean_tBodyAccJerkMag.arCoeff3   
239	mean_tBodyAccJerkMag.arCoeff4   
240	mean_tBodyGyroMag.mean   
241	mean_tBodyGyroMag.std   
242	mean_tBodyGyroMag.mad   
243	mean_tBodyGyroMag.max   
244	mean_tBodyGyroMag.min   
245	mean_tBodyGyroMag.sma   
246	mean_tBodyGyroMag.energy   
247	mean_tBodyGyroMag.iqr   
248	mean_tBodyGyroMag.entropy   
249	mean_tBodyGyroMag.arCoeff1   
250	mean_tBodyGyroMag.arCoeff2   
251	mean_tBodyGyroMag.arCoeff3   
252	mean_tBodyGyroMag.arCoeff4   
253	mean_tBodyGyroJerkMag.mean   
254	mean_tBodyGyroJerkMag.std   
255	mean_tBodyGyroJerkMag.mad   
256	mean_tBodyGyroJerkMag.max   
257	mean_tBodyGyroJerkMag.min   
258	mean_tBodyGyroJerkMag.sma   
259	mean_tBodyGyroJerkMag.energy   
260	mean_tBodyGyroJerkMag.iqr   
261	mean_tBodyGyroJerkMag.entropy   
262	mean_tBodyGyroJerkMag.arCoeff1   
263	mean_tBodyGyroJerkMag.arCoeff2   
264	mean_tBodyGyroJerkMag.arCoeff3   
265	mean_tBodyGyroJerkMag.arCoeff4   
266	mean_fBodyAcc.mean.X   
267	mean_fBodyAcc.mean.Y   
268	mean_fBodyAcc.mean.Z   
269	mean_fBodyAcc.std.X   
270	mean_fBodyAcc.std.Y   
271	mean_fBodyAcc.std.Z   
272	mean_fBodyAcc.mad.X   
273	mean_fBodyAcc.mad.Y   
274	mean_fBodyAcc.mad.Z   
275	mean_fBodyAcc.max.X   
276	mean_fBodyAcc.max.Y   
277	mean_fBodyAcc.max.Z   
278	mean_fBodyAcc.min.X   
279	mean_fBodyAcc.min.Y   
280	mean_fBodyAcc.min.Z   
281	mean_fBodyAcc.sma   
282	mean_fBodyAcc.energy.X   
283	mean_fBodyAcc.energy.Y   
284	mean_fBodyAcc.energy.Z   
285	mean_fBodyAcc.iqr.X   
286	mean_fBodyAcc.iqr.Y   
287	mean_fBodyAcc.iqr.Z   
288	mean_fBodyAcc.entropy.X   
289	mean_fBodyAcc.entropy.Y   
290	mean_fBodyAcc.entropy.Z   
291	mean_fBodyAcc.maxInds.X   
292	mean_fBodyAcc.maxInds.Y   
293	mean_fBodyAcc.maxInds.Z   
294	mean_fBodyAcc.meanFreq.X   
295	mean_fBodyAcc.meanFreq.Y   
296	mean_fBodyAcc.meanFreq.Z   
297	mean_fBodyAcc.skewness.X   
298	mean_fBodyAcc.kurtosis.X   
299	mean_fBodyAcc.skewness.Y   
300	mean_fBodyAcc.kurtosis.Y   
301	mean_fBodyAcc.skewness.Z   
302	mean_fBodyAcc.kurtosis.Z   
303	mean_fBodyAcc.bandsEnergy.1.8   
304	mean_fBodyAcc.bandsEnergy.9.16   
305	mean_fBodyAcc.bandsEnergy.17.24   
306	mean_fBodyAcc.bandsEnergy.25.32   
307	mean_fBodyAcc.bandsEnergy.33.40   
308	mean_fBodyAcc.bandsEnergy.41.48   
309	mean_fBodyAcc.bandsEnergy.49.56   
310	mean_fBodyAcc.bandsEnergy.57.64   
311	mean_fBodyAcc.bandsEnergy.1.16   
312	mean_fBodyAcc.bandsEnergy.17.32   
313	mean_fBodyAcc.bandsEnergy.33.48   
314	mean_fBodyAcc.bandsEnergy.49.64   
315	mean_fBodyAcc.bandsEnergy.1.24   
316	mean_fBodyAcc.bandsEnergy.25.48   
317	mean_fBodyAcc.bandsEnergy.1.8   
318	mean_fBodyAcc.bandsEnergy.9.16   
319	mean_fBodyAcc.bandsEnergy.17.24   
320	mean_fBodyAcc.bandsEnergy.25.32   
321	mean_fBodyAcc.bandsEnergy.33.40   
322	mean_fBodyAcc.bandsEnergy.41.48   
323	mean_fBodyAcc.bandsEnergy.49.56   
324	mean_fBodyAcc.bandsEnergy.57.64   
325	mean_fBodyAcc.bandsEnergy.1.16   
326	mean_fBodyAcc.bandsEnergy.17.32   
327	mean_fBodyAcc.bandsEnergy.33.48   
328	mean_fBodyAcc.bandsEnergy.49.64   
329	mean_fBodyAcc.bandsEnergy.1.24   
330	mean_fBodyAcc.bandsEnergy.25.48   
331	mean_fBodyAcc.bandsEnergy.1.8   
332	mean_fBodyAcc.bandsEnergy.9.16   
333	mean_fBodyAcc.bandsEnergy.17.24   
334	mean_fBodyAcc.bandsEnergy.25.32   
335	mean_fBodyAcc.bandsEnergy.33.40   
336	mean_fBodyAcc.bandsEnergy.41.48   
337	mean_fBodyAcc.bandsEnergy.49.56   
338	mean_fBodyAcc.bandsEnergy.57.64   
339	mean_fBodyAcc.bandsEnergy.1.16   
340	mean_fBodyAcc.bandsEnergy.17.32   
341	mean_fBodyAcc.bandsEnergy.33.48   
342	mean_fBodyAcc.bandsEnergy.49.64   
343	mean_fBodyAcc.bandsEnergy.1.24   
344	mean_fBodyAcc.bandsEnergy.25.48   
345	mean_fBodyAccJerk.mean.X   
346	mean_fBodyAccJerk.mean.Y   
347	mean_fBodyAccJerk.mean.Z   
348	mean_fBodyAccJerk.std.X   
349	mean_fBodyAccJerk.std.Y   
350	mean_fBodyAccJerk.std.Z   
351	mean_fBodyAccJerk.mad.X   
352	mean_fBodyAccJerk.mad.Y   
353	mean_fBodyAccJerk.mad.Z   
354	mean_fBodyAccJerk.max.X   
355	mean_fBodyAccJerk.max.Y   
356	mean_fBodyAccJerk.max.Z   
357	mean_fBodyAccJerk.min.X   
358	mean_fBodyAccJerk.min.Y   
359	mean_fBodyAccJerk.min.Z   
360	mean_fBodyAccJerk.sma   
361	mean_fBodyAccJerk.energy.X   
362	mean_fBodyAccJerk.energy.Y   
363	mean_fBodyAccJerk.energy.Z   
364	mean_fBodyAccJerk.iqr.X   
365	mean_fBodyAccJerk.iqr.Y   
366	mean_fBodyAccJerk.iqr.Z   
367	mean_fBodyAccJerk.entropy.X   
368	mean_fBodyAccJerk.entropy.Y   
369	mean_fBodyAccJerk.entropy.Z   
370	mean_fBodyAccJerk.maxInds.X   
371	mean_fBodyAccJerk.maxInds.Y   
372	mean_fBodyAccJerk.maxInds.Z   
373	mean_fBodyAccJerk.meanFreq.X   
374	mean_fBodyAccJerk.meanFreq.Y   
375	mean_fBodyAccJerk.meanFreq.Z   
376	mean_fBodyAccJerk.skewness.X   
377	mean_fBodyAccJerk.kurtosis.X   
378	mean_fBodyAccJerk.skewness.Y   
379	mean_fBodyAccJerk.kurtosis.Y   
380	mean_fBodyAccJerk.skewness.Z   
381	mean_fBodyAccJerk.kurtosis.Z   
382	mean_fBodyAccJerk.bandsEnergy.1.8   
383	mean_fBodyAccJerk.bandsEnergy.9.16   
384	mean_fBodyAccJerk.bandsEnergy.17.24   
385	mean_fBodyAccJerk.bandsEnergy.25.32   
386	mean_fBodyAccJerk.bandsEnergy.33.40   
387	mean_fBodyAccJerk.bandsEnergy.41.48   
388	mean_fBodyAccJerk.bandsEnergy.49.56   
389	mean_fBodyAccJerk.bandsEnergy.57.64   
390	mean_fBodyAccJerk.bandsEnergy.1.16   
391	mean_fBodyAccJerk.bandsEnergy.17.32   
392	mean_fBodyAccJerk.bandsEnergy.33.48   
393	mean_fBodyAccJerk.bandsEnergy.49.64   
394	mean_fBodyAccJerk.bandsEnergy.1.24   
395	mean_fBodyAccJerk.bandsEnergy.25.48   
396	mean_fBodyAccJerk.bandsEnergy.1.8   
397	mean_fBodyAccJerk.bandsEnergy.9.16   
398	mean_fBodyAccJerk.bandsEnergy.17.24   
399	mean_fBodyAccJerk.bandsEnergy.25.32   
400	mean_fBodyAccJerk.bandsEnergy.33.40   
401	mean_fBodyAccJerk.bandsEnergy.41.48   
402	mean_fBodyAccJerk.bandsEnergy.49.56   
403	mean_fBodyAccJerk.bandsEnergy.57.64   
404	mean_fBodyAccJerk.bandsEnergy.1.16   
405	mean_fBodyAccJerk.bandsEnergy.17.32   
406	mean_fBodyAccJerk.bandsEnergy.33.48   
407	mean_fBodyAccJerk.bandsEnergy.49.64   
408	mean_fBodyAccJerk.bandsEnergy.1.24   
409	mean_fBodyAccJerk.bandsEnergy.25.48   
410	mean_fBodyAccJerk.bandsEnergy.1.8   
411	mean_fBodyAccJerk.bandsEnergy.9.16   
412	mean_fBodyAccJerk.bandsEnergy.17.24   
413	mean_fBodyAccJerk.bandsEnergy.25.32   
414	mean_fBodyAccJerk.bandsEnergy.33.40   
415	mean_fBodyAccJerk.bandsEnergy.41.48   
416	mean_fBodyAccJerk.bandsEnergy.49.56   
417	mean_fBodyAccJerk.bandsEnergy.57.64   
418	mean_fBodyAccJerk.bandsEnergy.1.16   
419	mean_fBodyAccJerk.bandsEnergy.17.32   
420	mean_fBodyAccJerk.bandsEnergy.33.48   
421	mean_fBodyAccJerk.bandsEnergy.49.64   
422	mean_fBodyAccJerk.bandsEnergy.1.24   
423	mean_fBodyAccJerk.bandsEnergy.25.48   
424	mean_fBodyGyro.mean.X   
425	mean_fBodyGyro.mean.Y   
426	mean_fBodyGyro.mean.Z   
427	mean_fBodyGyro.std.X   
428	mean_fBodyGyro.std.Y   
429	mean_fBodyGyro.std.Z   
430	mean_fBodyGyro.mad.X   
431	mean_fBodyGyro.mad.Y   
432	mean_fBodyGyro.mad.Z   
433	mean_fBodyGyro.max.X   
434	mean_fBodyGyro.max.Y   
435	mean_fBodyGyro.max.Z   
436	mean_fBodyGyro.min.X   
437	mean_fBodyGyro.min.Y   
438	mean_fBodyGyro.min.Z   
439	mean_fBodyGyro.sma   
440	mean_fBodyGyro.energy.X   
441	mean_fBodyGyro.energy.Y   
442	mean_fBodyGyro.energy.Z   
443	mean_fBodyGyro.iqr.X   
444	mean_fBodyGyro.iqr.Y   
445	mean_fBodyGyro.iqr.Z   
446	mean_fBodyGyro.entropy.X   
447	mean_fBodyGyro.entropy.Y   
448	mean_fBodyGyro.entropy.Z   
449	mean_fBodyGyro.maxInds.X   
450	mean_fBodyGyro.maxInds.Y   
451	mean_fBodyGyro.maxInds.Z   
452	mean_fBodyGyro.meanFreq.X   
453	mean_fBodyGyro.meanFreq.Y   
454	mean_fBodyGyro.meanFreq.Z   
455	mean_fBodyGyro.skewness.X   
456	mean_fBodyGyro.kurtosis.X   
457	mean_fBodyGyro.skewness.Y   
458	mean_fBodyGyro.kurtosis.Y   
459	mean_fBodyGyro.skewness.Z   
460	mean_fBodyGyro.kurtosis.Z   
461	mean_fBodyGyro.bandsEnergy.1.8   
462	mean_fBodyGyro.bandsEnergy.9.16   
463	mean_fBodyGyro.bandsEnergy.17.24   
464	mean_fBodyGyro.bandsEnergy.25.32   
465	mean_fBodyGyro.bandsEnergy.33.40   
466	mean_fBodyGyro.bandsEnergy.41.48   
467	mean_fBodyGyro.bandsEnergy.49.56   
468	mean_fBodyGyro.bandsEnergy.57.64   
469	mean_fBodyGyro.bandsEnergy.1.16   
470	mean_fBodyGyro.bandsEnergy.17.32   
471	mean_fBodyGyro.bandsEnergy.33.48   
472	mean_fBodyGyro.bandsEnergy.49.64   
473	mean_fBodyGyro.bandsEnergy.1.24   
474	mean_fBodyGyro.bandsEnergy.25.48   
475	mean_fBodyGyro.bandsEnergy.1.8   
476	mean_fBodyGyro.bandsEnergy.9.16   
477	mean_fBodyGyro.bandsEnergy.17.24   
478	mean_fBodyGyro.bandsEnergy.25.32   
479	mean_fBodyGyro.bandsEnergy.33.40   
480	mean_fBodyGyro.bandsEnergy.41.48   
481	mean_fBodyGyro.bandsEnergy.49.56   
482	mean_fBodyGyro.bandsEnergy.57.64   
483	mean_fBodyGyro.bandsEnergy.1.16   
484	mean_fBodyGyro.bandsEnergy.17.32   
485	mean_fBodyGyro.bandsEnergy.33.48   
486	mean_fBodyGyro.bandsEnergy.49.64   
487	mean_fBodyGyro.bandsEnergy.1.24   
488	mean_fBodyGyro.bandsEnergy.25.48   
489	mean_fBodyGyro.bandsEnergy.1.8   
490	mean_fBodyGyro.bandsEnergy.9.16   
491	mean_fBodyGyro.bandsEnergy.17.24   
492	mean_fBodyGyro.bandsEnergy.25.32   
493	mean_fBodyGyro.bandsEnergy.33.40   
494	mean_fBodyGyro.bandsEnergy.41.48   
495	mean_fBodyGyro.bandsEnergy.49.56   
496	mean_fBodyGyro.bandsEnergy.57.64   
497	mean_fBodyGyro.bandsEnergy.1.16   
498	mean_fBodyGyro.bandsEnergy.17.32   
499	mean_fBodyGyro.bandsEnergy.33.48   
500	mean_fBodyGyro.bandsEnergy.49.64   
501	mean_fBodyGyro.bandsEnergy.1.24   
502	mean_fBodyGyro.bandsEnergy.25.48   
503	mean_fBodyAccMag.mean   
504	mean_fBodyAccMag.std   
505	mean_fBodyAccMag.mad   
506	mean_fBodyAccMag.max   
507	mean_fBodyAccMag.min   
508	mean_fBodyAccMag.sma   
509	mean_fBodyAccMag.energy   
510	mean_fBodyAccMag.iqr   
511	mean_fBodyAccMag.entropy   
512	mean_fBodyAccMag.maxInds   
513	mean_fBodyAccMag.meanFreq   
514	mean_fBodyAccMag.skewness   
515	mean_fBodyAccMag.kurtosis   
516	mean_fBodyBodyAccJerkMag.mean   
517	mean_fBodyBodyAccJerkMag.std   
518	mean_fBodyBodyAccJerkMag.mad   
519	mean_fBodyBodyAccJerkMag.max   
520	mean_fBodyBodyAccJerkMag.min   
521	mean_fBodyBodyAccJerkMag.sma   
522	mean_fBodyBodyAccJerkMag.energy   
523	mean_fBodyBodyAccJerkMag.iqr   
524	mean_fBodyBodyAccJerkMag.entropy   
525	mean_fBodyBodyAccJerkMag.maxInds   
526	mean_fBodyBodyAccJerkMag.meanFreq   
527	mean_fBodyBodyAccJerkMag.skewness   
528	mean_fBodyBodyAccJerkMag.kurtosis   
529	mean_fBodyBodyGyroMag.mean   
530	mean_fBodyBodyGyroMag.std   
531	mean_fBodyBodyGyroMag.mad   
532	mean_fBodyBodyGyroMag.max   
533	mean_fBodyBodyGyroMag.min   
534	mean_fBodyBodyGyroMag.sma   
535	mean_fBodyBodyGyroMag.energy   
536	mean_fBodyBodyGyroMag.iqr   
537	mean_fBodyBodyGyroMag.entropy   
538	mean_fBodyBodyGyroMag.maxInds   
539	mean_fBodyBodyGyroMag.meanFreq   
540	mean_fBodyBodyGyroMag.skewness   
541	mean_fBodyBodyGyroMag.kurtosis   
542	mean_fBodyBodyGyroJerkMag.mean   
543	mean_fBodyBodyGyroJerkMag.std   
544	mean_fBodyBodyGyroJerkMag.mad   
545	mean_fBodyBodyGyroJerkMag.max   
546	mean_fBodyBodyGyroJerkMag.min   
547	mean_fBodyBodyGyroJerkMag.sma   
548	mean_fBodyBodyGyroJerkMag.energy   
549	mean_fBodyBodyGyroJerkMag.iqr   
550	mean_fBodyBodyGyroJerkMag.entropy   
551	mean_fBodyBodyGyroJerkMag.maxInds   
552	mean_fBodyBodyGyroJerkMag.meanFreq   
553	mean_fBodyBodyGyroJerkMag.skewness   
554	mean_fBodyBodyGyroJerkMag.kurtosis   
555	mean_angletBodyAccMean.gravity   
556	mean_angletBodyAccJerkMean.gravityMean   
557	mean_angletBodyGyroMean.gravityMean   
558	mean_angletBodyGyroJerkMean.gravityMean   
559	mean_angleX.gravityMean   
560	mean_angleY.gravityMean   
561	mean_angleZ.gravityMean   