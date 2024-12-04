/*Count how many purchases were made with a discount:*/
SELECT count(*), Category as count_discount FROM shopping_trends
WHERE Discount_Applied like 'Yes'
GROUP BY Category;


/*Calculate the percentage of purchases with a promo code:*/
SELECT 
    (COUNT(CASE WHEN Promo_Code_Used = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS Promo_Use_Percentage
FROM shopping_trends;
