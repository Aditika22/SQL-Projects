/*Total sales for each category:*/
SELECT Category, SUM(Purchase_Amount) AS Total_sales
FROM shopping_trends
GROUP BY Category;

/*Average previous purchases:*/
SELECT Category, round(AVG(Previous_Purchases),2)AS Avg_Purchases
FROM shopping_trends
GROUP BY Category;