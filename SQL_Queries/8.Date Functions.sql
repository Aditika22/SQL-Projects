/*Retrieve items purchased in the last 30 days:*/
SELECT * FROM shopping_trends
WHERE Frequency_of_Purchases>= CURDATE() - INTERVAL 30 DAY;


