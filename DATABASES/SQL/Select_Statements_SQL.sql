SELECT * FROM EmployeeDemographics;


--------------Get the full name of all the employees---------------

SELECT FirstName, LastName FROM EmployeeDemographics;


---------------------Get the top 5 records-------------------------------------------
SELECT TOP 5 * FROM EmployeeDemographics;

---------------------Get the unique records of all the employeeid--------------------------
SELECT DISTINCT(EmployeeID) as ID FROM EmployeeDemographics;



-----------------------Get the count of records in the table------------------------------
SELECT COUNT(*) as total FROM EmployeeDemographics;


----------------------Get the count of all the names in the table--------------------------------
SELECT COUNT(FirstName) as total_names FROM EmployeeDemographics;



-------------------Get the minimum salary from the table---------------------------------------
SELECT MIN(Salary) as min FROM EmployeeSalary;


-------------------Get the maximum salary from the table---------------------------------------
SELECT MAX(Salary) as max FROM EmployeeSalary;



-------------------Get the average salary from the table---------------------------------------
SELECT AVG(Salary) as avg FROM EmployeeSalary;