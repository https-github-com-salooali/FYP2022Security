#!/bin/bash
filename='domain.txt'

read -p 'Input file name: ' filename

# For Enumeration
n=1
while read line; do
# reading each line

SUBSTRING=$(echo $line| cut -d'.' -f 1)
findomain -t "$line" -u  ${SUBSTRING}.txt

n=$((n+1))
done < $filename
