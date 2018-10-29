import sys
import random
import string
if(len(sys.argv) != 3):
    print("Usage: python script.py filenumber numberoflines")
else:
    f = open("test_csv"+sys.argv[1]+".csv", "w")
    f.write("name,date,id,points\n")
    for i in range(0,int(sys.argv[2])):
        name = ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(8))
        date = "2018-"+str(random.randint(1,12)) + "-" + str(random.randint(1,27))
        usr_id = str(i)
        points = str(random.randint(1,3000))
        f.write(name +","+date +","+usr_id+","+points+"\n")
