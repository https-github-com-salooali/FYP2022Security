#! /bin/bash

for i in `cat newSubdomains.txt`;do
url=$i
echo $url
#path of corsy.py file
echo $url | httpx | python3 corsy.py -o /home/salman/Desktop/FYP-DIRECTORY_last/Live_Assets/Corsy/reports/$url.json | aha >> /home/salman/Desktop/FYP-DIRECTORY_last/Live_Assets/Corsy/reports/$url.html

if [ "$(ls /home/salman/Desktop/FYP-DIRECTORY_last/Live_Assets/Corsy/reports/$url.json | wc -l)" = "1" ];then
echo $url FOUND_CORS $url.html >>CorsResult.txt
else
echo $url NOT_FOUND $url.html >>CorsResult.txt
fi
done
