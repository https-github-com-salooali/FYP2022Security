#!/bin/bash
filename='domain.txt'


# For Subfinder Installation
read -p "Do you want to install Subfinder $foo? [y or n]" answer
if [[ $answer = y || $answer = Y ]] ; then
  sudo go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
fi


read -p 'Input file name: ' filename


# For Enumeration
n=1
while read line; do
# reading each line

SUBSTRING=$(echo $line| cut -d'.' -f 1)
subfinder -d "$line" -o ${SUBSTRING}.txt -v

n=$((n+1))
done < $filename
