Introduction
The script run_analysis.Rperforms the 5 steps described in the course project's definition.
	•	First, all the similar data is merged using the rbind() function. 
	•	Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.
	•	As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
	•	A new dataset is generated with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called averages_data.txt, and uploaded to Gettingandcleaning data repository.

Variables
	•	dataX, dataY and subject_data merge the previous datasets to further analysis.
	•	A similar approach is taken with activity names through the activities variable.
	•	trainX, trainY, testX, testY, subject_train and subject_test contain the data from the downloaded files.
	•	all_data merges dataX, dataY and subject_data in a big dataset.
	•	Averages_data contains the relevant averages which will be later stored in a .txt file. ddply() from the plyr package is used to apply colMeans() and ease the development.
