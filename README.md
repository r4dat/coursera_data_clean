Get_Data.R
===================
This is my standard base "get-data" script. It checks for the existence of the downloaded data files or if the named dataframes are already in memory. If neither of these things is true, it downloads the hard-coded url and expands as needed. The script is boilerplate and the code is identical to that in the run_analysis.R script. Kept in-repository because I always start there.

Run_Analysis.R
===================
Required Packages: Plyr
>I used plyr because I prefer its *join* function to merge. I find it has a more intuitive syntax in context of the script creates a stable join.