SELECT Gender, COUNT(EmployeeID) as total
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender
ORDER BY 2 DESC;

SELECT Gender, COUNT(EmployeeID) as total
FROM EmployeeDemographics
GROUP BY Gender
ORDER BY 2 DESC;


SELECT Gender, Age, COUNT(EmployeeID) as total
FROM EmployeeDemographics
GROUP BY Gender, Age
ORDER BY 2 DESC;

SELECT * FROM EmployeeDemographics ORDER  BY Age, Gender;



SELECT * FROM EmployeeDemographics ORDER  BY Age , Gender DESC;


SELECT * FROM EmployeeDemographics ORDER  BY Age DESC, Gender DESC;