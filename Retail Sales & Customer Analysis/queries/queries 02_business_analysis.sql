USE RetailSalesDB;


--1. Total Completed Revenue
--Revenue = Quantity × UnitPrice


SELECT
    SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM OrderDetails od
INNER JOIN Orders o
    ON od.OrderID = o.OrderID
WHERE o.OrderStatus = 'Completed';


--2. Top 5 Customers by Spending


SELECT TOP 5
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
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
    c.LastName
ORDER BY TotalSpent DESC;


--3. Top 5 Products by Revenue


SELECT TOP 5
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity * od.UnitPrice) AS Revenue
FROM Products p
INNER JOIN OrderDetails od
    ON p.ProductID = od.ProductID
INNER JOIN Orders o
    ON od.OrderID = o.OrderID
WHERE o.OrderStatus = 'Completed'
GROUP BY
    p.ProductID,
    p.ProductName
ORDER BY Revenue DESC;


--4. Revenue by Category

SELECT
    c.CategoryName,
    SUM(od.Quantity * od.UnitPrice) AS Revenue
FROM Categories c
INNER JOIN Products p
    ON c.CategoryID = p.CategoryID
INNER JOIN OrderDetails od
    ON p.ProductID = od.ProductID
INNER JOIN Orders o
    ON od.OrderID = o.OrderID
WHERE o.OrderStatus = 'Completed'
GROUP BY c.CategoryName
ORDER BY Revenue DESC;

--5. Average Order Value

SELECT
    AVG(OrderTotal) AS AverageOrderValue
FROM
(
    SELECT
        o.OrderID,
        SUM(od.Quantity * od.UnitPrice) AS OrderTotal
    FROM Orders o
    INNER JOIN OrderDetails od
        ON o.OrderID = od.OrderID
    WHERE o.OrderStatus = 'Completed'
    GROUP BY o.OrderID
) AS OrderSummary;


--6. Customers Who Never Purchased


SELECT
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

--7. Low-Stock Products


SELECT
    ProductID,
    ProductName,
    StockQuantity
FROM Products
WHERE StockQuantity < 50
ORDER BY StockQuantity ASC;


--8. Revenue by Payment Method


SELECT
    o.PaymentMethod,
    SUM(od.Quantity * od.UnitPrice) AS Revenue
FROM Orders o
INNER JOIN OrderDetails od
    ON o.OrderID = od.OrderID
WHERE o.OrderStatus = 'Completed'
GROUP BY o.PaymentMethod
ORDER BY Revenue DESC;


--9. Cancelled Order Percentage


SELECT
    CAST(
        100.0 * SUM(
            CASE
                WHEN OrderStatus = 'Cancelled' THEN 1
                ELSE 0
            END
        ) / COUNT(*) AS DECIMAL(5,2)
    ) AS CancelledOrderPercentage
FROM Orders;


--10. Orders by Month


SELECT
    YEAR(o.OrderDate) AS OrderYear,
    MONTH(o.OrderDate) AS OrderMonth,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    SUM(od.Quantity * od.UnitPrice) AS Revenue
FROM Orders o
INNER JOIN OrderDetails od
    ON o.OrderID = od.OrderID
WHERE o.OrderStatus = 'Completed'
GROUP BY
    YEAR(o.OrderDate),
    MONTH(o.OrderDate)
ORDER BY
    OrderYear,
    OrderMonth;



--11. Customer Spending Classification


SELECT
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    SUM(od.Quantity * od.UnitPrice) AS TotalSpent,

    CASE
        WHEN SUM(od.Quantity * od.UnitPrice) >= 50000
            THEN 'High Value'

        WHEN SUM(od.Quantity * od.UnitPrice) >= 20000
            THEN 'Medium Value'

        ELSE 'Low Value'
    END AS CustomerSegment

FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
INNER JOIN OrderDetails od
    ON o.OrderID = od.OrderID

WHERE o.OrderStatus = 'Completed'

GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName

ORDER BY TotalSpent DESC;


--12. Best-Selling Product by Quantity

SELECT TOP 1
    p.ProductName,
    SUM(od.Quantity) AS UnitsSold
FROM Products p
INNER JOIN OrderDetails od
    ON p.ProductID = od.ProductID
INNER JOIN Orders o
    ON od.OrderID = o.OrderID
WHERE o.OrderStatus = 'Completed'
GROUP BY p.ProductName
ORDER BY UnitsSold DESC;

--13. Most Active Customers

SELECT TOP 5
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE o.OrderStatus = 'Completed'
GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName
ORDER BY TotalOrders DESC;

--14. Revenue by City

SELECT
    c.City,
    SUM(od.Quantity * od.UnitPrice) AS Revenue
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
INNER JOIN OrderDetails od
    ON o.OrderID = od.OrderID
WHERE o.OrderStatus = 'Completed'
GROUP BY c.City
ORDER BY Revenue DESC;


--15. Complete Sales Report

SELECT
    o.OrderID,
    o.OrderDate,

    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,

    c.City,

    p.ProductName,

    cat.CategoryName,

    od.Quantity,

    od.UnitPrice,

    od.Quantity * od.UnitPrice AS LineTotal,

    o.PaymentMethod,

    o.OrderStatus

FROM Orders o

INNER JOIN Customers c
    ON o.CustomerID = c.CustomerID

INNER JOIN OrderDetails od
    ON o.OrderID = od.OrderID

INNER JOIN Products p
    ON od.ProductID = p.ProductID

INNER JOIN Categories cat
    ON p.CategoryID = cat.CategoryID

ORDER BY o.OrderDate, o.OrderID;


