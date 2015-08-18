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
<li>xTrain, yTrain, xTest, yTest, subjectTrain and subjectTest contain the data from the downloaded files.
<li>xData, yData and subjectData merge the previous datasets to further analysis.
<li>features contains the correct names for the xData dataset, which are applied to the column names stored in meanANDstd, a numeric vector used to extract the desired data.
<li>A similar approach is taken with activity names through the activities variable.
<li>allData merges xData, yData and subjectData in a big dataset.
<li>averagesData contains the relevant averages which will be later stored in a .txt file. ddply() from the plyr package is used to apply colMeans() and ease the development.
