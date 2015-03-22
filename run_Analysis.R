library(dplyr)

## Read in subject, activity, and acceleration data for train and test datasets

test <- read.table("test/X_test.txt") 
subjtest <- read.table("test/subject_test.txt")
acttest <- read.table("test/y_test.txt")

train <- read.table("train/X_train.txt")
subjtrain <- read.table("train/subject_train.txt")
acttrain <- read.table("train/y_train.txt")


## Combite all test and train data. Add the first column of subject name and second column 
## of activity

testfull <- cbind(subjtest,acttest,test)
trainfull <- cbind(subjtrain,acttrain,train)

## Combine the test data with the train data.
allresults <- rbind(testfull,trainfull)

## Compile Table labels. First, pull in features text. 
features <- read.table("features.txt")

## Second, create labels for the first two columns.  
labels <- matrix(c(0.1,0.2,"Subject","Activity"),ncol = 2)
labelsdata <- as.data.frame(labels,stringsAsFactors = F)

## Add those two labels to the top of the features dataset. By doing this, 
## we can then add the features set as labels to our data. 

alllabelsdata <- rbind(labelsdata,features)
colnames(allresults) <- make.names(alllabelsdata[,2],unique = T)


## Narrow down our columns to only have mean and std deviation values along with
## the Subject and name

stdmeanresults <- select(allresults, Subject, Activity, contains(".mean"), contains("std"))

##Now we substitute the Activity numbers for the descriptive label.

stdmeanresults[stdmeanresults$Activity == 1,]$Activity = "Walking"
stdmeanresults[stdmeanresults$Activity == 2,]$Activity = "Walking Upstairs"
stdmeanresults[stdmeanresults$Activity == 3,]$Activity = "Walking Downstairs"
stdmeanresults[stdmeanresults$Activity == 4,]$Activity = "Sitting"
stdmeanresults[stdmeanresults$Activity == 5,]$Activity = "Standing"
stdmeanresults[stdmeanresults$Activity == 6,]$Activity = "Laying"

## Group the data by person and activity

subj.stdmeanresults <- group_by(stdmeanresults,Subject,Activity)
full.tidy <- summarise_each(subj.stdmeanresults, funs(mean), c(contains("std"), contains("mean")))
