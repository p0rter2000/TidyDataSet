Tidy Dataset taken from UC Irvine's Human Activity Recognition Using Smartphones Data Set.
The tidy dataset (TidyData.csv) contains the following variables (columns):

Column 1

	ActivityLabels
	
	A description of the activity performed by the subject
	
	The activities are:
	
	1. WALKING
	2. WALKING_UPSTAIRS
	3. WALKING_DOWNSTAIRS
	4. SITTING
	5. STANDING
	6. LAYING	

Column 2

	Subjects
	
	An ID number of the subject who performed the activity
	
	Test Subject IDs ranged from 2-24
	
	Training Subject IDs ranged from 1-30.

Columns 3-88
  
	tBodyAcc-mean()-X
	tBodyAcc-mean()-Y
	tBodyAcc-mean()-Z
	tGravityAcc-mean()-X
	tGravityAcc-mean()-Y
	tGravityAcc-mean()-Z
	tBodyAccJerk-mean()-X
	tBodyAccJerk-mean()-Y
	tBodyAccJerk-mean()-Z
	tBodyGyro-mean()-X
	tBodyGyro-mean()-Y
	tBodyGyro-mean()-Z
	tBodyGyroJerk-mean()-X
	tBodyGyroJerk-mean()-Y
	tBodyGyroJerk-mean()-Z
	tBodyAccMag-mean()
	tGravityAccMag-mean()
	tBodyAccJerkMag-mean()
	tBodyGyroMag-mean()
	tBodyGyroJerkMag-mean()
	fBodyAcc-mean()-X
	fBodyAcc-mean()-Y
	fBodyAcc-mean()-Z
	fBodyAcc-meanFreq()-X
	fBodyAcc-meanFreq()-Y
	fBodyAcc-meanFreq()-Z
	fBodyAccJerk-mean()-X
	fBodyAccJerk-mean()-Y
	fBodyAccJerk-mean()-Z
	fBodyAccJerk-meanFreq()-X
	fBodyAccJerk-meanFreq()-Y
	fBodyAccJerk-meanFreq()-Z
	fBodyGyro-mean()-X
	fBodyGyro-mean()-Y
	fBodyGyro-mean()-Z
	fBodyGyro-meanFreq()-X
	fBodyGyro-meanFreq()-Y
	fBodyGyro-meanFreq()-Z
	fBodyAccMag-mean()
	fBodyAccMag-meanFreq()
	fBodyBodyAccJerkMag-mean()
	fBodyBodyAccJerkMag-meanFreq()
	fBodyBodyGyroMag-mean()
	fBodyBodyGyroMag-meanFreq()
	fBodyBodyGyroJerkMag-mean()
	fBodyBodyGyroJerkMag-meanFreq()
	angle(tBodyAccMean,gravity)
	angle(tBodyAccJerkMean),gravityMean)
	angle(tBodyGyroMean,gravityMean)
	angle(tBodyGyroJerkMean,gravityMean)
	angle(X,gravityMean)
	angle(Y,gravityMean)
	angle(Z,gravityMean)
	tBodyAcc-std()-X
	tBodyAcc-std()-Y
	tBodyAcc-std()-Z
	tGravityAcc-std()-X
	tGravityAcc-std()-Y
	tGravityAcc-std()-Z
	tBodyAccJerk-std()-X
	tBodyAccJerk-std()-Y
	tBodyAccJerk-std()-Z
	tBodyGyro-std()-X
	tBodyGyro-std()-Y
	tBodyGyro-std()-Z
	tBodyGyroJerk-std()-X
	tBodyGyroJerk-std()-Y
	tBodyGyroJerk-std()-Z
	tBodyAccMag-std()
	tGravityAccMag-std()
	tBodyAccJerkMag-std()
	tBodyGyroMag-std()
	tBodyGyroJerkMag-std()
	fBodyAcc-std()-X
	fBodyAcc-std()-Y
	fBodyAcc-std()-Z
	fBodyAccJerk-std()-X
	fBodyAccJerk-std()-Y
	fBodyAccJerk-std()-Z
	fBodyGyro-std()-X
	fBodyGyro-std()-Y
	fBodyGyro-std()-Z
	fBodyAccMag-std()
	fBodyBodyAccJerkMag-std()
	fBodyBodyGyroMag-std()
	fBodyBodyGyroJerkMag-std()

	These data are either prefixed with "t" for time domain, "f" for frequency domain
	  or "angle" for the angle between two vectors. '-XYZ' is used to denote 3-axial signals
	  in the X, Y and Z directions.
	The features selected for this database come from the accelerometer and gyroscope
	  3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals
	  (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they
	  were filtered using a median filter and a 3rd order low pass Butterworth filter
	  with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration
	  signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ
	  and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency
	  of 0.3 Hz. 
	Subsequently, the body linear acceleration and angular velocity were derived in time to
	  obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of
	  these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag,
	  tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
	Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing
	  fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag,
	  fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

A summary of the steps and data transformations from the run_analysis.R script is provided below:

1. read X_train and X_test files into tables
	(X_train.txt and X_test.txt)

2. merge test and train to one data set using rbind()
	
3. read label enumerations for training and testing
	(y_train.txt and y_test.txt)

4. Concatenate activity numbers from each data set

5. read activity labels (6 categories)
	(activity_labels.txt)

6. Map the label enumerations to the activity labels

7. read subjects files for the test and train data sets
	(subject_train.txt and subject_test.txt)

8. Concatenate subjects from each data set

9. read in Variable names
	(features.txt)

10. assume that the Activity Labels have a 1-1 correspondence with the observation number,
	add the subjects and Activity Labels to the 1st/2nd column of the data set

11. Label data set columns

12. get the indicies of the columns with mean and std appearing anywhere in the name

13. Subset every col of TestTrain with mean or std in the col name using indicies provided by grep

14. merge the cols with mean and cols with std into a single data frame

15. Make a new data set by grouping data frame by the activity labels and subject number

16. Take the mean of each variable grouped by activity and subject

17. write new tidy data set to csv file (TidyData.csv)

18. Read back csv file from 17

19. view Tidy Dataset stored in the csv file

The dataset that is produced from the run_analysis.R script conforms to the 3 rules of being a tidy dataset:
1. Each variable has its own column.
2. Each observation has its own row.
3. Each value has its own cell.

