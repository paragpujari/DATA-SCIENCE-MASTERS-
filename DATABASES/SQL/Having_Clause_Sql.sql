SELECT b.JobTitle, COUNT(b.JobTitle) as total_jobs FROM EmployeeDemographics a
FULL OUTER JOIN EmployeeSalary b
ON a.EmployeeID = b.EmployeeID
WHERE b.Salary IS NOT NULL
GROUP BY b.JobTitle
HAVING COUNT(b.JobTitle) >= 1
ORDER BY 2 DESC;


SELECT b.JobTitle, COUNT(b.JobTitle) as total_jobs FROM EmployeeDemographics a
FULL OUTER JOIN EmployeeSalary b
ON a.EmployeeID = b.EmployeeID
WHERE b.Salary IS NOT NULL
GROUP BY b.JobTitle
HAVING COUNT(b.JobTitle) > 1
ORDER BY 2 DESC;

SELECT b.JobTitle, AVG(b.Salary) AS Average_Salary FROM EmployeeDemographics a
FULL OUTER JOIN EmployeeSalary b
ON a.EmployeeID = b.EmployeeID
WHERE b.Salary IS NOT NULL
GROUP BY b.JobTitle
ORDER BY 2 DESC;

SELECT b.JobTitle, AVG(b.Salary) AS Average_Salary FROM EmployeeDemographics a
FULL OUTER JOIN EmployeeSalary b
ON a.EmployeeID = b.EmployeeID
WHERE b.Salary IS NOT NULL
GROUP BY b.JobTitle
HAVING AVG(b.Salary) >= 60000
ORDER BY 2 DESC;
