#Reading a file
with open('file.txt') as f:
    Input = f.readlines()
i = 0
r=0
length = len(Input)
array = []

#appending sorted maped IPs in an array
for x in Input:
    if x[-2] != 'k' and x[-2] != '=' and x[-2] != 'u' :
        

        if (array.count(x) == 0):
            array.append(x)

            z = 0
            count = 0
            while(z<length-1):
                if Input[z] == x: #727

                    for y in range(z,0,-1):
                        if Input[y][-2] == 'k' or Input[y][-2] == 'u' :
                            array.append(Input[y])
                            break
                    count+=1
                z+=1
            array.append("IP: "+x+"Count: "+str(count))



                

            print(x)

            array.append("\n"*5)
     
    i+=1



    
#Writing array to file
file = open('out.txt','w')
for x in array:
    file.write(x) 
print(array)

        
        





