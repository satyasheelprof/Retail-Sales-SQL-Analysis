USE RetailSalesDB;

--View 1 — Completed Sales

CREATE VIEW vw_CompletedSales
AS
SELECT
    o.OrderID,
    o.OrderDate,
    o.CustomerID,
    od.ProductID,
    od.Quantity,
    od.UnitPrice,
    od.Quantity * od.UnitPrice AS Revenue,
    o.PaymentMethod
FROM Orders o
INNER JOIN OrderDetails od
    ON o.OrderID = od.OrderID
WHERE o.OrderStatus = 'Completed';


SELECT *
FROM vw_CompletedSales;


--View 2 — Customer Sales Summary

CREATE VIEW vw_CustomerSalesSummary
AS
SELECT
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    c.City,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    SUM(od.Quantity * od.UnitPrice) AS TotalSpent
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
INNER JOIN OrderDetails od
    ON o.OrderID = od.OrderID
WHERE o.OrderStatus = 'Completed'
GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.City;


    SELECT *
FROM vw_CustomerSalesSummary
ORDER BY TotalSpent DESC;


--View 3 — Product Sales Summary


CREATE VIEW vw_ProductSalesSummary
AS
SELECT
    p.ProductID,
    p.ProductName,
    cat.CategoryName,
    SUM(od.Quantity) AS UnitsSold,
    SUM(od.Quantity * od.UnitPrice) AS Revenue
FROM Products p
INNER JOIN Categories cat
    ON p.CategoryID = cat.CategoryID
INNER JOIN OrderDetails od
    ON p.ProductID = od.ProductID
INNER JOIN Orders o
    ON od.OrderID = o.OrderID
WHERE o.OrderStatus = 'Completed'
GROUP BY
    p.ProductID,
    p.ProductName,
    cat.CategoryName;


    SELECT *
FROM vw_ProductSalesSummary
ORDER BY Revenue DESC;