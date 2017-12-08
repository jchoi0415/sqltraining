SELECT MAX(UnitPrice)
FROM SalesLT.SalesOrderDetail;

SELECT *
FROM SalesLT.Product
WHERE ListPrice > 1467.01;

SELECT *
FROM SalesLT.Product
WHERE ListPrice > 
		(SELECT MAX(UnitPrice) FROM SalesLT.SalesOrderDetail);

SELECT CustomerID, SalesOrderID, OrderDate
FROM SalesLT.SalesOrderHeader AS so1
WHERE OrderDate =
		(SELECT MAX(OrderDate)
		FROM SalesLT.SalesOrderHeader AS so2
		WHERE so2.CustomerID = so1.CustomerID)
ORDER BY CustomerID;

SELECT soh.SalesOrderID, MUP.MaxUnitPrice
FROM SalesLT.SalesOrderHeader AS soh
CROSS APPLY SalesLT.udfMaxUnitPrice(soh.SalesOrderID) AS MUP
ORDER BY soh.SalesOrderID;


