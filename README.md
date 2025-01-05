# RETAIL-SALES-ANALYSIS-PROJECT
   This repository contains SQL scripts to create and analyze a `retail_sales` table. The project covers table creation, data cleaning, and exploratory analysis with SQL queries to check for missing values, duplicates, and record counts. Ideal for gaining insights into retail sales trends and customer behavior. Built using PostgreSQL.
Overview

The Retail Sales Analysis Project is a comprehensive SQL-based solution to manage and analyze retail sales data. This project involves creating a structured table to store sales transactions, performing data cleaning, and conducting exploratory data analysis (EDA) to gain insights into sales trends and customer behavior.

#Table of Contents:-

1.Overview

2.Project Features

3.Technologies Used

4.Setup Instructions

5.SQL Queries

6.Future Enhancements



$_Table Creation_: Create a retail_sales table to store key transaction details like Transaction ID, Date, Customer ID, Gender, Age, Product Category, Quantity, Price per Unit, and Total Amount.

_#Data Cleaning_: Identify and handle missing values to ensure data integrity.

#_Exploratory Data Analysis:_ Run queries to preview the dataset, retrieve column metadata, count records, and check for duplicate transactions.

#_Technologies Used_

SQL: PostgreSQL for database management and querying.

Database Management Tools: PostgreSQL or any SQL client of your choice (e.g., pgAdmin, DBeaver).

#Setup Instructions



Open the SQL file in your preferred SQL client.

Run the CREATE TABLE script to set up the retail_sales table.

Use the provided SQL queries for data cleaning and exploratory analysis.

#**_SQL Queries_
**
_Table Creation_:

CREATE TABLE retail_sales (
    Transaction_ID INT PRIMARY KEY,
    Date DATE,
    Customer_ID VARCHAR(10),
    Gender CHAR(10),
    Age INT,
    Product_Category VARCHAR(15),
    Quantity INT,
    Price_per_unit INT,
    Total_Amount INT
);

_Data Cleaning: Identify missing values:_

SELECT * FROM retail_sales
WHERE Transaction_ID IS NULL
   OR Date IS NULL
   OR Customer_ID IS NULL
   OR Gender IS NULL
   OR Age IS NULL
   OR Product_Category IS NULL
   OR Quantity IS NULL
   OR Price_per_unit IS NULL
   OR Total_Amount IS NULL;

_Checking for Duplicates:_

SELECT Transaction_ID, Date, COUNT(*)
FROM retail_sales
GROUP BY Transaction_ID, Date
HAVING COUNT(*) > 1;

**_Future Enhancements_**
_
Incorporate more advanced queries for sales trend analysis.

Add visualizations by integrating with BI tools like Tableau or Power BI.

Automate data import and cleaning processes._
