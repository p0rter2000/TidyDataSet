TidyDataSet

R script to acquire, clean and tidy dataset from UC Irvine's Human Activity Recognition Using Smartphones.



The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a
series of yes/no questions related to the project. You will be required to submit:
1. a tidy data set as described below,
2. a link to a Github repositorywith your script for performing the analysis, and
3. a code book that describes the variables, the data, and any transformations or work that you performed
	to clean up the data called CodeBook.md. You should also include a README.md inthe repo with your
	scripts. This repo explains how all of the scripts work andhow they are connected.



A full description is available at the site where the data was obtained:
	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

	Here are the data for the project:
	
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



This script should :

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average

	of each variable for each activity and each subject.



Environment

Set working directory to same directory as run_analysis.R

Needs the "downloader" and "dplyr" packages installed.

The dataset that is produced from the run_analysis.R script conforms to the 3 rules of being a tidy dataset:
1. Each variable has its own column.
2. Each observation has its own row.
3. Each value has its own cell.

Use the following to read and view the created tidy dataset txt file
TidyData <- read.table("TidyData.txt"
View(TidyData)

