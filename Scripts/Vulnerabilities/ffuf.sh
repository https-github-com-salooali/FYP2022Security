#!/bin/bash

# For ffuf Installation
read -p "Do you want to install ffuf $foo? [y or n]" answer
if [[ $answer = y || $answer = Y ]] ; then
  sudo go install github.com/ffuf/ffuf@latest
fi

# File read
read -p 'Input file name: ' filename

# Get the URL or Subdomain
for i in `cat $filename`; do
   
if timeout 10 wget -q --spider https://$i 2>/dev/null; then
	 
  ffuf -w wordlist.txt -u https://$i/FUZZ -maxtime 60 -o $i.html -of html
else
	 
  ffuf -w wordlist.txt -u http://$i/FUZZ -maxtime 60 -o $i.html -of html
fi 
	 
done


