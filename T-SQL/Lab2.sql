SELECT DISTINCT City, StateProvince
FROM SalesLT.Address;

SELECT TOP 10 PERCENT Name, Weight
FROM SalesLT.Product
ORDER BY Weight DESC;

SELECT Name, Weight
FROM SalesLT.Product
ORDER BY Weight DESC
OFFSET 10 ROWS FETCH NEXT 100 ROWS ONLY;

SELECT Name, Color, Size
FROM SalesLT.Product
WHERE ProductModelID = 1;

SELECT ProductNumber, Name
FROM SalesLT.Product
WHERE Color IN ('black', 'red', 'white') AND Size IN ('S', 'M')

SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-%'

SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-_[0-9][0-9]%' AND ProductNumber NOT LIKE '___R%'