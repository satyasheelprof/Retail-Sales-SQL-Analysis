# Retail Sales & Customer Analysis

## 1. Introduction

Retail businesses generate large amounts of customer, product, and transaction data.

The purpose of this project is to analyze retail sales data using SQL Server and identify useful business insights related to customers, products, sales, inventory, payment methods, and order trends.

This project demonstrates the practical use of SQL for data analysis and business decision-making.

---

## 2. Problem Statement

A retail business needs to understand its sales performance and customer purchasing behavior.

The company wants to answer questions such as:

- Which customers generate the most revenue?
- Which products sell the most?
- Which categories perform best?
- Which cities generate the highest revenue?
- Which products have low inventory?
- Which payment methods are most commonly used?
- What percentage of orders are cancelled?
- How does revenue change over time?

SQL is used to analyze the database and answer these business questions.

---

## 3. Project Objectives

The main objectives are:

1. Design a relational retail sales database.
2. Store customer, product, category, order, and transaction information.
3. Analyze sales performance.
4. Identify high-value customers.
5. Identify high-performing products.
6. Analyze category-level revenue.
7. Analyze payment methods.
8. Identify low-stock products.
9. Analyze cancelled orders.
10. Create reusable SQL views for reporting.

---

## 4. Tools & Technologies

- SQL Server
- SQL Server Management Studio (SSMS)
- SQL
- GitHub

---

## 5. Database Design

The database is named:

`RetailSalesDB`

The database contains five tables:

### Categories

Stores product category information.

### Customers

Stores customer information such as name, gender, city, state, and registration date.

### Products

Stores product information including category, price, and stock quantity.

### Orders

Stores order information including customer, order date, payment method, and order status.

### OrderDetails

Stores individual products included in each order along with quantity and unit price.

---

## 6. Relationships

The database follows a relational structure.

```text
Categories
     │
     │ 1-to-many
     ▼
Products
     │
     │ 1-to-many
     ▼
OrderDetails
     ▲
     │
     │ many-to-1
Orders
     ▲
     │
     │ many-to-1
Customers
