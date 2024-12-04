/*Delete records where the purchase amount is zero:*/
DELETE FROM shopping_trends
where Purchase_Amount ='0';

/*Update subscription status for customers with less than 30 purchase amount:*/
UPDATE shopping_trends
SET Subscription_Status ='NO'
WHERE Purchase_Amount <30;