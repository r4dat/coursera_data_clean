# create a temporary file and a temporary directory on your local disk
tf <- tempfile()
td <- tempdir()

# run the download file function, download as binary..  save the result to the temporary file
download.file(
  "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
  tf ,
  mode = 'wb' 
)

# unzip the files to the temporary directory
files <- unzip( tf , exdir = getwd() )