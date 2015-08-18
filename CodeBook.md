#Introduction
The script run_analysis.R performs the 5 steps described in the course project's definition.

About the script..
First things first. 
At the beginning all the similar data (x, y and, in its variants test and train) is merged using the rbind() function. 
Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. 
After extracting these columns, they are given the correct names, taken from features.txt.
As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
On the whole dataset, those columns with vague column names are corrected.
Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called averages_data.txt, and uploaded to this repository.


<b>Variables</b>
<li><u>xTrain</u>, <u>yTrain</u>, <u>xTest</u>, <u>yTest</u>, <u>subjectTrain</u> and <u>subjectTest</u> contain the data from the downloaded files.
<li><u>xData</u>, <u>yData</u> and <u>subjectData</u> merge the previous datasets to further analysis.
<li><u>features</u> contains the correct names for the x_data dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data.
A similar approach is taken with activity names through the activities variable.
all_data merges x_data, y_data and subject_data in a big dataset.
Finally, averages_data contains the relevant averages which will be later stored in a .txt file. ddply() from the plyr package is used to apply colMeans() and ease the development.
