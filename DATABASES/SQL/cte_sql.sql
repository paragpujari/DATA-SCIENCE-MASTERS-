USE SQL;


SELECT * FROM EmployeeDemographics;

SELECT * FROM EmployeeSalary;

------------------Find out the total salary based on gender and the number of gender based on gender---------------------------------------------------
;with CTE_Employee AS(
SELECT a.EmployeeID, a.FirstName, a.LastName, a.Age, a.Gender, b.JobTitle, b.Salary, SUM(b.Salary) OVER(PARTITION BY a.Gender) as total_salary,
COUNT(a.Gender) OVER(PARTITION BY a.Gender) as Gender_Count
FROM EmployeeDemographics a
JOIN EmployeeSalary b
ON a.EmployeeID = b.EmployeeID
WHERE b.Salary >= '45000'
--ORDER BY b.Salary DESC;
)
SELECT * FROM CTE_Employee
ORDER BY Gender_Count desc;