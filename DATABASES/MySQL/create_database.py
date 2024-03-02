import mysql.connector
# connection object for AWS Service that establishes the connection to SQL and Python 
mydb = mysql.connector.connect(
       host = 'localhost'  ,
       user = 'abc'        ,
       password = 'password'
)
print(mydb)
mycursor = mydb.cursor()
# To execute the sql statement
mycursor.execute('CREATE DATABASE IF NOT EXISTS test1')
mycursor.execute('CREATE TABLE IF NOT EXISTS test1.test_table(c1 INT, c2 VARCHAR(50), c3 INT, c4 FLOAT, c5 VARCHAR(40))')
mycursor.execute("INSERT INTO test1.test_table values(3424, 'parag', 234, 345.56, 'pujari')")
mycursor.execute("INSERT INTO test1.test_table values(3424, 'parag', 234, 345.56, 'pujari')")
mycursor.execute("INSERT INTO test1.test_table values(3424, 'parag', 234, 345.56, 'pujari')")
mycursor.execute("INSERT INTO test1.test_table values(3424, 'parag', 234, 345.56, 'pujari')")
mycursor.execute("INSERT INTO test1.test_table values(3424, 'parag', 234, 345.56, 'pujari')")
mycursor.execute("INSERT INTO test1.test_table values(3424, 'parag', 234, 345.56, 'pujari')")
mycursor.execute("INSERT INTO test1.test_table values(3424, 'parag', 234, 345.56, 'pujari')")
mycursor.execute("INSERT INTO test1.test_table values(3424, 'parag', 234, 345.56, 'pujari')")
mycursor.execute("INSERT INTO test1.test_table values(3424, 'parag', 234, 345.56, 'pujari')")
mycursor.execute('SELECT c1, c5 FROM test1.test_table')
for i in mycursor.fetchall():
    print(i)
mydb.commit()
mydb.close()