#!/bin/bash
 

for i in `cat joomlaList2.txt`; do



final_hostname=$(timeout 40 curl $i -s --insecure -L -I -o /dev/null -w '%{url_effective}')
 
	 perl joomscan.pl --url $final_hostname -r  -timeout 35
 
		 
done
