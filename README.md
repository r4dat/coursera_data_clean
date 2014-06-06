Get_Data.R
===================
This is my standard base "get-data" script. It checks for the existence of the downloaded data files or if the named dataframes are already in memory. If neither of these things is true, it downloads the hard-coded url and expands as needed. The script is boilerplate and the code is identical to that in the run_analysis.R script. Kept in-repository because I always start there.

Run_Analysis.R
===================
Required Packages: Plyr
I used plyr because I prefer its *join* function to the base *merge*. I find it has a more intuitive syntax in context of the script creates a stable join.

The first section uses the same code as the "get-data" script above to download and extract the file locally.

Next we start reading in the files.
Previously (as part of the get-data section) I've created to useful strings.
```{r}
    localdir=getwd()
    datadir="UCI HAR Dataset"
```
The first setting the current working directory, the second setting the base data directory within the working directory.

Next we start building path strings to make the actual read-in less painful than completely literal path entry.
    tpath = paste(localdir,datadir,"train",sep='/')
    xname = "X_train.txt"
    yname = "y_train.txt"
    subtname = "subject_train.txt"
and read with
    xtrain = read.table(file=paste(tpath,'/',xname,sep=''),header=FALSE)
    subtrain = read.table(file=paste(tpath,'/',subtname,sep=''),header=FALSE)
This process is repeated with "test" to get the test version of the data.

In the end we've read in 6 dataframes from the corresponding test and train folders called **xtrain**,**ytrain**,**subtrain**,**xtest**,**ytest**,**subtest**.