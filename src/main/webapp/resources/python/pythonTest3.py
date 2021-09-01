# -*- coding: utf-8 -*-
import sys
import mysql.connector

def main33():
    mydb = mysql.connector.connect(host="localhost", user="root", password="m1234", database="ufo")
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM member")
    myresult = mycursor.fetchall()
   
    for x in myresult:
        print(x)
    
    n= 0
    print(n)

if __name__ == '__main__':
    globals()[sys.argv[1]]()
   
    sys.exit(220)