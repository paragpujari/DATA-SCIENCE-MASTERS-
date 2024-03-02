USE SQL;

Drop Table IF EXISTS EmployeeErrors;


CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

Select *
From EmployeeErrors

---------------------------------------------------TRIM FUNCTIONS------------------------------------------------------------

SELECT EmployeeID, TRIM(EmployeeID) as id FROM EmployeeErrors;

SELECT EmployeeID, LTRIM(EmployeeID) as id FROM EmployeeErrors;

SELECT EmployeeID, RTRIM(EmployeeID) as id FROM EmployeeErrors;



Select EmployeeID, LEN(EmployeeID) as length From EmployeeErrors;


SELECT EmployeeID, LEN(TRIM(EmployeeID)) as id FROM EmployeeErrors;

SELECT EmployeeID, LEN(LTRIM(EmployeeID)) as id FROM EmployeeErrors;

SELECT EmployeeID, LEN(RTRIM(EmployeeID)) as id FROM EmployeeErrors;





-----------------------------------REPLACE------------------------------------------------------------------------------------------

SELECT *,REPLACE(LastName,'- Fired', '') as answers FROM EmployeeErrors WHERE EmployeeID IN ('1005');


-----------------------------SUBSTRING-----------------------------------------------------------------------------------------------------
SELECT SUBSTRING(a.FirstName,1,3) as FirstName,
SUBSTRING(b.FirstName,1,3) as LastName,
SUBSTRING(a.LastName,1,3) as FirstNames,
SUBSTRING(b.LastName,1,3) as LastNames
FROM EmployeeErrors a
JOIN EmployeeDemographics b
ON a.EmployeeID = b.EmployeeID

--------------------------------UPPER CASE AND LOWER CASE--------------------------------------------------------------------------------

SELECT FirstName, UPPER(FirstName)  FROM EmployeeErrors

SELECT FirstName, LOWER(FirstName)  FROM EmployeeErrors


SELECT * FROM EmployeeErrors;