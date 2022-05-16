#!/bin/bash
filename=''
filename1=').xml'
filename2='('
filename3=').html'

mkdir IP

# For nmap Installation
read -p "Do you want to install nmap $foo? [y or n]" answer
if [[ $answer = y || $answer = Y ]] ; then
  sudo apt-get install nmap
fi



# File read
read -p 'Input file name: ' filename

# Nmap command
n=1
while read line; do
# reading each line
echo "$line"

nmap -sV --script "discovery, vuln, not (brute or dos)" --script-timeout 40m --host-timeout 45m -T4 "$line" -oX IP/'('${line}')'.xml

# HTML Conversion
xsltproc IP/${filename2}${line}${filename1} -o IP/'('${line}')'.html

n=$((n+1))
done < $filename


