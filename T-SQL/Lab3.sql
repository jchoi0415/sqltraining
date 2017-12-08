SELECT c.CompanyName, s.SalesOrderID
FROM SalesLT.Customer AS c
JOIN SalesLT.SalesOrderHeader AS s
ON c.CustomerID = s.CustomerID;

SELECT c.CompanyName, s.SalesOrderID, 
		ISNULL(a.AddressLine2, '') + ' ' + a.AddressLine1 AS FullAddress,
		a.City, a.StateProvince, a.PostalCode, a.CountryRegion
FROM SalesLT.Customer AS c
JOIN SalesLT.SalesOrderHeader AS s
ON c.CustomerID = s.CustomerID
JOIN SalesLT.CustomerAddress AS ca
ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address AS a
ON ca.AddressID = a.AddressID;

SELECT c.FirstName, c.LastName, sh.SalesOrderID, sd.LineTotal
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.SalesOrderHeader AS sh
ON c.CustomerID = sh.CustomerID
LEFT JOIN SalesLT.SalesOrderDetail AS sd
ON sh.SalesOrderID = sd.SalesOrderID
ORDER BY SalesOrderID DESC;

SELECT c.CustomerID, c.CompanyName, c.FirstName + ' '  + c.LastName AS ContactName, c.Phone
FROM SalesLT.Customer AS c
JOIN SalesLT.CustomerAddress AS ca
ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address AS a
ON ca.AddressID = a.AddressID
WHERE a.AddressLine2 is NULL

/*
UNION

SELECT 'Address 2 found' as Addresscheck
FROM SalesLT.Customer AS c
JOIN SalesLT.CustomerAddress AS ca
ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address AS a
ON ca.AddressID = a.AddressID
WHERE a.AddressLine2 is NOT NULL;
*/

SELECT c.CustomerID, p.ProductID
FROM SalesLT.Customer AS c
FULL JOIN SalesLT.SalesOrderHeader AS soh
ON c.CustomerID = soh.CustomerID
FULL JOIN SalesLT.SalesOrderDetail AS sod
ON sod.SalesOrderID = soh.SalesOrderID
FULL JOIN SalesLT.Product AS p
ON p.ProductID = sod.ProductID
WHERE soh.SalesOrderID IS NOT NULL
ORDER BY ProductID, CustomerID;