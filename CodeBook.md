The run_analysis.R script performs the data preparation and the 5 steps required as described in the course project.

**1. Download the dataset**

	Dataset downloaded and extracted under the folder named UCI HAR Dataset
	
**2. Assign each data to variables**

	featureNames <- features.txt : 561 rows, 2 columns
	
_The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ_
	
	activityLabels <- activity_labels.txt : 6 rows, 2 columns
	
_List of activities performed when the corresponding measurements were taken and its codes (labels 1 to 6)_

	subjectTest <- test/subject_test.txt : 2947 rows, 2 columns
	
_contains test data of 9 out of 30 volunteer test subjects being observed_

	featureTest <- test/X_test.txt : 2947 rows, 561 columns
	
_contains recorded features test data_

	activityTest <- test/y_test.txt : 2947 rows, 2 columns
	
_contains test data of activities code labels_

	subjectTrain <- train/subject_train.txt : 7352 rows, 1 column
	
_contains train data of 21 out of 30 volunteer subjects being observed_

	featureTrain <- train/X_train.txt : 7352 rows, 561 columns
	
_contains recorded features train data_

	activityTrain <- train/y_train.txt : 7352 rows, 1 column
	
_contains train data of activities code labels_

**3. Merges the training and test sets to create one data set**

	X (10299 rows, 561 columns) is created by merging featureTest and featureTrain using rbind() function
	
	Y (10299 rows, 1 column) is created by merging activityTest and activityTrain using rbind() function
	
	Subject (10299 rows, 1 column) is created by merging subjectTest and subjectTrain using rbind() function
	
	Merged_Data (10299 rows, 563 columns) is created by merging Subject, Y, and X using cbind() function
	
**4. Extract only the measurements on the mean and standard deviation for each measurement**

	Tidy_Data (10299 rows, 88 columns) is created by subsetting Merged_Data, selecting only columns: subject, code and the measurements on the mean and standard deviation for each measurement
	
**5. Uses descriptive activity names to name the activities in the data set**

	The entire numbers in code column of the Tidy_Data are replaced with corresponding activity taken from second column of the activities variable
	
**6. Appropriately labels the data set with descriptive variable names**

	code column in Tidy_Data renamed into "activity"
	names(Tidy_Data)<-gsub("Gyro", "Gyroscope", names(Tidy_Data))
names(Tidy_Data)<-gsub("BodyBody", "Body", names(Tidy_Data))
names(Tidy_Data)<-gsub("Mag", "Magnitude", names(Tidy_Data))
names(Tidy_Data)<-gsub("^t", "Time", names(Tidy_Data))
names(Tidy_Data)<-gsub("^f", "Frequency", names(Tidy_Data))
names(Tidy_Data)<-gsub("tBody", "TimeBody", names(Tidy_Data))
names(Tidy_Data)<-gsub("-mean()", "Mean", names(Tidy_Data), ignore.case = TRUE)
names(Tidy_Data)<-gsub("-std()", "STD", names(Tidy_Data), ignore.case = TRUE)
names(Tidy_Data)<-gsub("-freq()", "Frequency", names(Tidy_Data), ignore.case = TRUE)
names(Tidy_Data)<-gsub("angle", "Angle", names(Tidy_Data))
names(Tidy_Data)<-gsub("gravity", "Gravity", names(Tidy_Data))
	
	code column in TidyData renamed into activities
All Acc in column’s name replaced by Accelerometer
All Gyro in column’s name replaced by Gyroscope
All BodyBody in column’s name replaced by Body
All Mag in column’s name replaced by Magnitude
All start with character f in column’s name replaced by Frequency
All start with character t in column’s name replaced by Time
	
	
	
