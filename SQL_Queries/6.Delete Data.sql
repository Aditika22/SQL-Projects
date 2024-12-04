/*delete review ratings that are less than 2:*/
DELETE FROM shopping_trends
WHERE Review_Rating<2;