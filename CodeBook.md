## Code book

The initial data come from signals emitted from smartphones by means of inbuilt accelerometers and gyrometers.
The purpose is to identify activities (walking, sitting, laying) of persons wearing these devices.
The persons were split randomly in two classes "test" resp. "training". I could not identify any 
particular differences in the treatment or generation of data for these two classes. So for the assignment
I believe that they are not relevant.

The data files resulting from these signals can be found in the "Inertial Signals" sub folders of "test" resp. "train".

The data were further preprocessed by appropriate "filters" to suppress "noise" and, in the case of
linear acceleration, to split total acceleration into "angular" and "gravitational" components. 

Resulting sets of signals are:

	tBodyAcc in 3 dimensions X Y Z
	tGravityAcc in 3 dimensions X Y Z
	tBodyGyroAcc in 3 dimensions X Y Z.

In my approach these are genuine "measurements".

The data obtained by further mathematical operations like the various "Jerk" (time derivate), 
"Mag" (Euclidean norm) or "Fourier Transformation" data are not considered "measurements" in my approach.
This is why I omit the corresponding variables in step 2 of the assignment.

Hence the variables which I select from the features vector and rename in step 2, 3, 4 are: 

	angularAccMeanX
	angularAccMeanY
	angularAccMeanZ
	angularAccStdX
	angularAccStdY
	angularAccStdZ
	gravityAccMeanX
	gravityAccMeanY
	gravityAccMeanZ
	gravityAccStdX
	gravityAccStdY
	gravityAccStdZ
	gyroAccMeanX
	gyroAccMeanY
	gyroAccMeanZ
	gyroAccStdX
	gyroAccStdY
	gyroAccStdZ

Class and units of values keep unchanged.

The remaining variables in this set are 
	activity
	subject
and have values "1" through "6" for activities resp. "1" through "30" for subjects.
The activity values are changed to 
	"Walking", "WalkingUpstairs", "WalkingDownstairs", "Sitting", "Standing", "Laying" 

##########################################################################################

Now comes step 5

variables are

	subject	  -  identifies the person who wears the smartphone
		     values "1", "2", "3", "4", "5" through "30"
                     type: character string
	activity  -  describes the activity of a person
	             "Walking", "WalkingUpstairs", "WalkingDownstairs", "Sitting", "Standing", "Laying"
                     type: character string
	accelMeanX - values: average of angularAccMeanX for each activity and subject
		     type: numeric
	accelMeanY - values: average of angularAccMeanY for each activity and subject
		     type: numeric
	accelMeanZ - values: average of angularAccMeanZ for each activity and subject
		     type: numeric
	accelStdX  - values: average of angularAccStdX for each activity and subject
		     type: numeric
	accelStdY  - values: average of angularAccStdY for each activity and subject
		     type: numeric
	accelStdZ  - values: average of angularAccStdZ for each activity and subject
		     type: numeric
	gravityMeanX - values: average of gravityAccMeanX for each activity and subject
		       type: numeric
	gravityMeanY - values: average of gravityAccMeanY for each activity and subject
		       type: numeric
	gravityMeanZ - values: average of gravityAccMeanZ for each activity and subject
		       type: numeric
	gravityStdX - values: average of gravityAccStdX for each activity and subject
		       type: numeric
	gravityStdY - values: average of gravityAccStdY for each activity and subject
		       type: numeric
	gravityStdZ - values: average of gravityAccStdZ for each activity and subject
		       type: numeric

	angularAccelMeanX - values: average of angularAccMeanX for each activity and subject
		     type: numeric
	angularAccelMeanY - values: average of angularAccMeanY for each activity and subject
		     type: numeric
	angularAccelMeanZ - values: average of angularAccMeanZ for each activity and subject
		     type: numeric
	angularAccelStdX  - values: average of angularAccStdX for each activity and subject
		     type: numeric
	angularAccelStdY  - values: average of angularAccStdY for each activity and subject
		     type: numeric
	angularAccelStdZ  - values: average of angularAccStdZ for each activity and subject
		     type: numeric

I think that my final data set is tidy, because
- each variable forms a column
       - each observation forms a row
       - there is only one observation type in the table

I considered the question that there are two groups of subjects: test and training.
So a column could in fact contain two variables: "variable.test" and "variable.training".

But in the experiment description there is nowhere mentioned that these groups of subjects
were treated differently in any manner. May be that this distinction could come in future
experiments, where recognition of activity in the training group will be subject of a kind of 
pre - learning process?
For now I believe that test and training are not important for the assignment.

Operations to obtain the final data set:

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
with dimensions 10299 20

Step 2.

Extract variables as described above with select()

Step 3.

Rename the activity codes 1 through 6 by "Walking" through "Laying" like
described above.

Step 4.

Use the rename() command to give descriptive names to the variables. See
above for details.

Step 5.

Group the data frame dat by subject and activity. Use command group_by().
Call summarize on grouped data to compute the means (average) of the
relevant variables. This creates the required data set.

Verify that it is tidy.
