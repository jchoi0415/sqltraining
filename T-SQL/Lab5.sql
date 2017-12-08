SELECT ProductID, Upper(Name) AS ProductName,
		CEILING(Weight) AS ApproxWeight,
		YEAR(SellStartDate) AS SellStartYear,
		DATENAME(mm,SellStartDate) AS SellStartMonth,
		LEFT(ProductNumber, 2) AS ProductType
FROM SalesLT.Product
WHERE ISNUMERIC(Size) = 1;

SELECT c.CompanyName,
		RANK() OVER(ORDER BY soh.TotalDue DESC) AS RankByTotal
FROM SalesLT.Customer AS c
JOIN SalesLT.SalesOrderHeader AS soh
ON c.CustomerID = soh.CustomerID;

SELECT p.Name, SUM(sod.LineTotal) AS TotalRevenue
FROM SalesLT.Product AS p
JOIN SalesLT.SalesOrderDetail AS sod
ON p.ProductID = sod.ProductID
WHERE p.ListPrice > 1000
GROUP BY p.Name
HAVING SUM(sod.LineTotal) > 20000
ORDER BY TotalRevenue DESC;