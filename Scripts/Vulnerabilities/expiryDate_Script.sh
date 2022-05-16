#! /bin/bash
filename='LIVE_Assets_Final.txt'
while read line;do
domain=$line
 
date=$(echo | timeout 3 openssl s_client -servername $domain -connect $domain:443 2>/dev/null | openssl x509 -noout -enddate | grep notAfter | sed 's/notAfter=//')
 
echo "$domain"  "$date"
 
if [ -n "$date" ]
then	
	echo "$domain","$date" >>expirtyDates.txt
fi
done <$filename
