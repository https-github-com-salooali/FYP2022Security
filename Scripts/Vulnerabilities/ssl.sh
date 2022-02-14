#/bin/bash    
filename='tls_enabled.txt'
n=1
while read line; do
# reading each line
line=${line::-1}
echo "$line"
if timeout 15 wget --spider https://$line 2>/dev/null; then
  echo "https is present"
  echo "$line","enabled" >> ssl.txt
else
  echo "https not present"
  echo "$line","disabled" >> ssl.txt
fi

n=$((n+1))
done < $filename