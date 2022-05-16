#/bin/bash    
filename=''
n=1

# File read
read -p 'Input file name: ' filename

while read line; do
# reading each line
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
