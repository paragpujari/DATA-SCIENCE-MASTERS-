use happy;

SELECT * FROM EMP1;

-------------1. Make a Partition on the Employees Table based on gender and assign the row_number to every entity within the gender-----------------------

SELECT ROW_NUMBER() OVER(PARTITION BY EMPGENDER ORDER BY EMPID) as rwn, * FROM EMP1;

----------------2. Make a Partition based on gender and assign the row_number to every entity in gender and assign the rank based on Emp_age within the partition-------------
SELECT ROW_NUMBER() OVER(PARTITION BY EMPGENDER ORDER BY EMPID) as rwn, 
RANK()OVER(PARTITION BY EMPGENDER ORDER BY EMPAGE) as ranks,* 
FROM EMP1;


----------------- 3. Make a Partition based on Gender and assign the row_number within the partition and then assign dense rank to the emp_age within the partition--------
SELECT ROW_NUMBER() OVER(PARTITION BY EMPGENDER ORDER BY EMPID) as rwn,
DENSE_RANK() OVER(PARTITION BY EMPGENDER ORDER BY EMPAGE) as dense_ranks,
* FROM EMP1;



SELECT * FROM EMPLOYS

------------------ 4. Get the First Female Employee and the First Male Employee from the partition based on gender----------------

SELECT ROW_NUMBER() OVER(PARTITION BY emp_gender order by emp_id) as rwn, FIRST_VALUE(emp_name) OVER(PARTITION BY emp_gender 
ORDER BY emp_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as first_names,
* FROM EMPLOYS;


------------------ 5. Get the Last Male Employee and Last Female Employee based on the partition of the gender--------------------------
SELECT ROW_NUMBER() OVER(PARTITION BY emp_gender order by emp_id) as rwn, LAST_VALUE(emp_name) OVER(PARTITION BY emp_gender
ORDER BY emp_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as last_names,
* FROM EMPLOYS;


----------------------- 6. Partition the table based on gender and assign the row_number to it and find out the previous male salary and previous salary------------------------
SELECT ROW_NUMBER() OVER(PARTITION BY emp_gender order by emp_id) as rwn,
LAG(emp_salary) OVER(PARTITION BY emp_gender ORDER BY emp_id),
* FROM EMPLOYS;


---------------------- 7. Partition the table based on gender and assign the row number to it and find the next male and female salary based on the partition-------------------
SELECT ROW_NUMBER() OVER(PARTITION BY emp_gender order by emp_id) as rwn,
LEAD(emp_salary) OVER(PARTITION BY emp_gender ORDER BY emp_id) as next_salary,
* FROM EMPLOYS;

--------------------8. Calculate the cumulative distibution of the salary based on the partition of gender in the table-------------------
SELECT ROW_NUMBER() OVER(PARTITION BY emp_gender order by emp_id) as rwn,
CUME_DIST() OVER(PARTITION BY emp_gender ORDER BY emp_id) as cumulative_dist,
*FROM EMPLOYS;

--------------------- 9. Divide the rows into the buckets based on the gender column within the partition in the table------------------------
SELECT ROW_NUMBER() OVER(PARTITION BY emp_gender order by emp_id) as rwn,
NTILE(2) OVER(PARTITION BY emp_gender ORDER BY emp_id) as buckets,
* FROM EMPLOYS;

