#!/bin/bash
filename='ip.txt'
filename1=').xml'
filename2='('
filename3=').html'

mkdir IP

n=1
while read line; do
# reading each line
echo "$line"
line=${line::-1}
nmap -sV --script "discovery, vuln, not (brute or dos)" --script-timeout 40m --host-timeout 45m -T4 "$line" -oX IP/${filename2}${line}${filename1} 

xsltproc IP/${filename2}${line}${filename1} -o IP/${filename2}${line}${filename3}

n=$((n+1))
done < $filename
