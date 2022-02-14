#!/bin/bash
#usage: ./httpscheck <URL_OR_DOMAIN>:<optional_port>
#eg: ./httpcheck microsoft.com:3333
#eg2: ./httpcheck google.com (without port, default is 443)
#eg3: ./httpcheck https://www.apple.com (default port is 443)
#eg4: ./httpcheck sub1.sub2.sub3.domain.com:9991

# Get the URL or Subdomain
for i in `New_Assets.txt`; do
i=${i::-1}
     
if timeout 10 wget -q --spider https://$i 2>/dev/null; then
	 
  ffuf -w wordlist.txt -u https://$i/FUZZ -maxtime 60 -o $i.html -of html
else
	 
  ffuf -w wordlist.txt -u http://$i/FUZZ -maxtime 60 -o $i.html -of html
fi 
	 
done