# RETAIL-SALES-ANALYSIS-PROJECT
   This repository contains SQL scripts to create and analyze a `retail_sales` table. The project covers table creation, data cleaning, and exploratory analysis with SQL queries to check for missing values, duplicates, and record counts. Ideal for gaining insights into retail sales trends and customer behavior. Built using PostgreSQL.
Overview

The Retail Sales Analysis Project is a comprehensive SQL-based solution to manage and analyze retail sales data. This project involves creating a structured table to store sales transactions, performing data cleaning, and conducting exploratory data analysis (EDA) to gain insights into sales trends and customer behavior.

Table of Contents

Overview

Project Features

Technologies Used

Setup Instructions

SQL Queries

Future Enhancements

Project Features

Table Creation: Create a retail_sales table to store key transaction details like Transaction ID, Date, Customer ID, Gender, Age, Product Category, Quantity, Price per Unit, and Total Amount.

Data Cleaning: Identify and handle missing values to ensure data integrity.

Exploratory Data Analysis: Run queries to preview the dataset, retrieve column metadata, count records, and check for duplicate transactions.

Technologies Used

SQL: PostgreSQL for database management and querying.

Database Management Tools: PostgreSQL or any SQL client of your choice (e.g., pgAdmin, DBeaver).

Setup Instructions

Clone this repository:

git clone https://github.com/yourusername/retail-sales-analysis.git

Open the SQL file in your preferred SQL client.

Run the CREATE TABLE script to set up the retail_sales table.

Use the provided SQL queries for data cleaning and exploratory analysis.

SQL Queries

Table Creation:

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

Data Cleaning: Identify missing values:

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

Checking for Duplicates:

SELECT Transaction_ID, Date, COUNT(*)
FROM retail_sales
GROUP BY Transaction_ID, Date
HAVING COUNT(*) > 1;

Future Enhancements

Incorporate more advanced queries for sales trend analysis.

Add visualizations by integrating with BI tools like Tableau or Power BI.

Automate data import and cleaning processes.
