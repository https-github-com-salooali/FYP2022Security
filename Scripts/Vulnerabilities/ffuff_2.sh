 
# Get the URL or Subdomain
for i in `cat rootDomain_1.txt`; do
 
    echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ Scanning for $i ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
domain=$(echo $i | httpx) 
if [[ -n $domain ]];then
	 
   #ffuf -w /usr/share/seclists/Discovery/Web-Content/raft-medium-directories-lowercase.txt -u $domain/FUZZ -o $domain.html -of html -t 40 -p '0.5-0.10' -t 60 -fr '/\..*' -ac -fc 404,505,501,502,401,500,400 -maxtime 60
   ffuf -w /usr/share/seclists/Discovery/Web-Content/raft-medium-directories-lowercase.txt -u $domain/FUZZ -o $i.html -of html -t 60 -p '0.5-0.10' -fr '/\..*' -ac -fc 404,505,501,502,401,500,400
  echo $i $i.html >>ffufResult.txt
else
  echo $i "not_live"
  echo $i "not_live" >>ffufResult.txt
  #ffuf -w wordlist.txt -u http://$i/FUZZ -maxtime 60 -o $i.html -of html
fi 
done
