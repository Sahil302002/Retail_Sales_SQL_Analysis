# Retail_Sales_SQL_Analysis
## **Project Overview**

This project demonstrates essential SQL skills and techniques for exploring, cleaning, and analyzing retail sales data. By setting up a comprehensive retail sales database, the project delves into the practical application of SQL for answering business-related questions and uncovering insights. It is designed for beginner-level data analysts aiming to build a solid foundation in SQL.

---

## **Objectives**

The primary goals of this project include:

1. **Database Setup**: Create and populate a retail sales database to store sales data.
2. **Data Cleaning**: Identify and resolve records with missing or null values to ensure data quality.
3. **Data Exploration**: Use SQL to explore and understand the dataset.
4. **Insights Generation**: Answer business-driven questions through SQL queries to derive actionable insights.

---

## **Project Structure**

### **1. Database Setup**

- **Database Creation**: A database named `p1_retail_db` is created.
- **Table Setup**: A `retail_sales` table is created with the following columns:
    - `transactions_id`: Unique identifier for each transaction.
    - `sale_date` & `sale_time`: Date and time of the transaction.
    - `customer_id`, `gender`, `age`: Customer information.
    - `category`, `quantity`, `price_per_unit`, `cogs`, `total_sale`: Product and transaction details.

### **2. Data Cleaning**

- Checked for null or missing values across all columns using SQL queries.
- Removed rows containing null values to maintain data integrity.

### **3. Data Exploration**

- **Key Queries**:
    - Counted total transactions and unique customers.
    - Identified distinct product categories.
    - Aggregated transaction data to analyze customer demographics and high-value transactions.

---

## **Data Cleaning**

### **Steps Undertaken**:

1. **Detecting Nulls**:Used SQL queries with `OR` conditions and `CASE` statements to find missing values in key columns.
2. **Removing Null Records**:Deleted rows with null values using the `DELETE` statement to ensure data consistency.
3. **Validation**:Verified the updated record count to confirm successful cleanup.

---

## **Data Exploration**

### **Exploration Queries**:

- **Total Records**: Identified the total number of transactions.
- **Unique Customers**: Counted distinct customer IDs.
- **Product Categories**: Retrieved unique product categories in the dataset.

### **Sample Queries**:

- To find total transactions:
    
    ```sql
    
    SELECT COUNT(transactions_id) AS Total_Transactions FROM Retail_Sales_Data;
    
    ```
    
- To list unique product categories:
    
    ```sql
    
    SELECT DISTINCT category FROM Retail_Sales_Data;
    
    ```
    

---

## **Data Insights**

### Key Findings:

1. **Customer Demographics**:
    - Diverse customer age groups contributed to sales.
    - Gender distribution highlighted specific preferences in product categories.
2. **High-Value Transactions**:
    - Premium purchases (total sales > 1000) were frequent.
3. **Sales Trends**:
    - Monthly analysis revealed seasonal sales peaks.
4. **Top Categories and Customers**:
    - Clothing and Beauty categories had the highest sales.
    - Identified top-spending customers through aggregated sales data.

---

## **Recommendations**

Based on insights, the following recommendations were made:

1. Focus marketing efforts on peak seasons identified in the analysis.
2. Promote high-value products to target premium customers.
3. Offer targeted promotions to loyal customers in the top categories.
4. Leverage demographic data to design gender-specific or age-specific campaigns.

---

## **Conclusion**

This project highlights how SQL can be used to analyze retail sales data effectively. From database setup to data cleaning, exploration, and deriving insights, it covers a wide range of SQL techniques that are critical for a beginner data analyst. The findings provide actionable business recommendations to improve customer targeting and optimize sales strategies.
