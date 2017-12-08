/****** Script for SelectTopNRows command from SSMS  ******/
SELECT Title, FirstName, MiddleName, LastName, Suffix
FROM SalesLT.Customer;

SELECT SalesPerson, Title + ' ' + LastName AS CustomerName, Phone
FROM SalesLT.Customer;

SELECT CAST(CustomerID AS varchar) + ': ' + CompanyName
FROM SalesLT.Customer;

SELECT CAST(SalesOrderNumber AS varchar) + '(' + CAST(RevisionNumber AS varchar) + ')'
FROM SalesLT.SalesOrderHeader;

SELECT FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName
FROM SalesLT.Customer;

UPDATE SalesLT.Customer
SET EmailAddress = NULL
WHERE CustomerID %7 = 1;

SELECT ISNULL(EmailAddress, Phone) AS PrimaryContact
FROM SalesLT.Customer;

UPDATE SalesLT.SalesOrderHeader
SET ShipDate = NULL
WHERE SalesOrderID > 71899;

SELECT SalesOrderID,
		CASE
			WHEN ShipDate IS NULL THEN 'Shipped'
			ELSE 'Awaiting Shipment'
		END AS SalesStatus
FROM SalesLT.SalesOrderHeader



