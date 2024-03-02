

SELECT * FROM product_target;
SELECT * FROM product_source;



MERGE product_target a
USING product_source b
ON    a.P_ID = b.P_ID
WHEN MATCHED THEN UPDATE SET a.P_ID = b.P_ID, a.P_Name = b.P_Name, a.P_Price = b.P_Price
WHEN NOT MATCHED BY TARGET
THEN INSERT(P_ID, P_Name, P_Price) VALUES(b.P_ID, b.P_Name, b.P_Price);
