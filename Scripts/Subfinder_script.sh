#!/bin/bash
filename='net_domain.txt'
filename1='.txt'
filename2='subfinder_'



n=1
while read line; do
# reading each line
SUBSTRING=$(echo $line| cut -d'.' -f 1)
subfinder -d "$line" -o net/"${SUBSTRING}"/"${filename2}${SUBSTRING}${filename1}"   -all -v

n=$((n+1))
done < $filename
