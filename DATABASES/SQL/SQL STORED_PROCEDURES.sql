--DROP PROCEDURE IF EXISTS Temp_Procedure_Employee;

CREATE PROCEDURE Temp_Procedure_Employee
AS
DROP TABLE IF EXISTS #temp_employee
Create table #temp_employee (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)


Insert into #temp_employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM SQL.dbo.EmployeeDemographics emp
JOIN SQL.dbo.EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
group by JobTitle

Select * 
From #temp_employee
GO;

EXEC Temp_Procedure_Employee


DROP PROCEDURE IF EXISTS Temp_Proc_Empl;

CREATE PROCEDURE Temp_Proc_Empl
@JobTitle NVARCHAR(100)
AS
DROP TABLE IF EXISTS #temp_employee3
Create table #temp_employee3 (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)


Insert into #temp_employee3
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM EmployeeDemographics emp
JOIN EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
where JobTitle = @JobTitle --- make sure to change this in this script from original above
group by JobTitle

Select * 
From #temp_employee3

GO;

EXEC Temp_Proc_Empl @JobTitle = 'Salesman';
EXEC Temp_Proc_Empl @JobTitle = 'Accountant';