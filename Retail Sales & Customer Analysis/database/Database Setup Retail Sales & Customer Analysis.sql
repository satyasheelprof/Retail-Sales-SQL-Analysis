-- creating databade
CREATE DATABASE RetailSalesDB;



USE RetailSalesDB;



-- creating tabels
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR (100) NOT NULL
);


GO
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR (50) NOT NULL,
    LastName VARCHAR (50) NOT NULL,
    Gender VARCHAR (10),
    City VARCHAR (50),
    State VARCHAR (50),
    RegistrationDate DATE
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR (100) NOT NULL,
    CategoryID INT,
    Price DECIMAL (10, 2),
    StockQuantity INT,
    CONSTRAINT FK_Products_Categories FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    PaymentMethod VARCHAR (30),
    OrderStatus VARCHAR (30),
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL (10, 2),
    CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    CONSTRAINT FK_OrderDetails_Products FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);

--inserting values
INSERT  INTO Categories (CategoryID, CategoryName)
VALUES                 (1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home & Kitchen'),
(4, 'Books'),
(5, 'Sports');

SELECT *
FROM   Categories;

INSERT  INTO Customers (CustomerID, FirstName, LastName, Gender, City, State, RegistrationDate)
VALUES                (1, 'Rahul', 'Sharma', 'Male', 'Nagpur', 'Maharashtra', '2024-01-15'),
(2, 'Priya', 'Patil', 'Female', 'Pune', 'Maharashtra', '2024-02-10'),
(3, 'Amit', 'Verma', 'Male', 'Mumbai', 'Maharashtra', '2024-02-18'),
(4, 'Sneha', 'Joshi', 'Female', 'Nashik', 'Maharashtra', '2024-03-05'),
(5, 'Rohan', 'Deshmukh', 'Male', 'Nagpur', 'Maharashtra', '2024-03-20'),
(6, 'Neha', 'Kulkarni', 'Female', 'Pune', 'Maharashtra', '2024-04-02'),
(7, 'Akash', 'Gupta', 'Male', 'Indore', 'Madhya Pradesh', '2024-04-15'),
(8, 'Pooja', 'Mehta', 'Female', 'Mumbai', 'Maharashtra', '2024-05-01'),
(9, 'Vikas', 'Rao', 'Male', 'Hyderabad', 'Telangana', '2024-05-12'),
(10, 'Anjali', 'Singh', 'Female', 'Delhi', 'Delhi', '2024-05-25'),
(11, 'Karan', 'Pawar', 'Male', 'Aurangabad', 'Maharashtra', '2024-06-03'),
(12, 'Riya', 'Shinde', 'Female', 'Pune', 'Maharashtra', '2024-06-18'),
(13, 'Sahil', 'Khan', 'Male', 'Bhopal', 'Madhya Pradesh', '2024-07-05'),
(14, 'Komal', 'Thakur', 'Female', 'Nagpur', 'Maharashtra', '2024-07-22'),
(15, 'Nikhil', 'Jain', 'Male', 'Jaipur', 'Rajasthan', '2024-08-10');

SELECT *
FROM   Customers;

INSERT  INTO Products (ProductID, ProductName, CategoryID, Price, StockQuantity)
VALUES               (1, 'Laptop', 1, 55000.00, 25),
(2, 'Wireless Mouse', 1, 1200.00, 100),
(3, 'Keyboard', 1, 1800.00, 80),
(4, 'Smartphone', 1, 30000.00, 40),
(5, 'Headphones', 1, 2500.00, 60),
(6, 'T-Shirt', 2, 799.00, 150),
(7, 'Jeans', 2, 1499.00, 100),
(8, 'Jacket', 2, 2499.00, 50),
(9, 'Mixer Grinder', 3, 3500.00, 40),
(10, 'Coffee Maker', 3, 4500.00, 30),
(11, 'Dinner Set', 3, 2200.00, 45),
(12, 'SQL Programming Book', 4, 899.00, 70),
(13, 'Data Analytics Book', 4, 1099.00, 60),
(14, 'Cricket Bat', 5, 2800.00, 35),
(15, 'Football', 5, 1200.00, 50);

SELECT *
FROM   Products;

INSERT  INTO Orders (OrderID, CustomerID, OrderDate, PaymentMethod, OrderStatus)
VALUES             (1001, 1, '2024-06-01', 'UPI', 'Completed'),
(1002, 2, '2024-06-03', 'Credit Card', 'Completed'),
(1003, 3, '2024-06-05', 'UPI', 'Completed'),
(1004, 4, '2024-06-08', 'Debit Card', 'Completed'),
(1005, 5, '2024-06-10', 'Cash', 'Completed'),
(1006, 6, '2024-06-12', 'UPI', 'Completed'),
(1007, 7, '2024-06-15', 'Credit Card', 'Cancelled'),
(1008, 8, '2024-06-18', 'UPI', 'Completed'),
(1009, 9, '2024-06-20', 'Debit Card', 'Completed'),
(1010, 10, '2024-06-22', 'UPI', 'Completed'),
(1011, 1, '2024-07-01', 'Credit Card', 'Completed'),
(1012, 2, '2024-07-04', 'UPI', 'Completed'),
(1013, 3, '2024-07-07', 'Cash', 'Completed'),
(1014, 5, '2024-07-10', 'UPI', 'Completed'),
(1015, 6, '2024-07-12', 'Debit Card', 'Cancelled'),
(1016, 8, '2024-07-15', 'UPI', 'Completed'),
(1017, 9, '2024-07-18', 'Credit Card', 'Completed'),
(1018, 11, '2024-07-20', 'UPI', 'Completed'),
(1019, 12, '2024-07-22', 'Debit Card', 'Completed'),
(1020, 14, '2024-07-25', 'UPI', 'Completed'),
(1021, 1, '2024-08-01', 'UPI', 'Completed'),
(1022, 3, '2024-08-03', 'Credit Card', 'Completed'),
(1023, 4, '2024-08-05', 'UPI', 'Completed'),
(1024, 7, '2024-08-08', 'Debit Card', 'Completed'),
(1025, 10, '2024-08-10', 'UPI', 'Completed'),
(1026, 12, '2024-08-12', 'Credit Card', 'Completed'),
(1027, 13, '2024-08-15', 'UPI', 'Completed'),
(1028, 15, '2024-08-18', 'Debit Card', 'Completed');

SELECT *
FROM   Orders;

INSERT  INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, UnitPrice)
VALUES                   (1, 1001, 1, 1, 55000),
(2, 1001, 2, 2, 1200),
(3, 1002, 6, 2, 799),
(4, 1002, 7, 1, 1499),
(5, 1003, 4, 1, 30000),
(6, 1003, 5, 1, 2500),
(7, 1004, 9, 1, 3500),
(8, 1004, 11, 1, 2200),
(9, 1005, 14, 1, 2800),
(10, 1005, 15, 2, 1200),
(11, 1006, 13, 2, 1099),
(12, 1007, 1, 1, 55000),
(13, 1008, 8, 1, 2499),
(14, 1008, 6, 3, 799),
(15, 1009, 3, 2, 1800),
(16, 1009, 2, 1, 1200),
(17, 1010, 12, 2, 899),
(18, 1011, 1, 1, 55000),
(19, 1011, 5, 1, 2500),
(20, 1012, 7, 2, 1499),
(21, 1013, 4, 1, 30000),
(22, 1014, 9, 2, 3500),
(23, 1015, 10, 1, 4500),
(24, 1016, 6, 2, 799),
(25, 1016, 8, 1, 2499),
(26, 1017, 14, 2, 2800),
(27, 1018, 13, 1, 1099),
(28, 1019, 11, 2, 2200),
(29, 1020, 15, 3, 1200),
(30, 1021, 1, 1, 55000),
(31, 1021, 2, 1, 1200),
(32, 1022, 4, 1, 30000),
(33, 1022, 5, 2, 2500),
(34, 1023, 10, 1, 4500),
(35, 1024, 3, 1, 1800),
(36, 1024, 2, 2, 1200),
(37, 1025, 12, 1, 899),
(38, 1026, 13, 2, 1099),
(39, 1027, 14, 1, 2800),
(40, 1027, 15, 1, 1200),
(41, 1028, 7, 1, 1499),
(42, 1028, 6, 2, 799);

SELECT COUNT(*) AS TotalCustomers
FROM   Customers;

SELECT COUNT(*) AS TotalProducts
FROM   Products;

SELECT COUNT(*) AS TotalOrders
FROM   Orders;

SELECT COUNT(*) AS TotalOrderDetails
FROM   OrderDetails;