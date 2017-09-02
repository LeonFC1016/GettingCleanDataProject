{\rtf1\ansi\ansicpg1252\cocoartf1504\cocoasubrtf830
{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fnil\fcharset0 HelveticaNeue;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\csgenericrgb\c0\c0\c0;}
\margl1440\margr1440\vieww12560\viewh13140\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 run_analysis.R script by Github user: LeonFC1016\
\
THE DATA FROM THE EXPERIMENT:\
When the script runs, it will download a .zip file, and unload its contents and read them to create the data sets for the project. \
\
Though the script will download the content itself, the url to download the .zip file can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. \
\
The experiment has its own README.txt in the contents of the folder. The url for the experiment can be found at: {\field{\*\fldinst{HYPERLINK "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"}}{\fldrslt 
\f1 \cf2 http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones}}
\f1 \cf2 . 
\f0 \cf0 \
\
THE FILES INCLUDED IN THE REPO:\
CodeBook.md is a codebook that gives general info and descriptions about the experiment, the data, the data\'92s variables, and an explanation of the tidy data. \
\
run_analysis.R is the script that downloads the .zip file and reads the file to create dataset that is a merge of the training and test sets made up of only the mean and standard deviation measurements that has descriptive activity names and descriptive variable names saved as \'93./messyData.txt\'94, and has a second independent tidy data set with the average of each variable for each activity and each subject saved as \'93./tidyData.txt\'94. The \
\
README.md is a readme file that gives information on where the experiment\'92s data comes from, the files included in the repo, and explains how the script works, and the data sets that are created and saved when the script is finished. \
\
THE DATA  SETS CREATED BY THE SCRIPT\
Both file are saved in the UCI HAR Dataset folder that is created when the zip is downloaded and unzipped.\
\
\'93./messyData.txt\'94 is a messy data set that meets the requirements of steps 1-4 of the project. The variables in the messy data set reflect the way the naming structure found in the experiment\'92s data, so consult the \'93features.txt\'94 and \'93features_info.txt\'94 to understand them. \
\
\'93./tidyData.txt\'94 is a tidy data set that meets the principals of tidy data and step 5 of the project. Consult CodeBook.md for information on the tidy data set such as its variables, its transformation, and how it confirms to the principals of tidy data.\
\
HOW THE SCRIPT WORKS: \
Merge the training and the test sets to create one data set:\
-downloads the .zip file and unzips a folder at your current location, then sets your setwd() to the .zip files\'92 folder \
- reads tables that contain the test and training sets\
- uses cbind() to make test and training sets, then rbind() to combine them into one data set\
\
Extracts only the measurement on the mean and standard deviation for each measurement:\
- uses the \'93./features.txt\'94 to read the variable names\
- uses grep() to find the indices of values that represent the means and standard deviation of columns.\
- subsets only the columns that are the mean and standard deviation and the subject and activity are in the dataset and defines itself as the merged data set\
\
Uses descriptive activity names to name the activities in the dataset:\
- opens the activity table\
- changes columns to character variables so they\'92re easier to work with\
- uses gsub() to get rid of unnecessary punctuation in the activity names and makes them lowercase\
- uses the for() loop cycles through actLabel$V1\'92s values: 1 to 6. For each iteration, the column of activities to rename from numbers to descriptions, mergedData$V1.1 subsets the indices that the which() identifies as those that equal whatever \'93i\'94 equals, a number between 1 to 6. These indices have their values changed to the corresponding activity name in the second column of actLabel\
- The activity column, mergedData$V1.1, is turned back into a factor\
\
Appropriately labels the data set with descriptive variable names:\
- uses the features table to take the column names\
- grep() is used with regex and value=TRUE to get the names of the column that are the mean and standard deviation names, that value is stored as featureNames. Then, column names for activity and activity along with featureNames become the names for mergedData\
-writes a messy data set then cleans up the variable\'92s names: removes unnecessary punctuation and capitalizes the first word of the phrases found in the column\'92s names\
\
From the data set in step 4, creates, a second, independent tidy data set with the average of each variable for each activity and each subject:\
- uses the gsub() to change the names of the variables using the looping method as before to cycle through the corrections\
- uses melt() to created a melted data set according to \'93subject\'94 and \'93activity\'94 so that the mean of the values can be calculated in the cast() function\
- uses castData to average its values according the subject and activity\
- uses gather() so that variables are gathered into one column as \'93findings\'94, while their value are in another corresponding column\
- uses separate() to create a new column based on the differences of the values of \'93findings\'94\
- converts subject column to factor for more efficient data organization\
- locates the indices of values in which values are in the wrong column using which(), then those indices are used to subset those values in the correct column and gives them the value that they should be. This is done from right to left so that all the values are transffered safely. \
- writes the tidy data, and provides a variable to read it\
- uses rm() to remove the extraneous objects create by the script. \
\
NOTES:\
There is a more detailed description of how run_analysis.R works in the comments of the script. \
The script requires the packages \'93tidyr\'94 and \'93reshape.\'94\
\
}