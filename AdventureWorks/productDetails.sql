CREATE VIEW Sales.vProductsSold AS
(SELECT soh.SalesOrderID, per2.FirstName + ' ' + per2.LastName AS CustomerName, p.Name AS ProductName, p.ProductID,
		c.StoreID, c.PersonID, per.FirstName + ' ' + per.LastName AS SalesPerson, e.JobTitle AS SalesPersonRole,
		sod.OrderQty, sod.UnitPrice, sod.LineTotal AS TotalPrice, p.StandardCost, sod.LineTotal - (p.StandardCost * sod.OrderQty) AS Profit,
		YEAR(soh.OrderDate) AS [Year], MONTH(soh.OrderDate) AS [Month]
FROM Sales.SalesOrderHeader as soh
INNER JOIN Sales.SalesOrderDetail as sod
ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Production.Product as p
ON sod.ProductID = p.ProductID
LEFT JOIN HumanResources.Employee as e
ON soh.SalesPersonID = e.BusinessEntityID
LEFT JOIN Person.Person as per
ON soh.SalesPersonID = per.BusinessEntityID
LEFT JOIN Sales.Customer as c
ON soh.CustomerID = c.CustomerID
INNER JOIN Person.Person as per2
ON c.PersonID = per2.BusinessEntityID);