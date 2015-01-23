library(dplyr)

testDat = read.table("./test/X_test.txt", colClasses = "character")
testAct = scan("./test/y_test.txt")
testSubj = scan("./test/subject_test.txt")
testDat = cbind(testDat, activity = testAct, subject = testSubj)

trainDat = read.table("./train/X_train.txt", colClasses = "character")
trainAct = scan("./train/y_train.txt")
trainSubj = scan("./train/subject_train.txt")
trainDat = cbind(trainDat, activity = trainAct, subject = trainSubj)

dat = tbl_df(rbind(testDat, trainDat))

dat = select(dat, c(V1:V6, V41:V46, V121:126), activity, subject)

dat$activity[dat$activity == 1] = "Walking"
dat$activity[dat$activity == 2] = "WalkingUpstairs"
dat$activity[dat$activity == 3] = "WalkingDownstairs"
dat$activity[dat$activity == 4] = "Sitting"
dat$activity[dat$activity == 5] = "Standing"
dat$activity[dat$activity == 6] = "Laying"


dat = rename(dat, 
	bodyAccMeanX = V1, bodyAccMeanY = V2, bodyAccMeanZ = V3, bodyAccStdX = V4, bodyAccStdY = V5, bodyAccStdZ = V6,
	gravityAccMeanX = V41, gravityAccMeanY = V42, gravityAccMeanZ = V43, gravityAccStdX = V44, gravityAccStdY = V45, gravityAccStdZ = V46,
	angularAccMeanX = V121, angularAccMeanY = V122, angularAccMeanZ = V123, angularAccStdX = V124, angularAccStdY = V125, angularAccStdZ = V126)

groupedDat = group_by(dat, subject, activity)

datf = summarize(groupedDat, 
	accelMeanX = mean(as.numeric(bodyAccMeanX)),
	accelMeanY = mean(as.numeric(bodyAccMeanY)),
	accelMeanZ = mean(as.numeric(bodyAccMeanZ)),
	accelStdX = mean(as.numeric(bodyAccStdX)),
	accelStdY = mean(as.numeric(bodyAccStdY)),
	accelStdZ = mean(as.numeric(bodyAccStdZ)),
	gravityMeanX = mean(as.numeric(gravityAccMeanX)),
	gravityMeanY = mean(as.numeric(gravityAccMeanY)),
	gravityMeanZ = mean(as.numeric(gravityAccMeanZ)),
	gravityStdX = mean(as.numeric(gravityAccStdX)),
	gravityStdY = mean(as.numeric(gravityAccStdY)),
	gravityStdZ = mean(as.numeric(gravityAccStdZ)),
	angularAccelMeanX = mean(as.numeric(angularAccMeanX)),
	angularAccelMeanY = mean(as.numeric(angularAccMeanY)),
	angularAccelMeanZ = mean(as.numeric(angularAccMeanZ)),
	angularAccelStdX = mean(as.numeric(angularAccStdX)),
	angularAccelStdY = mean(as.numeric(angularAccStdY)),
	angularAccelStdZ = mean(as.numeric(angularAccStdZ))
)
