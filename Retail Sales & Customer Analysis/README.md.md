### Retail Sales \& Customer Analysis



##### Project Overview



This project analyzes retail sales data using SQL Server to generate meaningful business insights about customers, products, sales performance, inventory, payment methods, and purchasing behavior.



The project simulates a real-world Junior Data Analyst / SQL Developer workflow, starting from database design and data creation and progressing to business analysis and reusable SQL views.







##### Project Objectives



The main objectives of this project are to:



Analyze overall retail sales performance

Identify top-performing products

Identify high-value customers

Analyze revenue by product category

Analyze customer purchasing behavior

Analyze payment methods

Identify low-stock products

Analyze cancelled orders

Analyze monthly sales trends

Analyze sales by city

Create reusable SQL views for reporting







##### Technologies Used



SQL Server

SQL Server Management Studio (SSMS)\*\*

SQL

Git \& GitHub







#### Database Structure



The database is named:



###### **RetailSalesDB**



##### Tables



| Table        | Description                                           |

| ------------ | ----------------------------------------------------- |

| Categories   | Stores product categories                             |

| Customers    | Stores customer information                           |

| Products     | Stores product details and inventory                  |

| Orders       | Stores customer orders                                |

| OrderDetails | Stores products and quantities associated with orders |



&#x20;Relationships





Categories

&#x20;   │

&#x20;   └── Products

&#x20;          │

&#x20;          └── OrderDetails

&#x20;                   │

Orders ─────────────┘

&#x20;  │

&#x20;  └── Customers









##### SQL Analysis Performed



###### Basic Analysis



The project includes queries using:



1 SELECT

2 WHERE

3 DISTINCT

4 ORDER BY

5 TOP

6 BETWEEN

7 COUNT

8 SUM

9 AVG

10 MIN

11 MAX

12 GROUP BY

13 INNER JOIN

14 LEFT JOIN



##### Business Analysis



Business-focused analysis includes:



1 Total revenue

2 Top 5 customers by spending

3 Top 5 products by revenue

4 Revenue by category

5 Average order value

6 Customers with no purchases

7 Low-stock products

8 Revenue by payment method

9 Cancelled order percentage

10 Monthly sales analysis

11 Customer spending segmentation

12 Best-selling products

13 Most active customers

14 Revenue by city



###### &#x20;SQL Views



Three reusable views were created:



&#x20;`vw\_CompletedSales`

&#x20;`vw\_CustomerSalesSummary`

&#x20;`vw\_ProductSalesSummary`



These views simplify future reporting and dashboard development.







##### Key Business Questions



This project answers questions such as:



1\. What is the total completed sales revenue?

2\. Which customers spend the most?

3\. Which products generate the highest revenue?

4\. Which product categories perform best?

5\. What is the average order value?

6\. Which customers have never made a purchase?

7\. Which products have low inventory?

8\. Which payment method generates the most revenue?

9\. What percentage of orders are cancelled?

10\. How does revenue change month by month?

11\. Which customers are high-value customers?

12\. Which products sell the most units?

13\. Which customers place the most orders?

14\. Which cities generate the highest revenue?







##### Business Insights



The analysis can be used to identify:



1 High-value customers who may be targeted with loyalty programs

2 High-performing products that contribute significantly to revenue

3 Categories that require additional marketing

4 Products requiring inventory replenishment

5 Customer purchasing patterns

6 Preferred payment methods

7 Monthly sales trends

8 Cities with strong sales performance

9 Cancelled-order patterns





#### Project Structure





Retail-Sales-SQL-Analysis

│

├── README.md

│

├── database

│   ├── 01\_create\_database.sql

│   ├── 02\_create\_tables.sql

│   └── 03\_insert\_data.sql

│

├── queries

│   ├── 01\_basic\_analysis.sql

│   ├── 02\_business\_analysis.sql

│   └── 03\_views.sql

│

├── documentation

│   └── project\_documentation.md

│

└── screenshots

&#x20;   ├── database\_structure.png

&#x20;   ├── customer\_analysis.png

&#x20;   └── product\_performance.png









##### How to Run the Project



###### &#x20;Step 1 — Create the Database



Open SQL Server Management Studio and execute:



Execute:



Database Setup Retail Sales \& Customer Analysis.sql





###### Step 2 — Run Basic Analysis



Execute:



queries 01\_basic\_analysis.sql



###### Step 3 — Run Business Analysis



Execute:



queries 02\_business\_analysis.sql





###### Step 4 — Create SQL Views



Execute:



03\_views.sql









##### Project Screenshots



###### Database Structure



The database contains five related tables for customers, products, categories, orders, and order details.



###### Customer Analysis



Customer-level analysis identifies purchasing frequency and customer spending.



###### Product Performance



Product-level analysis identifies units sold and revenue generated by individual products.







##### Future Improvements



###### The project can be further improved by:



1 Connecting the SQL database to Power BI

2 Creating an interactive sales dashboard

3 Adding profit and cost analysis

4 Adding larger datasets

5 Implementing advanced customer segmentation

5 Adding sales forecasting

6 Creating automated reporting

7 Implementing stored procedures

8 Adding query optimization and indexing







##### Author



###### Satyasheel Chaware



BTech Computer Science Engineering

Aspiring Data Analyst / SQL Developer



Skills Demonstrated

SQL,SQL Server, SSMS, Data Analysis, Database Design, Joins, Aggregations, Business Analysis, SQL Views .



