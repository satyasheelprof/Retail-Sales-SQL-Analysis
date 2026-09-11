USE RetailSalesDB;

--Query 1 — Display all customers
SELECT *
FROM   Customers;

--Query 2 — Display specific customer information
SELECT CustomerID,
       FirstName,
       LastName,
       City
FROM   Customers;

--Query 3 — Find customers from Pune
SELECT CustomerID,
       FirstName,
       LastName,
       City
FROM   Customers
WHERE  City = 'Pune';

--Query 4 — Find expensive products
SELECT ProductID,
       ProductName,
       Price
FROM   Products
WHERE  Price > 5000;

--Query 5 — Find products between ₹1,000 and ₹5,000
SELECT ProductName,
       Price
FROM   Products
WHERE  Price BETWEEN 1000 AND 5000;

--Query 6 — Find customers from Maharashtra
SELECT FirstName,
       LastName,
       City,
       State
FROM   Customers
WHERE  State = 'Maharashtra';

--Query 7 — Find completed orders
SELECT OrderID,
       CustomerID,
       OrderDate,
       PaymentMethod,
       OrderStatus
FROM   Orders
WHERE  OrderStatus = 'Completed';

--Query 8 — Find unique cities
SELECT DISTINCT City
FROM   Customers;

--Query 9 — Find unique payment methods
SELECT DISTINCT PaymentMethod
FROM   Orders;

--Query 10 — Most expensive products
SELECT   ProductName,
         Price
FROM     Products
ORDER BY Price DESC;

--Query 11 — Cheapest products
SELECT   ProductName,
         Price
FROM     Products
ORDER BY Price ASC;

--Query 12 — Most expensive 5 products
SELECT   TOP 5 ProductName,
               Price
FROM     Products
ORDER BY Price DESC;

--Query 13 — Total number of customers
SELECT COUNT(*) AS TotalCustomers
FROM   Customers;

--Query 14 — Total number of products
SELECT COUNT(*) AS TotalProducts
FROM   Products;

--Query 15 — Total number of orders
SELECT COUNT(*) AS TotalOrders
FROM   Orders;

--Query 16 — Average product price
SELECT AVG(Price) AS AverageProductPrice
FROM   Products;

--Query 17 — Highest product price
SELECT MAX(Price) AS HighestPrice
FROM   Products;

--Query 18 — Lowest product price
SELECT MIN(Price) AS LowestPrice
FROM   Products;

--Query 19 — Total inventory
SELECT SUM(StockQuantity) AS TotalStock
FROM   Products;

--Query 20 — Customers by city
SELECT   City,
         COUNT(*) AS CustomerCount
FROM     Customers
GROUP BY City
ORDER BY CustomerCount DESC;

--Query 21 — Orders by payment method
SELECT   PaymentMethod,
         COUNT(*) AS NumberOfOrders
FROM     Orders
GROUP BY PaymentMethod
ORDER BY NumberOfOrders DESC;

--Query 22 — Orders by status
SELECT   OrderStatus,
         COUNT(*) AS NumberOfOrders
FROM     Orders
GROUP BY OrderStatus;

--Query 23 — Products by category
SELECT   c.CategoryName,
         COUNT(p.ProductID) AS NumberOfProducts
FROM     Categories AS c
         INNER JOIN
         Products AS p
         ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName
ORDER BY NumberOfProducts DESC;
