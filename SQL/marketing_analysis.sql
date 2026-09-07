-- Dot & Key Brand Launch Intelligence
-- SQL Marketing Analysis


-- 1. Revenue by Marketing Channel
SELECT
    Marketing_Channel,
    SUM(Revenue) AS Total_Revenue
FROM orders
GROUP BY Marketing_Channel
ORDER BY Total_Revenue DESC;


-- 2. Profit by Marketing Channel
SELECT
    Marketing_Channel,
    SUM(Revenue) AS Total_Revenue,
    SUM(Ad_Spend) AS Total_Ad_Spend,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Marketing_Channel
ORDER BY Total_Profit DESC;


-- 3. Product Performance
SELECT
    Product,
    Category,
    SUM(Quantity) AS Units_Sold,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Product, Category
ORDER BY Total_Revenue DESC;


-- 4. Customer Segment Performance
SELECT
    Customer_Segment,
    COUNT(DISTINCT Customer_ID) AS Unique_Customers,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit,
    AVG(Revenue) AS Average_Order_Value
FROM orders
GROUP BY Customer_Segment
ORDER BY Total_Revenue DESC;


-- 5. ROAS by Marketing Channel
SELECT
    Marketing_Channel,
    SUM(Revenue) AS Total_Revenue,
    SUM(Ad_Spend) AS Total_Ad_Spend,
    ROUND(SUM(Revenue) / SUM(Ad_Spend), 2) AS ROAS
FROM orders
GROUP BY Marketing_Channel
ORDER BY ROAS DESC;


-- 6. Campaign Conversion Performance
SELECT
    Campaign,
    SUM(Impressions) AS Total_Impressions,
    SUM(Clicks) AS Total_Clicks,
    SUM(Leads) AS Total_Leads,
    SUM(Conversions) AS Total_Conversions,
    ROUND(SUM(Conversions) * 100.0 / SUM(Clicks), 2) AS Conversion_Rate
FROM orders
GROUP BY Campaign
ORDER BY Conversion_Rate DESC;
