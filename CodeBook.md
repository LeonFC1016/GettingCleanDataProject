Data Codebook for run_analysis.R
GENERAL INFO ABOUT THE FILE

The .txt file “tidyData.txt” contains tidy data of the data set of Human Activity Recognition Using Smartphones Data Set which can be found at : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The zip file of raw data can be downloaded at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

GENERAL INFO ABOUT THE DATA
The tidy dataset contains 11880 observations and 10 columns. The data is collected from experiments carried out by 30 volunteers that performed six activities: (walking, walking upstairs, walking downstairs, sitting, standing, and laying) while wearing a smartphone on their waist. Data was captured using the smartphone’s accelerometer and gyroscope to capture 3-axial linear acceleration and 3-axial angular velocity. 

ABOUT THE EXPERIMENTAL DESIGN
The measurements of the data selected for this database come from the data of the accelerometer and gyroscope 3-axial raw signals. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm. 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals.

THE VARIABLES OF THE TIDY DATA: WHAT THEY MEAN, THE CATEGORIES, THE UNITS OF MEASUREMENT, AND GENERAL SUMMARY 

The data set’s variables are: “subject,” “activity, ”domain,” “acceleration,” “instrument,” “jerk,” “magnitude,” “variable,” “axis,” and “value.” They are all factor variables except “value” which is numerical. Its dimensions are 11880x10.

– subject: ranges from 1 to 30 to distinguish which one of the thirty subjects performed an activity. 
–activity: distinguishes which of the six activities the subject performed: “walking,” “walking upstairs,” “walking downstairs,” “sitting,” “standing,” or ”laying.”
–domain: the kind of signal the smart phone captured, the signals are either “time” domain signals or “frequency” domain signals. The frequency-domain signal was calculated using Fast Fourier Transform. 
–acceleration: the acceleration captured from the accelerometer was split based on if it was from the “body” or from “gravity.”
 –instrument: whether the instrument used to measure the signal is the smartwatch’s “accelerometer” or “gyroscope.” Values recorded by the accelerometer are measured in standard gravity units ‘g’, while values measured by the gyroscope are in radians/second. 
–jerk: refers to the rate of change of acceleration which was calculated using the Euclidean norm. The variable indicates whether the measurement is a “jerk” signal or not (NA).
–magnitude: the variable indicates whether the “magnitude” of the signals were calculated or not (NA). 
–measurement: refers to whether the value is the standard deviation or mean of the multiple values recorded while the subject performed the activity.
–axis refers to either “x”, “y”, or “z.” 
– value is the numerical data captured by the smart watch. 

AN EXPLANATION OF THE DATA TRANSFORMATION TO TIDY DATA:
The messy data prior tidying had its variables previously sorted by the combination of signal identifiers and measurement; domain, acceleration, instrument, jerk, magnitude, variable, axis, and measurement were all as one variable, while the value was placed in the cells of the data frame. There were too many variables in one column, so the tidy data gives each variable its own column. The data changes so that it’s function isn’t merely to display the value of the measurement in its cells, but to identify components of the signal and the measurements used on the signal. 

Viewing the columns as having too many variables in each one was necessary because the data is not merely raw data from the smart watch, but data that’s been deeply processed. The data contains the mean or standard deviation from the signal after many trials, and all the data from those trials were averaged as well. There are also further calculations such as calculating the jerk, the magnitude, and whether if it’s a time or frequency domain. There are so many different descriptions to the signal that to leave the columns as long descriptors of signal/calculation type is too jarring to adjust to and understand. 

This allows the user to easily identify components of the signal and its value, and to order and manipulate them as needed. For example, you can order the values based on what instrument was used. Also, the messy data’s variables do not obey the principals of tidy data: there are too many variables in each column name. Therefore, to have tidy data, the variables must have their own column. 

While being a long dataset, data can easily be identified and navigated. The data obeys the principles that: 
each variable you measure should be in one column, each different observation of that variable should be in a different row, there should be one table for each "kind" of variable, and if you have multiple tables, they should include a column in the table that allows them to be linked.
