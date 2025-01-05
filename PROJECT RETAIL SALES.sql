--REATAIL SALES ANALYSIS PROJECT

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


SELECT * FROM retail_sales

SELECT COUNT(*) FROM retail_sales

--Data cleaning

SELECT * FROM retail_sales
WHERE
	Transaction_ID is NULL
	OR
	Date is NULL
	OR
	Customer_ID is NULL
	OR
	Gender is NULL
	OR
	Age is NULL
	OR
	Product_Category is NULL
	OR
	Quantity is NULL
	OR
	Price_per_Unit is NULL
	OR
	Total_Amount is NULL;
	

	--

	-- Data Exploration

	--preview the dataset
	SELECT * FROM retail_sales LIMIT 10;

	--COLUMN INFORMATION
	SELECT column_name, data_type
FROM information_schema.columns
WHERE 
	table_name = 'retail_sales';

-- COUNT RECORDS
SELECT COUNT(*) FROM retail_sales;

-- CHECK FOR DUPLICATE

SELECT "transaction_id", "date", COUNT(*) 
FROM retail_sales
GROUP BY "transaction_id", "date"
HAVING COUNT(*) > 1;


SELECT "customer_id",  COUNT(*) 
FROM retail_sales
GROUP BY "customer_id" 
HAVING COUNT(*) > 1;

--Check for Negative or Zero Values

SELECT * FROM retail_sales
WHERE 
	"quantity" <=0 OR "price_per_unit" <= 0;

-- Sales Statistics
--MINIMUM SALES, 
--MAX SALES,
--AVERAGE SALES or average order value,
--TOTAL REVENUE,
--TOTAL QUANTITY
SELECT 
    MIN(total_amount) AS MinSales,
    MAX(total_amount) AS MaxSales,
    AVG(total_amount) AS AvgSales,
	SUM(quantity) AS TOTAL_QUANTITY,
    SUM(total_amount) AS TotalRevenue
FROM retail_sales;





--

--SALES PERFORMANCE ANALYSIS

--Q1. What is the total revenue generated in each month and weekly sales trends?

SELECT
		TO_CHAR(Date,'YYYY-MM') AS Month,
		sum(total_amount) AS monthly_Revenue
		From retail_sales
		GROUP BY To_char(Date,'YYYY-MM')
		ORDER BY Month;

--weekly sales trends

SELECT
		EXTRACT(week from Date)As week,
		sum(total_amount)as weekly_revenue
		from retail_sales
		GROUP BY extract(weeK from Date)
		ORDER BY week;

--



--Q2.Which months have the highest and lowest revenues, and what might explain the differences?

--
SELECT 
    MAX(monthly_revenue) AS "HighestRevenue",
    MIN(monthly_revenue) AS "LowestRevenue",
    MAX(monthly_revenue) - MIN(monthly_revenue) AS "RevenueDifference"
FROM (
    SELECT TO_CHAR(date, 'YYYY-MM') AS "Month",
           SUM("total_amount") AS monthly_revenue
    FROM retail_sales
    GROUP BY TO_CHAR(date, 'YYYY-MM')
) AS monthly_data;



--Product Performance

--Q.3 What are the top 10 best-selling products (category) by quantity?


SELECT Product_category,
       SUM(Quantity) AS Total_Quantity
FROM retail_sales
GROUP BY Product_category
ORDER BY Total_Quantity DESC;

 --
 --	Q. 4 Which products (Category) contribute the most revenue?
 SELECT Product_category,
 		SUM(total_amount) AS total_revenue
FROM retail_sales
GROUP BY Product_category
ORDER BY total_revenue DESC;


-- Q.5 product categories have shown a consistent decline in total sales ?


SELECT
    monthly_sales.product_category,
    COUNT(*) AS declining_months
FROM
    (SELECT
        product_category,
        DATE_TRUNC('month', date) AS month,
        SUM(total_amount) AS total_sales
     FROM retail_sales
     GROUP BY product_category, DATE_TRUNC('month', date)
    ) monthly_sales
JOIN
    (SELECT
        product_category,
        DATE_TRUNC('month', date) AS month,
        SUM(total_amount) AS total_sales
     FROM retail_sales
     GROUP BY product_category, DATE_TRUNC('month', date)
    ) previous_month
    ON monthly_sales.product_category = previous_month.product_category
    AND monthly_sales.month = previous_month.month + INTERVAL '1 month'
WHERE
    monthly_sales.total_sales < previous_month.total_sales
GROUP BY
    monthly_sales.product_category
HAVING
    COUNT(*) >= 3
ORDER BY
    declining_months DESC;

--

--Customer Insights
--Q.6 What is the total number of unique customers in the dataset?


SELECT COUNT(DISTINCT customer_id) AS Total_Customers
FROM retail_sales;

-- Q.7 Which customer made the highest purchase (by Total Amount) overall?

SELECT customer_id, MAX(total_amount) AS max_purchase
FROM retail_sales
GROUP BY customer_id
ORDER BY max_purchase DESC
LIMIT 1;

--Q.8 How does the number of customers and their age distribution (average, minimum, and maximum) vary across genders?


SELECT 
    gender, 
    COUNT(customer_id) AS customer_count, 
    AVG(age) AS avg_age, 
    MIN(age) AS min_age, 
    MAX(age) AS max_age
FROM retail_sales
GROUP BY gender;




--Time-Based Trends

--Q.9 What is the monthly sales trend for the dataset period?

SELECT 
    DATE_TRUNC('month', DATE) AS month, 
    SUM(total_amount) AS monthly_sales
FROM retail_sales
GROUP BY DATE_TRUNC('month', DATE)
ORDER BY month;


-- Q.10 Which day of the week records the highest average sales?


SELECT TO_CHAR(date, 'Day') AS day_of_week, AVG(total_amount) AS average_sales
FROM retail_sales
GROUP BY TO_CHAR(date, 'Day')
ORDER BY average_sales DESC
LIMIT 1;


--Advanced Insights
--Q.11 What is the correlation between the quantity purchased and the total amount for all transactions?


SELECT 
    (SUM(quantity * total_amount) - SUM(quantity) * SUM(total_amount) / COUNT(*)) / 
    (SQRT(SUM(quantity * quantity) - SUM(quantity) * SUM(quantity) / COUNT(*)) * 
     SQRT(SUM(total_amount * total_amount) - SUM(total_amount) * SUM(total_amount) / COUNT(*))) AS correlation
FROM retail_sales;

--Q.12 Which gender contributes more to the total revenue, and by what percentage

SELECT 
    gender, 
    SUM(total_amount) AS total_revenue,
    (SUM(total_amount) * 100.0 / (SELECT SUM(total_amount) FROM retail_sales)) AS revenue_percentage
FROM retail_sales
GROUP BY gender
ORDER BY total_revenue DESC;


--END


 

 
 




