import mysql.connector
# connection object for AWS Service that establishes the connection to SQL and Python 
mydb = mysql.connector.connect(
       host = 'localhost'  ,
       user = 'abc'        ,
       password = 'password'
)
print(mydb)
mycursor = mydb.cursor()
mycursor.execute('SELECT * FROM test1.test_table')
for i in mycursor.fetchall():
    print(i)