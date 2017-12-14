/*
CREATE VIEW Sales.vProductsSold AS
(Select 'Total products', '000', sum(ProductCount)
from (
SELECT p.Name, sod.ProductID, COUNT(sod.ProductID) AS ProductCount
FROM Sales.SalesOrderDetail as sod
INNER JOIN Production.Product as p
ON p.ProductID = sod.ProductID
GROUP BY p.Name, sod.ProductID) as data

UNION ALL

SELECT p.Name, COUNT(sod.ProductID) AS ProductCount
FROM Sales.SalesOrderDetail as sod
INNER JOIN Production.Product as p
ON p.ProductID = sod.ProductID
GROUP BY ROLLUP(p.Name, sod.ProductID)
ORDER BY p.Name);
*/

CREATE VIEW Sales.vProductsSoldCount AS
(SELECT p.Name, sod.ProductID, COUNT(sod.ProductID) AS ProductCount
FROM Sales.SalesOrderDetail as sod
INNER JOIN Production.Product as p
ON p.ProductID = sod.ProductID
GROUP BY ROLLUP((p.Name, sod.ProductID)));