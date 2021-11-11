#loading required package

library(dplyr)


#assigning all data frames

featureNames <- read.table("features.txt", col.names = c("n", "functions"))
activityLabels <- read.table("activity_labels.txt", col.names = c("code", "activity"))
subjectTest <- read.table("test/subject_test.txt", col.names = "subject")
featureTest <- read.table("test/X_test.txt", col.names = featureNames$functions)
activityTest <- read.table("test/y_test.txt", col.names = "code")
subjectTrain <- read.table("train/subject_train.txt", col.names = "subject")
featureTrain <- read.table("train/X_train.txt", col.names = featureNames$functions)
activityTrain <- read.table("train/y_train.txt", col.names = "code")


#Step 1: Merges the training and test sets to create one data set

X <- rbind(featureTest, featureTrain)
Y <- rbind(activityTest, activityTrain)
Subject <- rbind(subjectTest, subjectTrain)
Merged_Data <- cbind(Subject, Y, X)


#Step 2: Extract only the measurements on the mean and standard deviation for each measurement

Tidy_Data <- Merged_Data %>% select(subject, code, contains("mean"), contains ("std"))


#Step 3: Uses descriptive activity names to name the activities in the data set

Tidy_Data$code <- activityLabels[Tidy_Data$code, 2]


#Step 4: Appropriately labels the data set with descriptive variable names

names(Tidy_Data)[2] = "activity"
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


#Step 5:From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

NewData <- Tidy_Data %>% 
  group_by(subject, activity) %>%
  summarise_all(list(mean))
write.table(NewData, "NewData.txt", row.name=FALSE)
