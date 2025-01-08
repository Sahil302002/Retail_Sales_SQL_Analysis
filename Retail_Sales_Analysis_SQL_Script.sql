SELECT TOP (1000) [transactions_id]
      ,[sale_date]
      ,[sale_time]
      ,[customer_id]
      ,[gender]
      ,[age]
      ,[category]
      ,[quantiy]
      ,[price_per_unit]
      ,[cogs]
      ,[total_sale]
  FROM [Retail_Sales].[dbo].[Retail_Sales_Data]

SELECT COUNT(*) Total_Records FROM Retail_Sales_Data

-- Data Cleaning
SELECT * FROM Retail_Sales_Data
WHERE transactions_id IS NULL


SELECT * FROM Retail_Sales_Data
WHERE [sale_date] IS NULL 
      
SELECT * FROM Retail_Sales_Data
WHERE [sale_time] IS NULL 
-- We can Check the Nulls by this basic way or by Using OR operator, Also we can use CASE WHEN method to do so

-- Detecting Nulls using OR operator
SELECT * FROM Retail_Sales_Data
WHERE [customer_id] IS NULL 
OR    [gender] IS NULL
OR     [age] IS NULL
OR     [category] IS NULL 
OR     [quantiy] IS NULL 
OR     [price_per_unit] IS NULL
OR     [cogs] IS NULL
OR     [total_sale] IS NULL

-- Detecting Nulls using Case when function
SELECT *
FROM Retail_Sales_Data
WHERE 
    CASE 
        WHEN [customer_id] IS NULL THEN 1
        WHEN [gender] IS NULL THEN 1
        WHEN [age] IS NULL THEN 1
        WHEN [category] IS NULL THEN 1
        WHEN [quantiy] IS NULL THEN 1
        WHEN [price_per_unit] IS NULL THEN 1
        WHEN [cogs] IS NULL THEN 1
        WHEN [total_sale] IS NULL THEN 1
        ELSE 0
    END = 1;

-- Now We can delete those Rows having Nulls using Delete function
DELETE FROM Retail_Sales_Data
WHERE 
    [customer_id] IS NULL
    OR [gender] IS NULL
    OR [age] IS NULL
    OR [category] IS NULL
    OR [quantiy] IS NULL
    OR [price_per_unit] IS NULL
    OR [cogs] IS NULL
    OR [total_sale] IS NULL;

-- Now the Count of Records is 
SELECT COUNT(*) Total_Records_After_Removing_Rows_having_Nulls FROM Retail_Sales_Data


--Data Exploration
-- How many Transaction we have?
Select COUNT(transactions_id) Total_Transactions from Retail_Sales_Data

-- How many Unique Customers we have?
Select COUNT(DISTINCT customer_id) Total_Customers from Retail_Sales_Data

-- What are the Unique Categories?
SELECT DISTINCT category Total_Customers from Retail_Sales_Data




-- Data analysis and Solution of Business Problems

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
SELECT * FROM Retail_Sales_Data
WHERE sale_date = '2022-11-05'

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' 
-- and the quantity sold is more than 10 in the month of Nov-2022

SELECT * FROM Retail_Sales_Data
WHERE category = 'Clothing'  AND FORMAT(sale_date,'MMM yyyy') = 'Nov 2022' and quantiy >= 4


-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

SELECT category, 
SUM(total_sale) as Total_Sales,
COUNT(*) Total_Orders 
FROM Retail_Sales_Data
GROUP BY category
ORDER BY SUM(total_sale) DESC

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT
AVG(age) as Avg_Age_of_Customer 
FROM Retail_Sales_Data
WHERE category = 'Beauty' 

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT * FROM Retail_Sales_Data
WHERE total_sale > 1000
ORDER BY transactions_id

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT 
category,
gender as Gender, 
COUNT(*) Total_Transaction 
FROM Retail_Sales_Data
GROUP BY category, gender
ORDER BY 1
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

SELECT 
FORMAT(sale_date,'yyyy') as Years,
FORMAT(sale_date,'MMMM') Month_Name, 
AVG(CAST(total_sale AS INT)) AS AVG_Sales_By_Month, 
RANK() OVER(PARTITION BY FORMAT(sale_date,'yyyy') ORDER BY AVG(CAST(total_sale AS INT)) DESC) AS Rank_by_Sales
FROM Retail_Sales_Data
GROUP BY FORMAT(sale_date,'yyyy'),
		 FORMAT(sale_date,'MMMM') 
-- Best Selling Month in Each Year
SELECT 
Years,
Month_Name,
AVG_Sales_By_Month 
FROM    (SELECT 
		FORMAT(sale_date,'yyyy') as Years,
		FORMAT(sale_date,'MMMM') Month_Name, 
		AVG(CAST(total_sale AS INT)) AS AVG_Sales_By_Month, 
		RANK() OVER(PARTITION BY FORMAT(sale_date,'yyyy') ORDER BY AVG(CAST(total_sale AS INT)) DESC) AS Rank_by_Avg_Sales
		FROM Retail_Sales_Data
		GROUP BY FORMAT(sale_date,'yyyy'),
				 FORMAT(sale_date,'MMMM') )t
				 
WHERE Rank_by_Avg_Sales = 1


-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales

SELECT TOP 5 customer_id, 
SUM(total_sale) as Total_Sales_by_Customer 
FROM Retail_Sales_Data
GROUP BY customer_id
ORDER BY 2 DESC

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT 
category,
COUNT(DISTINCT customer_id) Total_Unique_Customers 
FROM Retail_Sales_Data
GROUP BY category
ORDER BY 2 DESC

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17 and rest is of Night)

SELECT 
    CASE 
        WHEN DATEPART(HH,sale_time) < 12 THEN 'Morning'
        WHEN DATEPART(HH,sale_time) >= 12 AND DATEPART(HH,sale_time) < 17 THEN 'Afternoon'
        WHEN DATEPART(HH,sale_time) >= 17 AND DATEPART(HH,sale_time) < 21 THEN 'Evening'
        ELSE 'Night'
    END AS Time_Shift, COUNT(*) Total_Transaction_Orders
FROM Retail_Sales_Data
Group  by 
	CASE 
			WHEN DATEPART(HH,sale_time) < 12 THEN 'Morning'
			WHEN DATEPART(HH,sale_time) >= 12 AND DATEPART(HH,sale_time) < 17 THEN 'Afternoon'
			WHEN DATEPART(HH,sale_time) >= 17 AND DATEPART(HH,sale_time) < 21 THEN 'Evening'
			ELSE 'Night'
		END 
ORDER BY 2 DESC



