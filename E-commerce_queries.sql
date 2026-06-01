SELECT *
FROM ecommerce_sales;

RENAME TABLE `dataset for data analytics 2` TO ecommerce_sales;

SELECT SUM(TotalPrice) Revenue
FROM ecommerce_sales;

SELECT COUNT(*) Total_order
From ecommerce_sales;

SELECT AVG(TotalPrice) Avg_total_price
FROM ecommerce_sales;

SELECT Product, 
ROUND(SUM(TotalPrice),2)  Revenue
FROM ecommerce_sales
GROUP BY Product
ORDER BY Revenue DESC;

SELECT OrderStatus,
COUNT(*) AS Total_Orders,
ROUND(SUM(TotalPrice), 2) AS Revenue
FROM ecommerce_sales
GROUP BY OrderStatus
ORDER BY Total_Orders DESC;

SELECT PaymentMethod,
COUNT(*) AS Total_Orders
FROM ecommerce_sales
GROUP BY PaymentMethod
ORDER BY Total_Orders DESC;

SELECT ï»¿OrderID, Product, 
TotalPrice
FROM ecommerce_sales
ORDER BY TotalPrice DESC
LIMIT 10;

SELECT * FROM ecommerce_sales
WHERE OrderStatus = 'Delivered';

SELECT * FROM ecommerce_sales
WHERE TotalPrice > 1053.97
ORDER BY TotalPrice DESC;

SELECT ReferralSource,
COUNT(*) AS Total_Orders
FROM ecommerce_sales
GROUP BY ReferralSource
ORDER BY Total_Orders DESC;

SET SQL_SAFE_UPDATES = 0;
UPDATE ecommerce_sales 
SET Date = STR_TO_DATE(Date, '%m/%d/%Y');

SELECT Date 
FROM ecommerce_sales;

ALTER TABLE ecommerce_sales 
MODIFY COLUMN Date DATE;

SELECT YEAR(Date) AS Year,
ROUND(SUM(TotalPrice), 2) AS Revenue
FROM ecommerce_sales
GROUP BY YEAR(Date)
ORDER BY Year;

SELECT YEAR(Date) AS Year,
MONTH(Date) AS Month,
ROUND(SUM(TotalPrice), 2) AS Revenue
FROM ecommerce_sales
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY Year, Month;

SELECT 
CASE WHEN CouponCode = 'N/A' THEN 'No Coupon'
ELSE 'Used Coupon' END AS Coupon_Usage,
COUNT(*) AS Total_Orders
FROM ecommerce_sales
GROUP BY CASE WHEN CouponCode = 'N/A' THEN 'No Coupon'
ELSE 'Used Coupon' END;