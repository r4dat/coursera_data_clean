# Set string Variables
localdir=getwd()
datadir="UCI HAR Dataset"
#file suffix
suffix=".txt"


download_data=function(){
# IF file doesn't exist in working directory, 
# and no x* or subject* dataframe exists, dl and expand data file.
if(
  !(
    file_test(op="-d",x=paste(localdir,'/',datadir,sep='')) ||
      (exists("xset") && exists("subtset"))
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

}

read_data = function(setstring){
  tpath = paste(localdir,datadir,setstring,sep='/')
  xname = paste("X_",setstring,suffix,sep='')
  yname = paste("y_",setstring,suffix,sep='')
  subtname = paste("subject_",setstring,suffix,sep='')
  xset = read.table(file=paste(tpath,'/',xname,sep=''),header=FALSE)
  yset = read.table(file=paste(tpath,'/',yname,sep=''),header=FALSE)
  subtset = read.table(file=paste(tpath,'/',subtname,sep=''),header=FALSE)

## Create coherent data frame
df=cbind(subtset,yset,xset)
return(df)
}

