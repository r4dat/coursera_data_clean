Get_Data.R
===================
*Download_Data* function: Set some base strings (datadir, working directory). If neither data files, nor expected dataframes exist in directory or environment respectively, download and unzip files.

*Read_Data* function: Accept string argument named setstring, expected to be either "test" or "train". Then does some string manipulation to create the paths and load dataframes. After all sets are loaded (x,y,subject) the function rbinds them into a logical structure (subj,act,x) and returns the resultant dataframe.

A more exhaustive overview of the read_data code follows:

Previously I've created two useful strings.
```{r}
    localdir=getwd()
    datadir="UCI HAR Dataset"
```
The first setting the current working directory, the second setting the base data directory within the working directory.

Next we start building path strings to make the actual read-in less painful than co
mpletely literal path entry. If you are unfamiliar with the paste function, it concatenates strings.
```{r}
    tpath =  paste(localdir,datadir,setstring,sep='/')
    xname =  paste("X_",setstring,suffix,sep='')
    yname =  paste("y_",setstring,suffix,sep='')
    subtname = paste("subject_",setstring,suffix,sep='')
```
and read with
```{r}
    xset = read.table(file=paste(tpath,'/',xname,sep=''),header=FALSE)
    subtset = read.table(file=paste(tpath,'/',subtname,sep=''),header=FALSE)
```
The individual elements xset, yset, and subject set are then combined into a coherent dataframe in the order SubjectID(subtset), ActivityID(yset), and gps readings (xset).

Run_Analysis.R
===================
Required Packages: Plyr, Reshape2
I used plyr because I prefer its *join* function to the base *merge*. I find it has a more intuitive syntax in context of the script creates a stable join.

The first section sources the get_data script to download data if it doesn't already exist.

Next we get our fully constructed dataframes with the *read_data* function. Their composition is outlined in the section on *get_data* but as a reminder they are of the form subjectID, Activity, GPS_Measures.

```{r}
    trn = read_data("test")
    tst = read_data("train")
```

Additionally we read in two additional "helper" files. One allows us to look up activity labels. E.g. does the integer 1 mean Walking or Running? The second file contains a description of what each column in the x-sets mean. Because right now we just have numbers, and if you were to look at the dataframe they'd be labled V1, V2 etc.

```{r}
##### READ IN ACTIVITY LABELS, FEATURES (x col names)
    actLabel = read.table(file=paste(localdir,datadir,"activity_labels.txt",sep='/'),stringsAsFactors=FALSE)
    xLabel = read.table(file=paste(localdir,datadir,"features.txt",sep='/'),stringsAsFactors=FALSE)
```

The features contain characters that may cause issues - commas and parentheses etc.
We strip these by doing global substitution on the name vector with
```{r}
    ## Strip special characters from labels for cleanliness and so some functions don't choke.
    xLabel[,2] = sapply(xLabel[,2], function(arg) 
      { 
      arg = gsub(arg, pattern='\\(|\\)', replacement='');
      arg = gsub(arg, pattern='[[:punct:]]', replacement='.') 
      } 
    )
```
Next we concatenate the **trn** and **tst** dataframes with the rbind function.
```{r}
    complete = rbind(trn,tst)
```

This is a good start, but if you were to hand the **complete** dataframe to someone, they'd have no idea what it means because none of the columns are labeled as anything other than V1, V2! The next bit does this.
```{r}
    colnames(complete) = c("sid","activity",xLabel[,2])
```
The *colnames* function returns a vector of column names from a dataframe. Right now it's V1, V2 and so on. We set this equal to a new vector of column names we've created: sid, activity, and so on. 

But why xLabel[,2]? Because xLabel is a 2 by 561 dataframe where the first column is a number 1,2,3 and so on, and the 2nd column is the measurement name tBodyAcc-mean()-X. xLabel[,2] uses indexing to say "Select all rows, column 2 of the dataframe."

