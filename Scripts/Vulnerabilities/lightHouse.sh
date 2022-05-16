#/bin/bash    

filename=''

mkdir lighthouse

# For lightHouse Installation
read -p "Do you want to install LightHouse $foo? [y or n]" answer
if [[ $answer = y || $answer = Y ]] ; then
  sudo npm install -g lighthouse
fi

# File read
read -p 'Input file name: ' filename


# For Vuln. Js lib
n=1
while read line; do
# reading each line
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
