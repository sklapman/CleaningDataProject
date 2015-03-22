Overview
========

This repo has a script that summarizes data in a tidy form from an set of data that was collected by a Samsung Galaxy S III. The embedded acceleromter and gyroscope measured 3-axial linear acceleration adn 3-axial angular velocity. The data was then processed to eliminate outside noise. 

Running
=======

This script first combines the test and train data points into one data set. It then attaches the subject and activity values to the data frame as the first two columns. In order to label the columns appropriately, it uses the features text file. First, the labels for the subject and activity are added to features text file. Second, the features file is used to label the columns of the combined data set. Next, all the datapoints that are not means or standard deviations are eliminated. Finally, the names of the activites are swapped with the numbers to produce the first tidy data frame `stdmeanresults`. 

This script then takes the mean of the data by activity and person in the first tidy data 'full.tidy'.

Results
=======

When the script is run, the R environment will contain two tidy data frames:
- `stdmeanresults` which lists means and standard deviations for all data collected by the sensors 
- `full.tidy` which lists the means and standard deviation for each subject and activity. 

