SELECT FirstName, LastName, Age,
       CASE WHEN Age > '30' THEN 'Old'
	                        ELSE 'Young'
							END AS Generation
FROM EmployeeDemographics WHERE Age IS NOT NULL
ORDER BY Age;


SELECT FirstName, LastName, Age,
       CASE WHEN Age > '30'                 THEN       'Old'
	        WHEN Age > '27' AND Age <= '30' THEN       'Young'
			ELSE                                       'Baby'
							END AS Generation
FROM EmployeeDemographics WHERE Age IS NOT NULL
ORDER BY Age;


SELECT FirstName, LastName, Age,
       CASE WHEN Age = '32'                 THEN       'Alice'
	        WHEN Age > '30'                 THEN       'Old'
	        WHEN Age > '27' AND Age <= '30' THEN       'Young'
			ELSE                                       'Baby'
							END AS Generation
FROM EmployeeDemographics WHERE Age IS NOT NULL
ORDER BY Age;



SELECT a.FirstName, a.LastName, b.JobTitle, b.Salary,
CASE WHEN b.JobTitle = 'Salesman' THEN b.Salary + (b.Salary * 0.1)
     WHEN b.JobTitle = 'Accountant' THEN b.Salary + (b.Salary * 0.1)
	 WHEN b.JobTitle = 'HR' THEN b.Salary + (b.Salary * 0.1)
	 ELSE                        b.Salary + (b.Salary * 0.3)
	 END AS Salary_After_Raise
FROM EmployeeDemographics a
INNER JOIN EmployeeSalary b
ON a.EmployeeID = b.EmployeeID
ORDER BY 5