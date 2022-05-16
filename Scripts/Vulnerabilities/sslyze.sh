#/bin/bash    

filename=''


mkdir sslyze_folder

# For sslyze Installation
read -p "Do you want to install sslyze $foo? [y or n]" answer
if [[ $answer = y || $answer = Y ]] ; then
  pip install --upgrade pip setuptools wheel
  pip install --upgrade sslyze
fi

# File read
read -p 'Input file name: ' filename

n=1
while read line; do
# reading each line
echo "$line"
sslyze ${line} >> sslyze_folder/${line}.txt
n=$((n+1))
done < $filename



