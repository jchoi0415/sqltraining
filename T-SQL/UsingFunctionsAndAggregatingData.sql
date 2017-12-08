--Scalar Function--
SELECT YEAR(SellStartDate) AS SellStartYear, ProductID, Name
FROM SalesLT.Product
ORDER BY SellStartDate;

SELECT YEAR(SellStartDate) AS SellStartYear, DATENAME(mm,SellStartDate) AS SellStartMonth,
		DAY(SellStartDate) AS SellStartDay, DATENAME(dw,SellStartDate) AS SellStartWeekday,
		ProductID, Name
FROM SalesLT.Product
ORDER BY SellStartYear;

SELECT DATEDIFF(yy,SellStartDate, GETDATE()) AS YearsSold, ProductID, Name
FROM SalesLT.Product
ORDER BY ProductID;

SELECT UPPER(Name) AS ProductName
FROM SalesLT.Product;

SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM SalesLT.Customer;

SELECT Name, ProductNumber, LEFT(ProductNumber, 2) AS ProductType
FROM SalesLT.Product;

SELECT Name, ProductNumber, LEFT(ProductNumber, 2) AS ProductType,
		SUBSTRING(ProductNumber, CHARINDEX('-', ProductNumber) + 1, 4) AS ModelCode,
		SUBSTRING(ProductNumber, LEN(ProductNumber) - CHARINDEX('-', REVERSE(RIGHT(ProductNumber, 3))) + 2, 2) AS SizeCodes
FROM SalesLT.Product;

--Logical Function--

SELECT Name, Size AS NumericSize
FROM SalesLT.Product
WHERE ISNUMERIC(Size) = 1;

SELECT Name, IIF(ProductCategoryID IN (5,6,7), 'Bike', 'Other') AS ProductType
FROM SalesLT.Product;

SELECT Name, IIF(ISNUMERIC(Size) = 1, 'Numeric', 'Non-Numeric') AS SizeType
FROM SalesLT.Product;

SELECT prd.Name AS ProductName, cat.Name AS Category, prd.ProductCategoryID,
		CHOOSE(cat.ParentProductCategoryID, 'Bikes', 'Components', 'Clothing', 'Accessories') AS ProductType 
FROM SalesLT.Product AS prd
JOIN SalesLT.ProductCategory AS cat
ON prd.ProductCategoryID = cat.ProductCategoryID;

--Window Function--
SELECT TOP(100) ProductID, Name, ListPrice,
		RANK() OVER(ORDER BY ListPrice DESC) AS RankByPrice
FROM SalesLT.Product as p
ORDER BY RankByPrice;

SELECT pc.Name AS Category, p.Name AS Product, ListPrice,
		RANK() OVER(PARTITION BY pc.Name ORDER BY ListPrice DESC) AS RankByPrice
FROM SalesLT.Product as p
JOIN SalesLT.ProductCategory as pc
ON p.ProductCategoryID = pc.ProductCategoryID
ORDER BY Category, RankByPrice;

--Aggregate Function--
SELECT COUNT(*) AS Products, COUNT(DISTINCT ProductCategoryID) AS Categories, AVG(ListPrice) AS AveragePrice
FROM SalesLT.Product;

SELECT COUNT(p.ProductID) AS BikeModels, AVG(p.ListPrice) AS AveragePrice
FROM SalesLT.Product AS p
JOIN SalesLT.ProductCategory AS pc
ON p.ProductCategoryID = pc.ProductCategoryID
WHERE pc.Name LIKE '%Bikes'

--GROUP BY--
SELECT c.SalesPerson, ISNULL(SUM(soh.SubTotal), 0.00) AS SalesRevenue
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.SalesOrderHeader AS soh
ON c.CustomerID = soh.CustomerID
GROUP BY c.SalesPerson
ORDER BY SalesRevenue DESC

SELECT c.SalesPerson, CONCAT(c.FirstName, ' ', c.LastName) AS Customer, ISNULL(SUM(soh.SubTotal), 0.00) AS SalesRevenue
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.SalesOrderHeader AS soh
ON c.CustomerID = soh.CustomerID
GROUP BY c.SalesPerson, CONCAT(c.FirstName, ' ', c.LastName)
ORDER BY SalesRevenue DESC, Customer;

--HAVING--
SELECT ProductID, SUM(sod.OrderQty) AS Quantity
FROM SalesLT.SalesOrderDetail AS sod
JOIN SalesLT.SalesOrderHeader AS soh
ON sod.SalesOrderID = soh.SalesOrderID
WHERE YEAR(soh.OrderDate) = 2008
GROUP BY ProductID
HAVING SUM(sod.OrderQty) > 50