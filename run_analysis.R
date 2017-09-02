# run_analysis.R
# github user:LeonFC1016
# note: script uses uses packages: "tidyr" and "reshape"
#     also downloads and unzips a .zip file to 
#     working directory

## This uses the fileUrl to download the package, then unzip
## it, then sets the working directory to the folder
## UCI HAR Dataet, the folder that was unzipped.
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./data.zip", method="curl")
unzip("./data.zip")
setwd("./UCI HAR Dataset")

## This section starts to read all files necesary to 
## create the merged data set of test and training sets
subjectTest = read.table("./test/subject_test.txt")
xTest = read.table("./test/X_test.txt")
yTest = read.table("./test/y_test.txt")
subjectTrain = read.table("./train/subject_train.txt")
yTrain = read.table("./train/y_train.txt")
xTrain = read.table("./train/X_train.txt")

# Merge the training and the test sets to create one data set.

## Using cbind() and rbind(), the files that were read earlier
## are merged to make mergedData.
testSet = cbind(subjectTest, yTest, xTest)
trainSet = cbind(subjectTrain, yTrain, xTrain)
mergedData = rbind(testSet, trainSet)

# Extracts only the measurements on the mean and standard 
# deviation for each measurement.

## This reads the features table that lists the names of the
## variables. Then uses grep() to get the indexes of the 
## columns we want to extract and keep in the data set. Then these
## these columns are subsetted from the merged data set so only
## the columns that are the measurements of mean and standard 
## deviation remain in the mergedData.
features = read.table("./features.txt")
stdMean = grep("std|mean[^Freq]", features$V2)
mergedData = mergedData[,c(1:2, 2+(stdMean))]

# Uses descriptive activity names to name the activities 
# in the data set

## This opens the data that contains the activities and their
## corresponding number. This uses the gsub() to sub the numbers
## in mergedData with the activities they represent. It converts
## the columns to character variables so they're easier to work with
## and changes the activity names to be clearer. The for() loop's
## "i" cycles through 1 to 6, and the subset of the mergedData$V1.1
## in which equals whatever "i" is, has its valued changed to the
## activity that's in the second column of actLabel. 
actLabel <- read.table("./activity_labels.txt")
actLabel$V1 <- as.character(actLabel$V1)
actLabel$V2 <- as.character(actLabel$V2)
actLabel$V2 <- tolower(actLabel$V2)
actLabel$V2 <- gsub("_", " ", actLabel$V2)
mergedData$V1.1 <- as.character(mergedData$V1.1)
for(i in actLabel$V1){
  mergedData$V1.1[which(mergedData$V1.1 == actLabel[i,1])]=actLabel[i,2]}
mergedData$V1.1 <- as.factor(mergedData$V1.1)

# Appropriately labels the data set with descriptive variable names

## We use the features table again, but this time to take the column
## names. The grep() is used with regex and value=TRUE to get the
## names of the columns that are the mean and standard deviation names,
## that value is stored as featureNames. Then, column names for activity
## and activity along with featureNames become the names for mergedData.
featureNames = grep("std|mean[^Freq]", features$V2, value=TRUE)
colnames(mergedData) = c("subject", "activity", 
                          featureNames)

## From here, the messy data set described in steps 1-4 are near complete,
## mergedData is saved as it's own .txt file, and is read back as messyData,
write.table(mergedData, "./messyData.txt", row.names=FALSE, 
            col.names = TRUE)
messyData <- read.table("./messyData.txt", header=TRUE)

## messyData's columns take the name of mergedData's to avoid being read
## incorrectl by read.table(). Using a similar method used before, the
## variable names are cleaned up to remove unwanted punctuation and fix 
## some letter cases. 
colnames(messyData) <- names(mergedData)
messyTypo <- c("-", "[()]",  " std", " mean", " X", " Y", " Z", "BodyBody")
messyFixed <- c(" ",  "", "Std", "Mean", "X", "Y", "Z", "Body")
for(i in seq_along(messyTypo)){
  names(messyData) <- gsub(messyTypo[i], messyFixed[i], names(messyData))}
## The subject column is turned into a factor for possible easier manipulation.
messyData$subject = as.factor(messyData$subject)


#From the data set in step 4, creates a second, independent 
#tidy data set with the average of each variable for each 
#activity and each subject.

## This section uses the same looping method to utilize gsub() to change
## the names of the variables. 

typo <- c("-", "[()]", "Body", "Acc", "Gravity", "Jerk", "Gyro", "Mag", 
          "Mean", "^f", "^t", "body body")
fixed <- c(" ", "", " body", " accelerometer", " gravity", " jerk", 
           " gyroscope", " magnitude", " mean", "frequency", "time", "body")
for(i in seq_along(typo)){
  names(mergedData) <- gsub(typo[i], fixed[i], names(mergedData))}
names(mergedData) <- tolower(names(mergedData))

## This section uses melt() to created a melted data set so that the
## mean of the values can be calculated in the cast() function. The
## castData now has the averages as its values in the cells.

library(reshape)
meltData = melt(mergedData, id=c("subject", "activity"))
castData = cast(meltData, subject + activity ~ variable, mean)


## Then, using tidyr functions, gather() and separate(), the variables
## are gathered into one column as "findings", while their value are in 
## another corresponding column. Then separate() creates new columns based 
## on the differences of the values of "findings."
library(tidyr)
gatData = gather(castData, findings, value, -c(subject, activity), 
                  na.rm = TRUE)
sepData = separate(gatData, findings, c("domain", "acceleration", 
                                         "instrument", "jerk", 
                                         "magnitude", "measurement", 
                                         "axis"), na.rm=TRUE)

## This is turned to a factor variable because it's better for tidy data.
sepData$subject = as.factor(sepData$subject)

## This sequence locates the indices of values in which values are in the wrong 
## column using which(), and those indices are used to subset those values in the
## correct column and gives them the value that they should be. This is done from
## the right to left so that all the values are transfered safely.
sepData$axis[c(which(sepData$magnitude=="x"), 
               which(sepData$measurement=="x"))]="x"
sepData$axis[c(which(sepData$magnitude=="y"), 
               which(sepData$measurement=="y"))]="y"
sepData$axis[c(which(sepData$magnitude=="z"), 
               which(sepData$measurement=="z"))]="z"
sepData$measurement[c(which(sepData$jerk=="mean"), 
                      which(sepData$magnitude=="mean"))]="mean"
sepData$measurement[c(which(sepData$jerk=="std"), 
                      which(sepData$magnitude=="std"))]="std"
sepData$magnitude[which(sepData$jerk=="magnitude")]="magnitude"
sepData$jerk[which(sepData$jerk!="jerk")]=NA
sepData$magnitude[which(sepData$magnitude!="magnitude")]=NA

## This writes the tidy data, and provides a variable to read it. And
## the subject is again turned to a factor for easier data manipulation.
write.table(sepData, "./tidyData.txt", row.names=FALSE, col.names = TRUE)
tidyData <- read.table("./tidyData.txt", header=TRUE)
tidyData$subject <- as.factor(tidyData$subject)

## The script takes a lot of space, and creates a lot of objects that
## are large sizes, so the script removes the other objects so that
## only tidyData and messyData are left. 
rm(castData, features, gatData, meltData, mergedData, sepData, 
   subjectTest, subjectTrain, testSet, trainSet, xTest, xTrain, yTest, 
   yTrain, featureNames, fileUrl, actLabel, fixed, i, messyFixed, 
   messyTypo, typo, stdMean)
View(tidyData)
