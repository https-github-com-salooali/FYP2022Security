#! /bin/bash
filename='LIVE_Assets_Final.txt'
while read line;do
domain=$line


result=$(echo | timeout 3 openssl s_client -connect $domain:443 2>/dev/null | openssl x509 -noout -checkend 0 | sed 's/ //g')
echo "$domain" "$result"
if [[ $result = "Certificatewillexpire" ]]; then
  echo  "$domain" "Expired" >>expiredCert.txt
elif [[ $result = "Certificatewillnotexpire" ]]
then
	echo "$domain" "Not Expired" >>expiredCert.txt
else
  echo "$domain" "NO FOUND" >>NOSSL.txt
fi
done <$filename
