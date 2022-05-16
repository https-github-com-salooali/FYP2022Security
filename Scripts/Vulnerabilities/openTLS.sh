#!/usr/bin/env bash



# File read
read -p 'Input file name: ' filename


for i in `cat $filename`; do 

echo $i
if echo Q | timeout 3 openssl s_client -connect $i:443 -tls1_3 2>/dev/null; then
  echo "$i" "enabled" >>tls.txt
else
echo "$i" "disabled" >>tls.txt
fi
done
