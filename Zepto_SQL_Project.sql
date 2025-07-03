CREATE DATABASE IF NOT EXISTS ECOMMERCE;

USE ECOMMERCE; 
DROP TABLE zepto;

CREATE TABLE Zepto (
Sku_ID INT AUTO_INCREMENT PRIMARY KEY,
Category VARCHAR(120),
Name VARCHAR(150) NOT NULL,
MRP DECIMAL(8,2) CHECK (MRP>=0),
Discount_percent DECIMAL(5,2) CHECK(Discount_percent BETWEEN 0 AND 100),
Available_quantity INT CHECK(Available_quantity >=0),
Discounted_selling_price DECIMAL(8,2) CHECK(Discounted_selling_price >=0),
Weight_in_Gms INT CHECK(Weight_in_Gms >=0),
Out_of_stock BOOLEAN,
Quantity INT CHECK(Quantity >=0)
);

# Data Explorationzepto
 
# Count of Rows
SELECT COUNT(*) FROM Zepto;

-- Sample Data
SELECT * FROM Zepto 
LIMIT 10;

# Null Values
SELECT * FROM Zepto
WHERE name IS NULL 
OR
MRP IS NULL 
OR
Discount_percent IS NULL 
OR
Available_quantity IS NULL 
OR
Discounted_selling_price IS NULL 
OR
Weight_in_Gms IS NULL 
OR
Out_of_stock IS NULL
OR 
Quantity IS NULL;

# Different Product Categories
SELECT DISTInCT Category 
From Zepto 
ORDER BY Category;

# Products in Stock V/s Out of Stock
SELECT Out_of_stock, COUNT(Sku_ID)
FROM Zepto
GROUP BY Out_of_stock;

# Product names presents multiple times
SELECT Name, COUNT(Sku_ID) AS "Number of SKU's"
FROM Zepto
GROUP BY Name
HAVING COUNT(Sku_ID)>1
ORDER BY COUNT(Sku_ID) DESC;

# Data Cleaning 

# Products with Price = 0 
SELECT * FROM Zepto
WHERE MRP = 0 OR Discounted_selling_price = 0;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM Zepto
WHERE MRP = 0;

SET SQL_SAFE_UPDATES = 1;

# Conver Paise to Rupees
SET SQL_SAFE_UPDATES = 0;

UPDATE Zepto
SET MRP = MRP/100.0,
Discounted_selling_price = Discounted_selling_price/100.0;

SET SQL_SAFE_UPDATES = 1;

SELECT MRP, Discounted_selling_price FROM zepto;

# 1. Find the top 10 best-value products based on the discount percentage.
SELECT Name, MRP, Discount_percent
FROM Zepto
ORDER BY Discount_percent DESC
LIMIT 10;

# 2. What are the products with high MRP but out of stock.
SELECT DISTINCT Name, MRP
FROM zepto
WHERE Out_of_stock = 1 AND MRP > 300
ORDER BY MRP DESC;

# 3. Calculate Estimated Revenue for each Category 
SELECT Category,
SUM(Discounted_selling_price * Available_quantity) AS Total_Revenue
FROM Zepto
GROUP BY Category
ORDER BY Total_Revenue;

# 4.Find all the products where MRP is greater than 500 and discount is Less tha 10%.
SELECT DISTINCT Name, MRP, Discount_percent FROM Zepto
WHERE MRP >500 AND Discount_percent < 10
ORDER BY MRP DESC, Discount_percent DESC;

# 5. Identify the top 5 categories offering the highest average discount percentage
SELECT Category, ROUND(AVG(Discount_percent),2) AS Avg_discount
FROM Zepto
GROUP BY Category
ORDER BY Avg_discount DESC
LIMIT 5;

# 6. Find the price per gram for products above 100g an sort by best values
SELECT DISTINCT Name, Weight_in_Gms, Discounted_selling_price,
ROUND(Discounted_selling_price/Weight_In_Gms,2) AS Price_per_Gm 
FROM Zepto
WHERE Weight_in_Gms >= 100
ORDER BY Price_per_Gm;

# 7. Group the Products into Categories like Low, Medium, Bulk.
SELECT DISTINCT Name, Weight_in_Gms,
CASE WHEN Weight_in_Gms < 1000 THEN 'Low'
	 WHEN Weight_in_Gms < 5000 THEN 'Medium'
     ELSE 'Bulk'
     END AS Weight_category
FROM Zepto;

# 8. What is the Total Inventory Weight per Category 
SELECT Category, SUM(Weight_in_Gms * Available_Quantity) AS Total_Weight 
FROM Zepto
GROUP BY Category
ORDER BY Total_Weight;