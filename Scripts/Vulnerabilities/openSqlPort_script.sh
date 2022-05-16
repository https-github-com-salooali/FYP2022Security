#! /bin/bash

for i in `cat fileac.txt`;do
 
echo "Scanning for:" $i

result=$(sudo nmap -p 3306 -sS --data-length 10 $i --host-timeout 10m -Pn | grep open)
echo $result
if [[ -z $result ]];then
	echo $i close >>sqlopen.txt
else
	echo $i open >>sqlclose.txt
fi
done

