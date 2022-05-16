# importing the libraries
from bs4 import BeautifulSoup
import requests
from PIL import Image
import os
import os.path

file_exists = os.path.exists('grades')

if file_exists == False:
    os.mkdir('grades') 


file_name = input("Input File Name:\n")


with open(file_name) as f:
    dom = f.readlines()
missing = ""
grade = "Dummy"
file1 = open('output.csv','w')

for site in dom:
	url="https://securityheaders.com/?q="+site+"&hide=on&followRedirects=on"


	# Make a GET request to fetch the raw HTML content
	html_content = requests.get(url).text
	print("processing...")

	# Parse the html content
	soup = BeautifulSoup(html_content, "lxml")
	gdp_table = soup.findAll("th", attrs={"class": "tableLabel table_red"})
	title = soup.find("meta", property="twitter:img")
	url = title.get("content")
	img_data = requests.get(url).content


	image_name = site[:-1]
	characher = url[len(url)-5:-4]

	if characher != "/":

		with open("grades/"+image_name+".png", 'wb') as handler:
			handler.write(img_data)
		im = Image.open("grades/"+image_name+".png")
		im = im.resize((30, 30))
		im.save("grades/"+image_name+".png")


	for link in soup.find_all("span"):
		if len(link.text) == 1: 
			grade = link.text

	for x in gdp_table:
		missing = missing+"--"+x.text

	if missing == "":
		missing = "No data"
	if grade == "":
		grade = "No data"
	
	file1.write(site+","+grade+","+missing+"\n")
	f.close
	missing = ""
	grade = ""
	
