/*Find the average purchase amount by category and then identify the categories where the average purchase amount exceeds $50:*/
WITH Average AS(
    SELECT AVG(Purchase_Amount) as avg_amount, category
    FROM shopping_trends
    GROUP by Category
)
SELECT category,avg_amount
FROM Average
WHERE avg_amount>50;