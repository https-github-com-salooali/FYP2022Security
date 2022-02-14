#/bin/bash    

filename='assets.txt'
filename2='https://'
filename4='http://'

mkdir lighthouse

n=1
while read line; do
# reading each line



line=${line::-1}
echo "$line"
if timeout 15 wget --spider https://$line 2>/dev/null; then
  echo "https is present"
  lighthouse https://${line} --only-categories=best-practices --output-path lighthouse/${line}.html
else
  echo "https not present"
  lighthouse http://${line} --only-categories=best-practices --output-path lighthouse/${line}.html
fi
n=$((n+1))
done < $filename