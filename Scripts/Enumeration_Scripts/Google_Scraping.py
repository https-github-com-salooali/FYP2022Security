# importing the libraries
from bs4 import BeautifulSoup
import requests
from PIL import Image


file = open("gop.txt","w")


link = []
url="https://www.google.com/search?q=.gop.pk&ei=iwamYfr2A6iPxc8P26qA0A4&start=0&sa=N&ved=2ahUKEwi66N3K-b_0AhWoR_EDHVsVAOo4KBDy0wN6BAgBEDM&biw=1920&bih=969&dpr=1"
for x in range(24):
    html_content = requests.get(url).text
    soup = BeautifulSoup(html_content, "lxml")
    print(soup)

    for a in soup.find_all('a', href=True):
        if a['href'][10] == '.' and a['href'][11] == 'g' and a['href'][12] == 'o' and a['href'][13] == 'p':
            url = 'https://www.google.com'+a['href']
    
    


    for link in soup.findAll('a'):
        if ".pk/"in link['href'] and "google" not in link['href']:
            file.write(link['href']+"\n")
    
 




