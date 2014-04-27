#Instructions to run the "run_analysis.R" script
-------------------------------------

1- Download the original dataset at :
-------------------------------------
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

2- Unzip the dataset, for example at:
-------------------------------------
```
~/home/R - (using Linux as reference)
or
~\Documents\R\ - (using Windows as reference)
```

A folder named "UCI HAR Dataset" will appear

3- Set your environment to "UCI HAR Dataset" folder (you can also set the environment through RStudio), for example at:
-------------------------------------
```
setwd("~/home/R/UCI HAR Dataset/") - (using Linux as reference)
or
setwd("~\Documents\R\UCI HAR Dataset\") - (using Windows as reference)
```

4- Run the "run_analysis.R" through "source()" command:
-------------------------------------
```
source("run_analysis.R")
```

The following datasets will be created (it will take some seconds after you run "run_analysis.R"):

tidy_data.txt - (8.35 Mb, a 10299x68 data frame)
tidy_data_final.txt - (0.225 Mb, a 180x68 data frame)

5- To read the final tidy data, use:
-------------------------------------
```
data <- read.table("tidy_data_final.txt")
```
