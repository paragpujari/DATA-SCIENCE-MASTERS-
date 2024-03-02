

SELECT * FROM EmployeeDemographics;

SELECT * FROM WareHouseEmployeeDemographics;


------------------------------------Performing the Union of all the columns from both the tables-----------------
SELECT * FROM EmployeeDemographics
UNION
SELECT * FROM WareHouseEmployeeDemographics;





SELECT * FROM EmployeeDemographics
UNION ALL
SELECT * FROM WareHouseEmployeeDemographics
ORDER BY EmployeeID;





