/*Find the top 5 customers with the highest number of previous purchases:*/
SELECT Customer_ID, Previous_Purchases
FROM shopping_trends
ORDER BY Previous_Purchases desc
limit 5;

/*Calculate the average purchase amount by customer age group:*/
SELECT 
CASE 
        WHEN Age < 20 THEN 'Under 20'
        WHEN Age BETWEEN 20 AND 40 THEN '20-40'
        WHEN Age BETWEEN 41 AND 60 THEN '41-60'
        ELSE 'Above 60'
        END AS Age_Group,
ROUND(AVG(Purchase_Amount),2) AS avg_amount
FROM shopping_trends
GROUP BY Age_Group;