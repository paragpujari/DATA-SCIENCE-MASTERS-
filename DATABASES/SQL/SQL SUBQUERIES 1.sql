SELECT * FROM staudent;

SELECT * FROM staudent_marks;

----------------Marks of student whose name is Anil and who lives in Delhi---------------------
SELECT * FROM staudent_marks WHERE RollNO IN (SELECT RollNO FROM staudent WHERE student_Name IN ('Anil') AND city IN ('Delhi'));

------------------Marks of the student who lives in Noida----------------------------------------------------------------

SELECT * FROM staudent_marks WHERE RollNO IN (SELECT RollNO FROM staudent WHERE city IN ('Noida'));




SELECT * FROM Empl_Salary order by salary desc;

--------------------------Get  the Highest Salary----------------------------------------------------------
SELECT DISTINCT(salary) as Highest_Salary FROM Empl_Salary WHERE salary IN (SELECT MAX(salary) FROM Empl_Salary);


--------------------------Second Highest Salary-----------------------------------------------

SELECT top 1 salary from Empl_Salary WHERE salary < (select MAX(salary) FROM Empl_Salary) order by 1 desc;

----------------------------Third Highest Salary----------------------------------------------------------------------------

select top 1 salary from empl_salary where salary in (
SELECT top 2 salary FROM Empl_Salary WHERE salary < (SELECT MAX(salary) FROM Empl_salary) order by salary desc);