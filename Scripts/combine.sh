#!/bin/bash
for dir in */; do
    if [ -d "$dir" ]; then
        cd "$dir"
        for dir2 in */; do
            if [ -d "$dir2" ]; then
                ( cd "$dir2"
	  
	        cat subfinder_*.txt findomain_*.txt amass_*.txt | sort -u > combine.txt

	         
	   
	) 
            fi
        done
        cd ..
    fi
done
