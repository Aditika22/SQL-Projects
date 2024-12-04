/*find customers from the same location who purchased items in the same category:*/
SELECT S1.Customer_ID AS Customer_1, S2.Customer_ID AS Customer_2,S1.location,S1.Category
FROM shopping_trends S1
JOIN shopping_trends S2
ON S1.Location = S2.Location
    AND S1.Category = S2.Category
    AND S1.Customer_ID <> S2.Customer_ID
LIMIT 10;