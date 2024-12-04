/*Add a new column for item ratings:*/
ALTER TABLE shopping_trends
Add column Item_Ratings decimal(3,2);

/*change discount applied as no where payment is made via credit card:*/
UPDATE shopping_trends
SET Discount_Applied  = 'No'
WHERE Payment_Method = 'Credit Card';


