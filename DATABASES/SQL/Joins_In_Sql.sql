--------------------------Joins-----------------------------------------------------------
SELECT * FROM EmployeeDemographics;

SELECT * FROM EmployeeSalary;


-------------Inner Join-------------------------
SELECT * FROM EmployeeDemographics a
INNER JOIN EmployeeSalary b
ON a.EmployeeID = b.EmployeeID;

------------Full Outer Join-------------------------
SELECT a.FirstName,b.JobTitle, b.Salary,* FROM EmployeeDemographics a
FULL OUTER JOIN EmployeeSalary b
ON a.EmployeeID = b.EmployeeID
ORDER BY b.Salary;

-------------Left Join---------------------------
SELECT * FROM EmployeeDemographics a
LEFT JOIN EmployeeSalary b
ON a.EmployeeID = b.EmployeeID;

-------------Right Join--------------------------------
SELECT * FROM EmployeeDemographics a
RIGHT JOIN EmployeeSalary b
ON a.EmployeeID = b.EmployeeID;




-------------Inner Join-------------------------
SELECT a.FirstName, a.LastName, b.JobTitle FROM EmployeeDemographics a
INNER JOIN EmployeeSalary b
ON a.EmployeeID = b.EmployeeID;

------------Full Outer Join-------------------------
SELECT a.FirstName, a.LastName, b.JobTitle FROM EmployeeDemographics a
FULL OUTER JOIN EmployeeSalary b
ON a.EmployeeID = b.EmployeeID;

-------------Left Join---------------------------
SELECT a.FirstName, a.LastName, b.JobTitle FROM EmployeeDemographics a
LEFT JOIN EmployeeSalary b
ON a.EmployeeID = b.EmployeeID;

-------------Right Join--------------------------------
SELECT a.FirstName, a.LastName, b.JobTitle FROM EmployeeDemographics a
RIGHT JOIN EmployeeSalary b
ON a.EmployeeID = b.EmployeeID;



SELECT b.JobTitle, AVG(b.Salary) AS Average_Salary
FROM EmployeeDemographics a
FULL OUTER JOIN EmployeeSalary b
ON a.EmployeeID = b.EmployeeID
GROUP BY b.JobTitle
ORDER BY 2 DESC;

