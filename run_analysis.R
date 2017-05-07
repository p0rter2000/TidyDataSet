########################################################################################################
# Getting and Cleaning Data Course Project
# run_analysis.R

# A full description is available at the site where the data was obtained:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

# Here are the data for the project:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names. 
# 5.From the data set in step 4, creates a second, independent tidy data set with the average
#   of each variable for each activity and each subject.

########################################################################################################

if(!file.exists("./data")){dir.create("./data")}

library(downloader)
# download zip file from website
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download(fileURL,dest="./data/Project.zip",mode="wb")
# unzip file
unzip("./data/Project.zip",exdir = "./data")

# read X_train and X_test files into tables
XTrain = read.table("./data/UCI HAR Dataset/train/X_train.txt")
XTest = read.table("./data/UCI HAR Dataset/test/X_test.txt")
# merge test and train to one data set using rbind()
TestTrain <- rbind(XTest,XTrain)

# read label enumerations for training and testing
TrainActivityNum = read.table("./data/UCI HAR Dataset/train/y_train.txt")
TestActivityNum = read.table("./data/UCI HAR Dataset/test/y_test.txt")
# Concatenate activity numbers from each data set
ActivityNums <- c(TestActivityNum$V1,TrainActivityNum$V1)

# read activity labels (6 categories)
ActivityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
# Map the label enumerations to the activity labels
ActivityLabels <- factor(ActivityNums,levels =  ActivityLabels$V1,labels =  ActivityLabels$V2)

# read subjects files for the test and train data sets (subject_train.txt)
TestSubjects <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
TrainSubjects <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
# Concatenate subjects from each data set
Subjects <- c(TestSubjects$V1,TrainSubjects$V1)

# read in Variable names from features.txt
VarNames <- read.table("./data/UCI HAR Dataset/features.txt")
VarNames <- data.frame(lapply(VarNames, as.character), stringsAsFactors=FALSE)
VarNames <- VarNames$V2
write.csv(VarNames,file = "VarNames.csv")

# assume that the Activity Labels have a 1-1 correspondence with the observation number,
#  add the subjects and Activity Labels to the 1st/2nd column of the data set
TestTrain <- cbind(Subjects,ActivityLabels,TestTrain)

# Label data set columns
colnames(TestTrain) <- c("Subjects","ActivityLabels",VarNames)

# Extracts only the measurements on the mean and standard deviation for each measurement 
#  get the indicies of the columns with mean and std appearing anywhere in the name
MuIdx <- c(1,2,grep("mean|Mean", colnames(TestTrain)))
write.csv(MuIdx,file = "MeanIdx.csv")
SigmaIdx <- grep("std", colnames(TestTrain))
write.csv(SigmaIdx,file = "StdIdx.csv")
# length(MuIdx) + length(SigmaIdx)

# Subset every col of TestTrain with mean or std in the col name using indicies provided by grep
TestTrainMu <- TestTrain[,MuIdx]
TestTrainSigma <- TestTrain[,SigmaIdx]
# merge the cols with mean and cols with std into a single data frame
TestTrainMuSigma <- cbind(TestTrainMu,TestTrainSigma)

# Make a new data set by grouping data frame by the activity labels and subject number
library(dplyr)
TestTrainGroups <- group_by(TestTrainMuSigma,ActivityLabels,Subjects)
# Take the mean of each variable grouped by activity and subject
ActivityMeans <- summarise_each(TestTrainGroups,funs(mean))

# write new tidy data set to tab delimited txt file
write.table(ActivityMeans, file = "TidyData.txt",sep="\t",row.name=FALSE)

# Load and view the tidy dataset
TidyData <- read.table("TidyData.txt")
View(TidyData)








