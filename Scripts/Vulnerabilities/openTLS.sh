#!/usr/bin/env bash
for i in `cat assets.txt`; do 
i=${i::-1}
echo $i
if echo Q | timeout 3 openssl s_client -connect $i:443 -tls1_3 2>/dev/null; then
  echo "$i" "enabled" >>tls.txt
else
echo "$i" "disabled" >>tls.txt
fi
done