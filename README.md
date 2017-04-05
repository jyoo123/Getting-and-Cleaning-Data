# Getting-and-Cleaning-Data
Coursera Data Science Course #3 - course project submission

This file explains what run_analysis.R does.

The data set has been downloaded and unziped in the working directory.  
(A) After setting the working directory, the 6 activities and many features or measurement for activities are loaded.
(B) We are interested in only the "mean" or "standard deviation" features.  "meanSD" data variable will capture those.  Change the names so that they stand out and easy to see (*MEAN*" and "*STD*").  If we were to further apply regular expression on the names then this is a bad idea and the "*" needs to be removed.
(C) 
Load the activity and feature info
Loads both the training and test datasets, keeping only those columns which reflect a mean or standard deviation
Loads the activity and subject data for each dataset, and merges those columns with the dataset
Merges the two datasets
Converts the activity and subject columns into factors
Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
The end result is shown in the file tidy.txt.
