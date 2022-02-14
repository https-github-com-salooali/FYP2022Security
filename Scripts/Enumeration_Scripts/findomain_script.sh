#!/bin/bash
filename='net_domain.txt'
filename1='.txt'
filename2='findomain_'
mkdir net

n=1
while read line; do
# reading each line
SUBSTRING=$(echo $line| cut -d'.' -f 1)
echo "$SUBSTRING"
mkdir net/"${SUBSTRING}"
findomain -t "$line" -u  net/"${SUBSTRING}"/"${filename2}${SUBSTRING}${filename1}"




n=$((n+1))
done < $filename
