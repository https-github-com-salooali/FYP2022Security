#!/bin/bash

# enter the path for cmseek.py file.
# cmSeek accept the file with comma seprated enteries.

sed -z -i.bak 's/\n/,/g;s/,$/\n/' testfile.txt  
python3 cmseek.py --batch --no-redirect -o -l testDomain.txt

# enter the path of result directory which is present in CmSeek folder
cd Result

for dir in *
do
    for file in "$dir"/*
    do
        if [[ -f $file ]]
        then
         
            cms=$(jq -r '.cms_name' $file)
             if [ -n "$cms" ]
            then
                #echo $dir $cms >> cms.txt
                if [[ $cms = "WordPress" ]]
                then 
                	echo $dir $cms >>wordpress.txt
                elif [[ $cms = "Joomla" ]]
                then
                	echo $dir $cms >>joomla.txt
                elif [[ $cms = "Drupal" ]]
                then
                	echo $dir $cms >>drupal.txt
                else
                 	echo $dir $cms >>other.txt
                fi
            else
                echo $dir "no_cms" >>nocms.txt
            fi
    fi
    done
done

cat nocms.txt other.txt wordpress.txt joomla.txt drupal.txt >> cms.txt
