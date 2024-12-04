/*Find the top 3 best-selling items:*/
SELECT * FROM shopping_trends
ORDER BY Purchase_Amount DESC
LIMIT 3;

/*Count items in each category:*/
SELECT COUNT(*) AS Item_Count, Category, Item_Purchased
FROM shopping_trends
GROUP BY Category,Item_Purchased;