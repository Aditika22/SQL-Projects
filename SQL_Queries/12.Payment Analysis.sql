/*Find the most used payment method:*/
SELECT  Payment_Method, COUNT(*) AS Usage_Count
FROM shopping_trends
GROUP BY Payment_Method
ORDER BY Usage_Count DESC;

/*Count purchases by preferred payment method:*/
SELECT  Preferred_Payment_Method, COUNT(*) AS Usage_Count
FROM shopping_trends
GROUP BY Preferred_Payment_Method;