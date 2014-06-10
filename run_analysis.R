require(plyr)
require(reshape2)
source("get_data.R")
# Set string Variables
localdir=getwd()
datadir="UCI HAR Dataset"

## Sourced from get_data file.
## Test if dataframe or data-dir etc exists
download_data()

##### READ IN DATA FILES
## Se GET_DATA.R function.

# function expects test or train strings. 
trn=read_data("test")
tst=read_data("train")

##### READ IN ACTIVITY LABELS, FEATURES (x col names)
actLabel = read.table(file=paste(localdir,datadir,"activity_labels.txt",sep='/'),stringsAsFactors=FALSE)
xLabel = read.table(file=paste(localdir,datadir,"features.txt",sep='/'),stringsAsFactors=FALSE)

# Concatenate training and test frames.
complete=rbind(trn,tst)

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

## create column containing frequency count of SubjID & Act to help with further 
## analysis.
countframe = ddply(complete[,1:2],.(sid,activity),nrow)

## Match count on sid and activity in tidy frame.
countframe = join(x=tidy[,1:2],y=countframe,by=c("sid","activity"))

## Bind new column into frame.
tidy=cbind(tidy[,1:2],freq=countframe[,3],tidy[,3:88])


# add meanby_sid_act prefix.
colnames(tidy)=paste("mean_",colnames(tidy),sep='')

#Reset sid and activity names. Change sid to subjID
# -- little more human readable and since we're done working with the data, why not?
colnames(tidy)[1:3]=c("subjID","activity","freq")

# Melt dataframe into true row-oriented fashion.
tidy = melt(data=tidy,id.vars=colnames(tidy[,1:3]),measure.vars=colnames(tidy[,4:ncol(tidy)]))

#Write table.
write.table(tidy,file="mean_by_subj_id_tidy_tableout.txt",quote=TRUE,col.names=TRUE,row.names=FALSE)