# Set string Variables
localdir=getwd()
datadir="UCI HAR Dataset"

# IF file doesn't exist in working directory, 
# and no subset dataframe exists, dl and expand data file.
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

# SHOULD PROBABLY JUST CREATE A FUNCTION ACCEPTING STRINGS ("test" and "train")
# Create train path string.
tpath=paste(localdir,datadir,"train",sep='/')
xname="X_train.txt"
yname="y_train.txt"
subtname="subject_train.txt"
xtrain=read.table(file=paste(tpath,'/',xname,sep=''),header=FALSE)
ytrain=read.table(file=paste(tpath,'/',yname,sep=''),header=FALSE)
subtrain=read.table(file=paste(tpath,'/',subtname,sep=''),header=FALSE)

# Create test path string.
tpath=paste(localdir,datadir,"test",sep='/')
xname="X_test.txt"
yname="y_test.txt"
subtname="subject_test.txt"
xtest=read.table(file=paste(tpath,'/',xname,sep=''),header=FALSE)
ytest=read.table(file=paste(tpath,'/',yname,sep=''),header=FALSE)
subtest=read.table(file=paste(tpath,'/',subtname,sep=''),header=FALSE)

# Bind all column vectors together. Subject ID first.
fulltrain=cbind(subtrain,xtrain,ytrain)
fulltest=cbind(subtest,xtest,ytest)

# Concatenate training and test frames.
complete=rbind(fulltrain,fulltest)