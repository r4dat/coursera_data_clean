require(plyr)
localdir=getwd()
datadir="UCI HAR Dataset"
# Set string Variables


# IF file doesn't exist in working directory, 
# and no x* or subject* dataframe exists, dl and expand data file.
if(
  !(
    file_test(op="-d",x=paste(localdir,'/',datadir,sep='')) ||
      (exists("xtest") && exists("subtest"))
  )
){
  # create a temporary file and a temporary directory on your local disk
  tf <- tempfile()
  td <- tempdir()
  
  # run the download file function, download as binary..  save the result to the temporary file
  download.file(
    "https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip",
    tf ,
    mode = 'wb' 
  )
  
  # unzip the files to the temporary directory
  files <- unzip( tf , exdir = getwd() )
}

##### READ IN DATA FILES

# SHOULD PROBABLY JUST CREATE A FUNCTION ACCEPTING STRINGS ("test" and "train")
# Create train path string.
tpath = paste(localdir,datadir,"train",sep='/')
xname = "X_train.txt"
yname = "y_train.txt"
subtname = "subject_train.txt"
xtrain = read.table(file=paste(tpath,'/',xname,sep=''),header=FALSE)
ytrain = read.table(file=paste(tpath,'/',yname,sep=''),header=FALSE)
subtrain = read.table(file=paste(tpath,'/',subtname,sep=''),header=FALSE)

# Create test path string.
tpath = paste(localdir,datadir,"test",sep='/')
xname = "X_test.txt"
yname = "y_test.txt"
subtname = "subject_test.txt"
xtest = read.table(file=paste(tpath,'/',xname,sep=''),header=FALSE)
ytest = read.table(file=paste(tpath,'/',yname,sep=''),header=FALSE)
subtest = read.table(file=paste(tpath,'/',subtname,sep=''),header=FALSE)



##### READ IN ACTIVITY LABELS, FEATURES (x col names)
actLabel = read.table(file=paste(localdir,datadir,"activity_labels.txt",sep='/'),stringsAsFactors=FALSE)
xLabel = read.table(file=paste(localdir,datadir,"features.txt",sep='/'),stringsAsFactors=FALSE)

# Bind all column vectors together.
# COLS: SubjID, ActID (Y), GyroVectors(X)
fulltrain = cbind(subtrain,ytrain,xtrain)
fulltest = cbind(subtest,ytest,xtest)

# Concatenate training and test frames.
complete=rbind(fulltrain,fulltest)
# Name columns
colnames(complete) = c("sid","activity",xLabel[,2])
#Rename actLabel column.
colnames(actLabel)[1] = c("activity")

# Use PLYR to replace categorical integers with string.
# Little odd: join similar to merge or SQL join.
# Why complete[,1:2]? Because join only accepts dataframes.
# Complete[,2] is just a vector. The [,3] at the end selects just the 
# text string from the resultant joined dataframe. 
#(Eg vars ID, Activity(Int), Activity(String))
# assigning this to the $activity variable replaces it. 

complete$activity = join(x=complete[,1:2],y=actLabel,by="activity")[,3]

# The grep function does string pattern matching, so we're searching the 
# var lables for mean and std (case-insensitive).
# this drops sid, and activity so we manually specify column names in the search.
# the reassignment drops other columns.

complete = complete[,
                    grep(pattern="sid|activity|*mean*|*std*",
                         x=colnames(complete),ignore.case=TRUE)]

# Use aggregate function to group by subject-id and activity type,
# then find mean.

#Skip first 2 columns of set because they're subject-id and activity.
tidy = aggregate(x=complete[,3:88],by=complete[,c("sid","activity")],FUN=mean)

# add meanby_sid_act prefix.
colnames(tidy)=paste("meanby_sidact_",colnames(tidy),sep='')

#Reset sid and activity names.
colnames(tidy)[1:2]=c("sid","activity")