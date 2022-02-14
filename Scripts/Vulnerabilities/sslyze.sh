#/bin/bash    

filename='comon.txt'


mkdir sslyze_folder

n=1
while read line; do
# reading each line



echo "$line"
sslyze ${line} >> sslyze_folder/${line}.txt
n=$((n+1))
done < $filename