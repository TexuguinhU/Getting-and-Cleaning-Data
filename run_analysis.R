# Merging training and test sets
train_set <- read.table("train/X_train.txt")
test_set <- read.table("test/X_test.txt")
merge_data <- rbind(train_set, test_set)

train_set <- read.table("train/subject_train.txt")
test_set <- read.table("test/subject_test.txt")
subject_data <- rbind(train_set, test_set)

train_set <- read.table("train/y_train.txt")
test_set <- read.table("test/y_test.txt")
Y <- rbind(train_set, test_set)

# Extracting measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt")
indices_of_good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
merge_data <- merge_data[, indices_of_good_features]
names(merge_data) <- features[indices_of_good_features, 2]
names(merge_data) <- gsub("\\(|\\)", "", names(merge_data))
names(merge_data) <- tolower(names(merge_data)) # see last slide of the lecture Editing Text Variables (week 4)

# Using descriptive activity name to name the activities in data set
activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

# Putting labels in data set with descriptive activity name.
names(subject_data) <- "subject"
cleaned <- cbind(subject_data, Y, merge_data)
# Save "tidy_data.txt" file containing a tidy data
write.table(cleaned, "tidy_data.txt")

# Creating a independent tidy data set that contains the average of each variable, activity and subject.
uniqueSubjects = unique(subject_data)[,1]
numSubjects = length(unique(subject_data)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]

row = 1
# Runs through "numSubjects" cleaning it.
for (subject in 1:numSubjects) {
  for (a in 1:numActivities) {
    result[row, 1] = uniqueSubjects[subject]
    result[row, 2] = activities[a, 2]
    tmp <- cleaned[cleaned$subject==subject & cleaned$activity==activities[a, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
# Save "tidy_data_final.txt" file containing the independent tidy data set.
write.table(result, "tidy_data_final.txt")



# EXAMPLE USAGE:
res2 <- read.table("data_set_with_the_averages.txt")
result[4,4]
res2[4,4]
res2[4,4]==result[4,4]
result[6,4]
res2[6,4]
res2[6,4]==result[6,4]
