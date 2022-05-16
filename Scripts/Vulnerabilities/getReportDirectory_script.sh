#!/bin/bash
 


# give the path of joomscan directory. Run the script in joomscan directory.
path=$(pwd)

for dir in $path/reports/*
do
    echo $dir
    
     	new=`echo $dir | cut -d / -f 11`
        echo $new
   	 htmlfile=$(find $path/reports/$new -name "*.html" | cut -d / -f 12 | head -n 1)
    	echo $htmlfile
    	cp $path/reports/$new/$htmlfile $path/joomlaReports
    	echo $new $htmlfile >>joomladashlist.txt
     
done
