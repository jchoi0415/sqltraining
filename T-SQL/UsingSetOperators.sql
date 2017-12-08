SELECT FirstName, LastName
FROM SalesLT.Customer
UNION
SELECT FirstName, LastName
FROM SalesLT.Customer
ORDER BY LastName

SELECT FirstName, LastName
FROM SalesLT.Customer
INTERSECT
SELECT FirstName, LastName
FROM SalesLT.Customer
ORDER BY LastName

SELECT FirstName, LastName
FROM SalesLT.Customer
EXCEPT
SELECT FirstName, LastName
FROM SalesLT.Customer
ORDER BY LastName

