#! bin/bash

for i in `cat wpjsonfiles.txt`;do

 cve=( $(cat $i.json | jq .version.vulnerabilities[].references.cve[] | tr -d '""') )
 domain=$(cat wpSuccessTest.txt | grep $i | cut -d ' ' -f 1 | head -n 1)
 echo "======================================"
 
  if [[ -n $cve ]];then
 	for i in "${cve[@]}";do
 	echo $domain,$i >> cves5.csv
	
	done 
	  	
 	 echo $domain,$cve  
 
 	 
 else
 
  echo $domain,"NO Critical CVE's" >> cves5.csv
 fi
 
 
 
done
