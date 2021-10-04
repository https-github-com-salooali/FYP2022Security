#This script is used to verify that we are having a valid IPs and domains that we have collected so far.
#This script is specifically for the output of h2i tool as it gives the output of both like this: www.example.com 191.123.123.12





file_content = open("ipDomain.txt","r") 		 
domain_file = open("domain.txt","w") # this is for storing the all the domains seprately 
IPFILE = open("myIPFile.txt","r")    # this is where we have all the unique ips 
file_content_list = file_content.readlines()
ip_content_list = IPFILE.readlines()
names=[]
ips=[]
mainList=[]
myipList=[]
#print(ip_content_list)
 
for list_item in file_content_list:
     
    ipList = list_item.split()
    mainList.append(ipList)
     
    names.append(ipList[0])
    ips.append(ipList[1])
     
# for ip in ips:		here is first we get all the ips from the main file and than make the ip file having unique ips in myIPFILE.txt
#     IPFILE.write(ip)
#     IPFILE.write('\n')

# for ip in ip_content_list:
#     ipItem = ip.split()
#     myipList.append(ipItem)

#for domain in mainList:        this is for writing the domain in the domain.txt file.   
#    domain_file.write(domain[0])
#    domain_file.write('\n')

totalDomains=0
 
    
    print(ip[0])
    print("=============================")
    count=0
    
    for domain in mainList:
        #print(domain[1])
        if(ip[0] == domain[1]):
            #print("conditon ture\n")
            print(domain[0])
            count +=1
        else:
            pass
        
    totalDomains+=count
    print("\n")
    print("Count:",count)
    print("totalDomains:",totalDomains)
    print("\n")
