SELECT P.ProductID, P.Name AS ProductName, PM.Name AS ProductModel, PM.Summary
FROM SalesLT.Product AS P
JOIN SalesLT.vProductModelCatalogDescription AS PM
ON P.ProductModelID = PM.ProductModelID
ORDER BY ProductID;

DECLARE @colors AS TABLE (Color nvarchar(15));

INSERT INTO @Colors
SELECT DISTINCT Color FROM SalesLT.Product;

SELECT ProductID, Name, Color
FROM SalesLT.Product
WHERE Color IN (SELECT Color FROM @Colors);

SELECT C.ParentProductCategoryName AS ParentCategory,
       C.ProductCategoryName AS Category,
       P.ProductID, P.Name AS ProductName
FROM SalesLT.Product AS P
JOIN dbo.ufnGetAllCategories() AS C
ON P.ProductCategoryID = C.ProductCategoryID
ORDER BY ParentCategory, Category, ProductName;

SELECT CompanyContact, SUM(SalesAmount) AS Revenue
FROM
	(SELECT CONCAT(c.CompanyName, CONCAT(' (' + c.FirstName + ' ', c.LastName + ')')), SOH.TotalDue
	 FROM SalesLT.SalesOrderHeader AS SOH
	 JOIN SalesLT.Customer AS c
	 ON SOH.CustomerID = c.CustomerID) AS CustomerSales(CompanyContact, SalesAmount)
GROUP BY CompanyContact
ORDER BY CompanyContact;

WITH CustomerSales(CompanyContact, SalesAmount)
AS
(SELECT CONCAT(c.CompanyName, CONCAT(' (' + c.FirstName + ' ', c.LastName + ')')), SOH.TotalDue
 FROM SalesLT.SalesOrderHeader AS SOH
 JOIN SalesLT.Customer AS c
 ON SOH.CustomerID = c.CustomerID)
SELECT CompanyContact, SUM(SalesAmount) AS Revenue
FROM CustomerSales
GROUP BY CompanyContact
ORDER BY CompanyContact;