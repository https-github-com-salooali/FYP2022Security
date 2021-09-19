#!/bin/bash
filename='org_domain.txt'
filename1='.txt'
filename2='amass_'

mkdir org

n=1
while read line; do
# reading each line
SUBSTRING=$(echo $line| cut -d'.' -f 1)
mkdir org/"${SUBSTRING}"
amass enum -passive -d "$line" -o org/"${SUBSTRING}"/"${filename2}${SUBSTRING}${filename1}" 

n=$((n+1))
done < $filename
