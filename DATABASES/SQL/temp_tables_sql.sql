------------------------Temporary Tables----------------------------------------------------
DROP TABLE IF EXISTS #temp_employee2;

CREATE TABLE #temp_employee2(
EmployeeID int,
JobTitle varchar(100),
Salary int
)

INSERT INTO #temp_employee2(EmployeeID, JobTitle, Salary) VALUES('1001', 'HR', '45000');


INSERT INTO #temp_employee2
SELECT * FROM EmployeeSalary;


SELECT * FROM #temp_employee2;



DROP TABLE IF EXISTS #temp_employee3;

CREATE TABLE #temp_employee3(
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)


INSERT INTO #temp_employee3
SELECT b.JobTitle, COUNT(b.JobTitle),AVG(a.Age) , AVG(b.Salary) 
FROM EmployeeDemographics a
JOIN EmployeeSalary b
ON a.EmployeeID = b.EmployeeID
GROUP BY b.JobTitle

SELECT * FROM #temp_employee3;