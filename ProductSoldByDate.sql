CREATE VIEW Sales.vProductSoldCountByDate AS
(SELECT YEAR(soh.OrderDate) AS [Year], MONTH(soh.OrderDate) AS [Month], p.Name, COUNT(sod.ProductID) AS ProductCount
FROM Sales.SalesOrderDetail as sod
INNER JOIN Production.Product as p
ON p.ProductID = sod.ProductID
INNER JOIN Sales.SalesOrderHeader as soh
ON sod.SalesOrderID = soh.SalesOrderID
GROUP BY soh.OrderDate, p.Name);