SELECT DISTINCT Color
FROM SalesLT.Product;

SELECT DISTINCT ISNULL(Color, 'None') AS Color, ISNULL(Size, '-') AS Size
FROM SalesLT.Product
ORDER BY Color;

--Fetch the first 10 rows from the 101st one
SELECT Name, ListPrice
FROM SalesLT.Product
ORDER BY ProductNumber
OFFSET 100 ROWS FETCH NEXT 10 ROWS ONLY;

SELECT Name, Color, Size
FROM SalesLT.Product
WHERE ProductModelID > 6;

SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE '%R%'; --FR% or %58

SELECT ProductNumber, ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'FR-_[0-9][0-9]_-[0-9][0-9]';

SELECT Name, SellEndDate
FROM SalesLT.Product
WHERE SellEndDate IS NOT NULL;

SELECT Name
FROM SalesLT.Product
WHERE SellEndDate BETWEEN '2013/1/1' AND '2013/12/31';

SELECT ProductCategoryID, ProductNumber, Name, ListPrice
FROM SalesLT.Product
WHERE ProductCategoryID IN (5, 6, 7) AND (SellEndDate IS NULL OR ProductNumber LIKE 'FR%');