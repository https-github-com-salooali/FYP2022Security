# importing the libraries
from bs4 import BeautifulSoup
import requests
from PIL import Image


file = open("output.txt","w")

i = 0
link = []
input_string = [".gop.pk", ".gov.pk", ".edu.pk", ".net.pk", ".org.pk"]
for x in input_string:
    print(str(i)+x+"\n")
    i+=1
i=0
string = input("Enter the Digit\n")
string = input_string[int(string)]
url="https://www.google.com/search?q="+string+"&ei=iwamYfr2A6iPxc8P26qA0A4&start=0&sa=N&ved=2ahUKEwi66N3K-b_0AhWoR_EDHVsVAOo4KBDy0wN6BAgBEDM&biw=1920&bih=969&dpr=1"
for x in range(24):
    html_content = requests.get(url).text
    soup = BeautifulSoup(html_content, "lxml")
    print("fetching...\n")

    for a in soup.find_all('a', href=True):
        if a['href'][10] == string[0] and a['href'][11] == string[1] and a['href'][12] == string[2] and a['href'][13] == string[3]:
            url = 'https://www.google.com'+a['href']
    
    


    for link in soup.findAll('a'):
        if ".pk/"in link['href'] and "google" not in link['href']:
            file.write(link['href']+"\n")

print("completed...\n")

    
 




