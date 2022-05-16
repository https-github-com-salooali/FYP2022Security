#!/bin/bash
filename='domain.txt'


# For Amass Installation
read -p "Do you want to install Amass $foo? [y or n]" answer
if [[ $answer = y || $answer = Y ]] ; then
  sudo snap install amass
fi


read -p 'Input file name: ' filename


# For Enumeration
n=1
while read line; do
# reading each line

SUBSTRING=$(echo $line| cut -d'.' -f 1)
amass enum -passive -d "$line" -o ${SUBSTRING}.txt

n=$((n+1))
done < $filename
