CREATE DATABASE Capstone_project;
USE Capstone_project;

ALTER TABLE `western countries financial data` 
RENAME TO financial_data;

ALTER TABLE financial_data
RENAME COLUMN `ï»¿segment` TO segment;


-- Q1. Retrieve all distinct countries from the dataset.

SELECT DISTINCT country
FROM financial_data;


-- Q2. Find the total number of units sold across all products.

SELECT SUM(Units_Sold) AS total_units_sold
FROM financial_data;


-- Q3. List all unique products available in the dataset.

SELECT DISTINCT product
FROM financial_data;


-- Q4. Show the top 10 rows ordered by highest sales.

SELECT *
FROM financial_data
ORDER BY Sales DESC
LIMIT 10;


-- Q5. Calculate total sales per country.

SELECT Country, SUM(Sales) AS Total_Sales
FROM financial_data
GROUP BY Country
ORDER BY Total_Sales DESC;


-- Q6. Find the average units sold per segment.

SELECT segment, ROUND(AVG(Units_sold),2) AS Avg_Units_sold
FROM financial_data
GROUP BY segment
ORDER BY Avg_Units_sold DESC;


-- Q7. Get the sum of gross sales for each product.

SELECT Product, SUM(Gross_Sales) AS Total_Gross_Sales
FROM financial_data
GROUP BY Product
ORDER BY Total_Gross_Sales DESC;


-- Q8. Show the maximum and minimum sale price of each product.

SELECT Product, 
		MAX(Sale_Price) AS Max_Sale_Price,
		MIN(Sale_Price) AS Min_Sale_Price
FROM financial_data
GROUP BY Product
ORDER BY Product DESC;


-- Q9. Count how many transactions (rows) each segment has.

SELECT Segment, COUNT(*) AS Transaction_Count
FROM financial_data
GROUP BY Segment
ORDER BY Transaction_Count DESC;


-- Q10. Find all records where sales are greater than 50,000.

SELECT *
FROM financial_data
WHERE Sales > 50000
ORDER BY Sales DESC; 


-- Q11. Retrieve sales records only for Germany and France.

SELECT Country, Sales
FROM financial_data
WHERE Country IN ('Germany', 'France')
ORDER BY Country, Sales DESC;


-- Q12. Show details of transactions where discount is not zero.

SELECT *
FROM financial_data
WHERE Discounts <> 0
ORDER BY Discounts DESC;


-- Q13. List all products sold in the "Government" segment.

SELECT  Product
FROM financial_data
WHERE Segment = 'Government'
ORDER BY Product;


-- Q14. Find sales where COGS > 20,000.

SELECT *
FROM financial_data
WHERE `Corrected COGS` > 20000
ORDER BY `Corrected COGS` DESC;


-- Q15. Calculate profit (Sales – COGS) per country.

SELECT Country, SUM(Sales - `Corrected COGS`) AS Total_Profit
FROM financial_data
GROUP BY Country
ORDER BY Total_Profit DESC;


-- Q16. Find the product with the highest total profit.

SELECT Product, SUM(`Corrected Profit`) AS Total_Profit
FROM financial_data
GROUP BY Product
ORDER BY Total_Profit DESC
LIMIT 1;


-- Q17. Show average sales per product in each segment.

SELECT segment, Product, AVG(sales) AS Avg_Sales
FROM financial_data
GROUP BY segment, Product
ORDER BY  Avg_Sales DESC;


-- Q18. Rank countries by their total gross sales (use RANK() or DENSE_RANK()).

SELECT Country, 
		SUM(Gross_Sales) AS Total_Gross_Sales,
        DENSE_RANK() OVER (ORDER BY SUM(Gross_Sales) DESC) AS Sales_Rank
FROM financial_data
GROUP BY Country
ORDER BY Sales_Rank;


-- Q19. Find the top 3 countries with the highest units sold.

SELECT Country, SUM(Units_Sold) AS Total_Units_Sold
FROM financial_data
GROUP BY Country
ORDER BY Total_Units_Sold DESC
LIMIT 3;







