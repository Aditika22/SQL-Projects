/*Find the highest-rated product in each category using a subquery:*/
SELECT Item_Purchased, Category, Review_Rating
FROM shopping_trends
WHERE  Review_Rating = (
SELECT MAX(Review_Rating)
FROM shopping_trends T
WHERE T.Category = shopping_trends.Category)
ORDER BY Category;
