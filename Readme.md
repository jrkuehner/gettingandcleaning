# Readme.md
# Working directory is UCI HAR Dataset

Load library(dplyr)

Step 1.

Read files ./test/X_test.txt
           ./test/y_test.txt
	   ./test/subject_test.txt
with
	   read.table()
	   scan()
	   scan()

Put together with cbind to obtain data frame "testDat"

Same procedure for files
	   ./train/X_test.txt
           ./train/y_test.txt
	   ./train/subject_test.txt
Obtain "trainDat"

"Merge" testDat and trainDat with rbind(), obtain a data frame "dat"
with dimensions .....

Step 2.

Extract variables as described in codebook with select()

Step 3.

Rename the activity codes 1 through 6 by "Walking" through "Laying" like
described in the codebook.

Step 4.

Use the rename() command to give descriptive names to the variables. See
codebook for details.

Step 5.

Group the data frame dat by subject and activity. Use command group_by().
Call summarize on grouped data to compute the means (average) of the
relevant variables. This creates the required data set.

Verify that it is tidy.


