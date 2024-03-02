SELECT * FROM EmployeeDemographics WHERE FirstName IN ('Jim');

SELECT * FROM EmployeeDemographics WHERE Age >= 30  ORDER BY Age;


SELECT * FROM EmployeeDemographics WHERE Age <= 32 ORDER BY Age;


SELECT * FROM EmployeeDemographics WHERE Age <= 32 AND Gender = 'Male' ORDER BY Age;


SELECT * FROM EmployeeDemographics WHERE Age <= 32 OR Gender = 'Male' ORDER BY Age;


SELECT * FROM EmployeeDemographics WHERE LastName LIKE 'S%';

SELECT * FROM EmployeeDemographics WHERE LastName LIKE 'S%o%';

SELECT * FROM EmployeeDemographics WHERE FirstName IS NULL;


SELECT * FROM EmployeeDemographics WHERE FirstName IS NOT NULL;


SELECT * FROM EmployeeDemographics WHERE FirstName IN ('Jim','Michael', 'Dwight');





