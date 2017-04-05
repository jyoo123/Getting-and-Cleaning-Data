# Getting-and-Cleaning-Data
Coursera Data Science Course #3 - course project submission

This file explains what run_analysis.R does.

The data set has been downloaded and unziped in the working directory.  

(A) After setting the working directory, the 6 activities and many features or measurement for activities are loaded.

(B) We are interested in only the "mean" or "standard deviation" features.  "meanSD" data variable will capture those.  Change the names so that they stand out and easy to see (*MEAN*" and "*STD*").  If we were to further apply regular expression on the names then this is a bad idea and the "*" needs to be removed.

(C) Load the training and test data using the "meanSD" as the row index.  Frankly, I don't know the difference between the training and the test.  The resulting data set will be (subject, activity, mean/std values).

(D) Merge the training and test data sets into one called "trainTestSet" and give column names as ("subject", "activity", feature names).

(E) Turn activity and subject into factors so that they can be sorted nicely later.  "melt" function will set the data into (subject,activity,variable name, variable value).  Take the melted data and get the mean for each variable.

(F) The tidy.txt will hold only 180 rows (30 subjects x 6 activities) and many columns (subject,activity plus many mean and std varialbe means).
