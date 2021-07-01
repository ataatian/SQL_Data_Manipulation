#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jun 29 11:57:48 2021

@author: nooshinnejati
"""

import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="Qw123456!"
)

print(mydb)

####### Creating a database
mycursor = mydb.cursor()

mycursor.execute("SHOW DATABASES")

for x in mycursor:
  print(x)
  
## 0) Create a database
mycursor.execute("CREATE DATABASE mydatabase")



####################################################
####################################################
import mysql.connector

cnx = mysql.connector.connect(host='localhost', user='root', password='Qw123456!', database='Ali1')
print(cnx)
print(type(cnx))

AliCon = cnx.cursor(buffered=True)
print(type(AliCon))

AliCon.execute("SELECT  * FROM Ali1.a;")

output = AliCon.fetchall()
print(type(output))
   
print ( output) 

## 0) Create a table
AliCon.execute("CREATE TABLE customers (name VARCHAR(255), address VARCHAR(255))")

AliCon.execute("SHOW TABLES")

for x in AliCon:
  print(x)

## Adding Primary ID column
AliCon.execute("ALTER TABLE customers ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY")

### 1) Insert Into Table
sql = "INSERT INTO customers (name, address) VALUES (%s, %s)"
val = ("John", "Highway 21")

sql = "INSERT INTO customers2 (name, address) VALUES (%s, %s)"
val = [
  ('Peter', 'Lowstreet 4'),
  ('Amy', 'Apple st 652'),
  ('Hannah', 'Mountain 21'),
  ('Michael', 'Valley 345'),
  ('Sandy', 'Ocean blvd 2'),
  ('Betty', 'Green Grass 1'),
  ('Richard', 'Sky st 331'),
  ('Susan', 'One way 98'),
  ('Vicky', 'Yellow Garden 2'),
  ('Ben', 'Park Lane 38'),
  ('William', 'Central st 954'),
  ('Chuck', 'Main Road 989'),
  ('Viola', 'Sideway 1633')
]

val = [
  ('Peter', 'Lowstreet 4'),
  ('Amy', 'Apple st 652')
]


AliCon.execute(sql, val)

mydb.commit()

print(AliCon.rowcount, "record inserted.")

print("1 record inserted, ID:", AliCon.lastrowid)

### 2) Select From a Table
AliCon.execute("SELECT * FROM a")
AliCon.execute("SELECT LenderID, Debt FROM a")

####### START

## 2-0)
cnx = mysql.connector.connect(host='localhost', user='root', password='Qw123456!', database='Ali1')
AliCon = cnx.cursor(buffered=True)

## 2-1)
sql = "SELECT * FROM a WHERE LenderID =90411"
sql = "SELECT LenderID, Debt FROM a WHERE LenderID =90411"
sql = "SELECT LenderID, UltimateParent_L_name  FROM a WHERE UltimateParent_L_name LIKE '%Corp%'"

## Preventing SQL Injection
sql = "SELECT LenderID, PrimaryPurpose FROM a WHERE PrimaryPurpose = %s"
adr = ("Corp. purposes", )

sql = "SELECT LenderID, UltimateParent_L_name  FROM a WHERE UltimateParent_L_name LIKE '%Corp%' ORDER BY UltimateParent_L_name DESC"
sql = "SELECT LenderID, UltimateParent_L_name  FROM a WHERE UltimateParent_L_name LIKE '%Corp%' LIMIT 5"
sql = "SELECT LenderID, UltimateParent_L_name  FROM a WHERE UltimateParent_L_name LIKE '%Corp%' LIMIT 5 OFFSET 20"


## 2-2)
AliCon.execute(sql)

AliCon.execute(sql, adr)


## 2-3)
## Fetch ALL
myresult = AliCon.fetchall()

for x in myresult:
  print(x)

####### END

## Fetch ONE
myresult = AliCon.fetchone()

print(myresult)


#### 3) Deleting Records
sql = "DELETE FROM a WHERE UltimateParent_L_name = 'AEON Funding Corp'"

AliCon.execute(sql)

cnx.commit()

print(AliCon.rowcount, "record(s) deleted")

### Deleting a Table
sql = "DROP TABLE IF EXISTS INSECT"

AliCon.execute(sql)

#### 4) Update existing records
sql = "UPDATE a SET LenderID = 1111111 WHERE UltimateParent_L_name = 'Advisco Capital Corp'"

AliCon.execute(sql)

cnx.commit()

print(AliCon.rowcount, "record(s) affected")


############################################
############################################
import pandas as pd
import os

os.chdir('/Users/nooshinnejati/D/DH/3_Oct2020_Bank/')
path = os.getcwd()
print(path)
df = pd.read_stata('R.dta')
##1,720; 17 variables

#### Creating the database
import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="Qw123456!"
)


####### Creating a database
mycursor = mydb.cursor()

mycursor.execute("SHOW DATABASES")

for x in mycursor:
  print(x)
  
## Create a database
mycursor.execute("CREATE DATABASE mySTATA_SQL")


### Creating the table
from sqlalchemy import create_engine

# Create SQLAlchemy engine to connect to MySQL Database
engine = create_engine("mysql+pymysql://{user}:{pw}@{host}/{db}"
				.format(host="localhost", db='mySTATA_SQL', user="root", pw="Qw123456!"))

# Convert dataframe to sql table                                   
df.to_sql('R', engine, index=False)
##engine.execute('ALTER TABLE R ADD PRIMARY KEY (`PERMNO_Year`)')

##engine.execute("ALTER TABLE R ADD COLUMN PERMNO_Year INT AUTO_INCREMENT PRIMARY KEY")

### The second table
df = pd.read_stata('M.dta')
df.to_sql('M', engine, index=False)
engine.execute("ALTER TABLE M ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY")
#########

#### Join 
sql = "SELECT * FROM M INNER JOIN R ON M.PERMNO_Year = R.PERMNO_Year"
sql = "SELECT * FROM M LEFT JOIN R ON M.PERMNO_Year = R.PERMNO_Year"
sql = "SELECT * FROM M RIGHT JOIN R ON M.PERMNO_Year = R.PERMNO_Year"



cnx = mysql.connector.connect(host='localhost', user='root', password='Qw123456!', database='mySTATA_SQL')


AliCon = cnx.cursor(buffered=True)

AliCon.execute(sql)

output = AliCon.fetchall()
print(len(output[1717]))
dfR = pd.DataFrame(output)
print(df.iloc[0])




