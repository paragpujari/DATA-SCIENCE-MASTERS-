--------------------------------------------------------------PIVOT ---------------------------------------------------------------------------------------------
drop table if exists sales;

CREATE TABLE Sales(id int not null,
year int not null,
product nvarchar(40),
sales int not null);

INSERT INTO Sales VALUES(5, 2020, 'CPU', 65)
INSERT INTO Sales VALUES(17, 2020, 'CPU', 65)
INSERT INTO Sales VALUES(11, 2020, 'Pen', 11)
INSERT INTO Sales VALUES(12, 2020, 'Pencil', 90)
INSERT INTO Sales VALUES(16, 2021, 'Mouse', 68)
INSERT INTO Sales VALUES(4, 2021, 'Mouse', 68)
INSERT INTO Sales VALUES(1, 2021, 'Pen', 89)
INSERT INTO Sales VALUES(10, 2021, 'Pen', 100)
INSERT INTO Sales VALUES(13, 2021, 'Pen', 89)
INSERT INTO Sales VALUES(7, 2021, 'Pencil', 76)
INSERT INTO Sales VALUES(19, 2021, 'Pencil', 76)
INSERT INTO Sales VALUES(21, 2022, 'CPU', 78)
INSERT INTO Sales VALUES(9, 2022, 'CPU', 78)
INSERT INTO Sales VALUES(6, 2022, 'CPU', 78)
INSERT INTO Sales VALUES(18, 2022, 'CPU', 78)
INSERT INTO Sales VALUES(12, 2021, 'Pencil', 80)
INSERT INTO Sales VALUES(17, 2020, 'Pen', 70)
INSERT INTO Sales VALUES(11, 2022, 'Mouse', 72)
INSERT INTO Sales VALUES(10, 2022, 'Pencil', 90)
INSERT INTO Sales VALUES(7, 2021, 'Pen', 75)
INSERT INTO Sales VALUES(20, 2020, 'Mouse', 78)
INSERT INTO Sales VALUES(30, 2022, 'CPU', 71)
INSERT INTO Sales VALUES(31, 2021, 'CPU', 70)
INSERT INTO Sales VALUES(32, 2022, 'Pen', 55)
INSERT INTO Sales VALUES(34, 2020, 'Pencil', 78)
INSERT INTO Sales VALUES(35, 2022, 'CPU', 71)
INSERT INTO Sales VALUES(37, 2021, 'Pen', 76)
INSERT INTO Sales VALUES(39, 2022, 'Pencil', 70)
INSERT INTO Sales VALUES(40, 2021, 'Mouse', 72)

SELECT * FROM Sales;

SELECT * FROM(
SELECT year, product, sales FROM Sales
) AS SOURCETABLE
PIVOT(
SUM(sales)
FOR product IN ([CPU],[Pen],[Pencil],[Mouse])
) AS PIVOTTABLE;


-------------------------------------------UNPIVOT-------------------------------------------------------------------
DECLARE  @table  TABLE(
YEAR      INT   ,
CPU       NVARCHAR(300)   ,
Pen       NVARCHAR(300)   ,
Pencil    NVARCHAR(300)   ,
Mouse     NVARCHAR(300)
)

INSERT INTO @table
SELECT year, CPU, Pen, Pencil, Mouse FROM
(SELECT year, product, sales FROM Sales_table) RESULTSET
PIVOT
(
  SUM([sales])
  FOR product IN
  (
     [CPU]   ,
	 [Pen]   ,
	 [Pencil] ,
	 [Mouse] 
  )
) AS Pivot_Table;

SELECT * FROM @table
UNPIVOT(
   sales
   FOR product IN
   (
     [CPU]   ,
	 [Pen]   ,
	 [Pencil] ,
	 [Mouse] 
   )
)AS UNPIVOTRESULT;