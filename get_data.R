# 
require(plyr)

# Set string Variables
localdir=getwd()
datadir="UCI HAR Dataset"

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

