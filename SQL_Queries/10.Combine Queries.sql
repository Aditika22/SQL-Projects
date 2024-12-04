/*Find total sales and the highest-reviewed item in each category:*/
SELECT Category, SUM(Purchase_Amount) AS Total_sales, ROUND(MAX(Review_Rating),2)AS highest_rating
FROM shopping_trends
GROUP BY Category;