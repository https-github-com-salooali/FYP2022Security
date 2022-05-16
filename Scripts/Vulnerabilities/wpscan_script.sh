#!/bin/bash


for i in `cat rem4.txt`;do
url=$i
echo $i
final_hostname=$( timeout 40 curl $url -s --insecure -L -I -o /dev/null -w '%{url_effective}')

if [ $? -eq 0 ];then
	url=$final_hostname
	final_hostname=$(echo ${final_hostname////_}  )	
	if [ "$(ls $final_hostname.html   | wc -l)" = "1" ];then
			 echo $i $final_hostname".html" >> wpSuccessTest.txt
			continue
		else
			 echo "================================================scanning for wpscan======================================================"
	wpscan --url $url --enumerate vp,vt,u,cb,dbe --rua --wp-version-detection mixed --connect-timeout 60 --force -o $final_hostname.json -f json --api-token kFgLHtevNdloGasWTYrRIcJZC3ansaV5GULfYJDLzjg
			 echo "hogye scan"	 
		 	 python3 -m wpscan_out_parse $final_hostname.json --format html > $final_hostname.html
		 	 echo $i $final_hostname".html" >> wpSuccessTest.txt	
		 	 req=$(jq -r '.vuln_api.requests_remaining'  $final_hostname.json)
		 	 
		 	 if [ "$req" -lt "5" ]
		 	 	then
		 	 		echo "$req" "khatm ha boss"
		 	 		break
		 	 	elif [ "$req" -gt "5" ]
		 	 	then
		 	 		echo "$req" "abhi hain"
		 	 	else
		 	 	 
		 	 		echo "$req" "abhi ha boss"
		 	 fi
	fi
	
else 
	echo $i "connection Error" >>redirectionFailed2.txt

fi
done

echo "======================API LIMIT IS REACHED============================="
	