Following this we give one of the columns in the actLabel dataframe a name. 
```{r}
    colnames(actLabel)[1] = c("activity")
```
This is done to make the join we do later replacing 1 with "Walking" and so on easier. The line that actually does this is
```{r}
    complete$activity = join(x=complete[,1:2],y=actLabel,by="activity")[,3]
```
But piece by piece: *join* is part of the 'plyr' package. It functions identically to a SQL join. So the *join* command takes the first 2 columns of complete (sid,activity) and joins them with actLabel based on the activity column. 

This join command creates a new dataframe with: sid,activity(integer),activity(string). So one line might be: '3 1 Walking'. the [,3] at the end of the join selects only this last column and assigns it to complete's activity column thus replacing 1 with Walking and so on. 

But wait, all we want are variables dealing with mean and standard deviation (or 'std' as the data dictionary abbreviates it).
Previously we've used integer based indexing, but we can also use column names.So how do we know which ones to pick? The *grep* funtion allows us to search for strings and return those containing pre-defined patterns which is done below. E.g. this *grep* searches for "sid" or "activity" or any strings containing mean or std anywhere in the word without regard to case. You'll note that we're turning *grep* loose on the full column names. So grep will return only those column names we search for, effectively recreating the **complete** dataframe with all rows, but only the columns grep found.
```{r}
    complete = complete[,
                    grep(pattern="sid|activity|*mean*|*std*",
                         x=colnames(complete),ignore.case=TRUE)]
```

Finally we're at a point where we can do the actual analysis!
What we've been tasked to find is the mean of our variables broken out by subject id and activity type. So 1:Walking, 2:Walking, 3:Laying etc. with *aggregate*.
```{r}
    #Skip first 2 columns of set because they're subject-id and activity.
    tidy = aggregate(x=complete[,3:88],by=complete[,c("sid","activity")],FUN=mean)
```
The function finds the mean of each data column (3:88) by combination of Subject-ID (sid) and activity.

Additionally, for future analysis it may be useful to know the subset sample sizes, like Subject 1 had 52 observations for Standing, 62 for walking and so on. To find this we'll create a frequency variable and bind it into the **tidy** frame.

The first statement splits based on sid,activity combinations and counts the number of rows. The returned **countframe** is sid,activity,nrow.

```{r}
      ## create column containing frequency count of SubjID & Act to help with further 
    ## analysis. 
    countframe = ddply(complete[,1:2],.(sid,activity),nrow)
```

Following we match based on sid and activity, since ordering of the frames isn't assured, and finally add the new column to **tidy** with *cbind*.
```{r}
    ## Match count on sid and activity in tidy frame.
    countframe = join(x=tidy[,1:2],y=countframe,by=c("sid","activity"))

    ## Bind new column into frame.
    tidy = cbind(tidy[,1:2],freq=countframe[,3],tidy[,3:88])
```

But now we've changed the data without changing the variable names! So that's our next step. Using the same *colnames* trick we used earlier, we're going to change the variable names.
```{r}
    # add meanby_sid_act prefix.
    colnames(tidy) = paste("mean_",colnames(tidy),sep='')
```
Which prepends "mean_" to all the column names... Including sid and activity. Whoops! This is fixed with
```{r}
    #Reset sid and activity names. Let's choose something more human-readable than sid too.
    colnames(tidy)[1:2] = c("subjID","activity","freq")
```

The goal with this pre-pending is so glancing at any of the variables allows the user/analyst to identify which dataset they're working with - the raw or tidy version.  

Create a "melted" row-oriented data-set. I've opted to include the subset frequency (variable 'freq') for each row because it may be necc. if various statistical calculations or weighting schemes are used based on the variable.
```{r}
    tidy = melt(data=tidy,id.vars=colnames(tidy[,1:3]),measure.vars=colnames(tidy[,4:ncol(tidy)]))
```

And finally we write our newly made "tidy" data with:
```{r}
    #Then write the table
    write.table(tidy,file="mean_by_subj_id_tidy_tableout.txt",quote=TRUE,col.names=TRUE,row.names=FALSE)
```