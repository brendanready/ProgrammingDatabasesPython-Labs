#!/usr/bin/env python
# coding: utf-8

# In[1]:


import sys, os, sqlite3, pandas as pd, sqlite3
from contextlib import closing
from sqlalchemy import create_engine

#engine to connect to database
engine = create_engine("sqlite:///customers.sqlite")
conn = engine.raw_connection()
cur = conn.cursor()


# In[2]:


# Delete Old Data and Create new Table "Customer"

sql = '''
DROP TABLE IF EXISTS Customer;
'''
cur.execute(sql)

sql = '''
CREATE TABLE "Customer" (
    "customerID"    INTEGER NOT NULL,
    "firstName"    TEXT NOT NULL,
    "lastName"    TEXT NOT NULL,
    "companyName"    TEXT,
    "address"    TEXT,
    "city"    BLOB,
    "province"    TEXT,
    "postal"    TEXT,
    PRIMARY KEY("customerID")
);
'''
cur.execute(sql)


# In[3]:


sql = 'SELECT * FROM "Customer"'
c = pd.read_sql(sql,conn )
print(len(c))
display(c.head(5))


# In[4]:


#  insert all data from the customers.csv file into the Customer table of the SQLite database.
csv_input = pd.read_csv("customers.csv")
csv_input.insert(0, "customerID", range(1, 1 + len(csv_input)))
csv_input.to_csv("output.csv", index=False)

text = open("output.csv", "r")
text = ''.join([i for i in text])
text = text.replace("first_name", "firstName")
text = text.replace("last_name", "lastName") 
text = text.replace("company_name", "companyName") 
x = open("output.csv", "w")
x.writelines(text)
x.close()

data = pd.read_csv("output.csv")   
data.to_sql("Customer", conn, if_exists="replace", index=False)

print("Customer Data Importer" +  "\n\n" + "CSV file:   customers.csv" +  "\n" + "DB file:    customers.sqlite" +"\n" + 
      "Table name: Customer" + "\n\n" + "All old rows deleted from Customer table." + "\n" + "500 row(s) inserted into Customer table."
)


# In[5]:


sql = 'SELECT * FROM "Customer"'
c = pd.read_sql(sql,conn )
print(len(c))
display(c.head(5))


# In[6]:


if conn:
	conn.close()


# In[ ]:




