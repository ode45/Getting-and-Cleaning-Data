#This run_analysis.R script does the following:

#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# load the feature descriptions
features = t(read.table("./UCI HAR Dataset/features.txt",row.names=1,stringsAsFactors=F))
# select the measurements on the mean and standard deviation for each measurement
idxFeatures = grep("(mean|std)\\(",features) #include curly braces to skip features with "meanFreq()"
# replace irregular feature descriptiopn "BodyBody" with "Body"
features = gsub("BodyBody","Body",features)
# remove special characters (cannot be printed in the txt file)
features=gsub("\\(|\\)|\\-|\\,", "", features)
# capitalize mean and std to make the variable name nicer
features=gsub("mean", "Mean", features)
features=gsub("std",  "Std",  features)

# read the activity labels
activity_labels = t(read.table("./UCI HAR Dataset/activity_labels.txt",row.names=1,stringsAsFactors=F))

# load the test dataset
Xtest = read.table("./UCI HAR Dataset/test/X_test.txt",col.names=features)
ytest = read.table("./UCI HAR Dataset/test/y_test.txt",col.name="Activity")
subjecttest = read.table("./UCI HAR Dataset/test/subject_test.txt",col.name="Subject")

# load the train dataset
Xtrain = read.table("./UCI HAR Dataset/train/X_train.txt",col.names=features)
ytrain = read.table("./UCI HAR Dataset/train/y_train.txt",col.name="Activity")
subjecttrain = read.table("./UCI HAR Dataset/train/subject_train.txt",col.name="Subject")

# extracts only the measurements on the mean and standard deviation for each measurement
Xtest  = Xtest [ ,idxFeatures]
Xtrain = Xtrain[ ,idxFeatures]

# merges the training and the test sets to create one data set.
test = cbind(Xtest,subjecttest,ytest)
train = cbind(Xtrain,subjecttrain,ytrain)
dataset = rbind(test,train)

# Uses descriptive activity names to name the activities in the data set
dataset$Activity = factor(dataset$Activity, labels=t(activity_labels))

# from the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tempDataset = dataset[ ,1:length(idxFeatures)]
colnames(tempDataset) <- paste("Avg", colnames(tempDataset), sep = "")
tidy = aggregate(tempDataset, by=list(Activity = dataset$Activity, Subject=dataset$Subject), mean)

# write the tidy data set to a file
write.csv(tidy, "./tidy.txt", row.names=FALSE)