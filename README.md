# Shopping Trends SQL Case Study

### 📋 Introduction
This project involves analyzing shopping trends using SQL queries. The dataset consists of various attributes about customer purchases, including categories, purchase amounts, reviews, and payment details. The purpose of this case study is to demonstrate SQL operations, including basic retrieval, aggregations, filtering, self-joins, subqueries, drop command and Common Table Expressions (CTEs).

### 📂 Dataset Details
The dataset is taken from Kaggle: 
[shopping_trends.csv](https://www.kaggle.com/code/fathyfathysahlool/customer-shopping-trends) includes the following columns:

- Customer_ID: Unique identifier for each customer.

- Age: Customer's age.

- Gender: Gender of the customer.

- Item_Purchased: Name of the purchased item.

- Category: Category to which the item belongs.

- Purchase_Amount: Amount spent on the purchase.

- Location: Customer's location.

- Size: Size of the purchased item.

- Color: Color of the purchased item.

- Season: Season in which the purchase occurred.

- Review_Rating: Rating given by the customer (1 to 5).

- Subscription_Status: Whether the customer has an active subscription.

- Payment_Method: Payment method used.

- Shipping_Type: Type of shipping selected.

- Discount_Applied: Whether a discount was applied (Yes/No).

- Promo_Code_Used: Whether a promo code was used (Yes/No).

- Previous_Purchases: Total number of prior purchases by the customer.

- Preferred_Payment_Method: The customer’s preferred payment method.

- Frequency_of_Purchases: Frequency of customer purchases (e.g., Weekly, Annually).

# Tools I Used

For my deep dive into the data analyst job market, I harnessed the power of several key tools:

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.

- **Visual Studio Code:** My go-to for database management and executing SQL queries.

- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# 🎯 Case Study Objectives
- Analyze customer purchase behavior across categories.
Identify high-performing categories and top-selling items.
- Understand the impact of discounts and promo codes on sales.
- Calculate customer lifetime value based on previous purchases.
- Use advanced SQL features like self-joins, subqueries, and CTEs.

# 🛠️ SQL Queries
Below are the key operations performed in this case study:
- Retrieve all data:
```
SELECT * FROM shopping_trends;
```
- Select specific columns:
```
SELECT Customer_ID,Item_Purchased, Category 
FROM shopping_trends;
```
- Find items with total sales greater than $50:
```
SELECT * FROM shopping_trends WHERE Purchase_Amount>50;
```
- Retrieve data for the 'Accessories' category:
```
SELECT * FROM shopping_trends WHERE Category Like 'Accessories';
```
- Sort items by total sales in descending order:
```
SELECT * FROM shopping_trends ORDER BY Purchase_Amount DESC;
```
- Total sales for each category:
```
SELECT Category, SUM(Purchase_Amount) AS Total_sales
FROM shopping_trends
GROUP BY Category;
```

- Average previous purchases:
```
SELECT Category, round(AVG(Previous_Purchases),2)AS Avg_Purchases
FROM shopping_trends
GROUP BY Category;
```
- update gender as female where category is accessories:
```
UPDATE shopping_trends
SET Gender ='Female'
WHERE Category='Accessories';
```
- delete review ratings that are less than 2:
```
DELETE FROM shopping_trends
WHERE Review_Rating<2;
```
- Find the top 3 best-selling items:
```
SELECT * FROM shopping_trends
ORDER BY Purchase_Amount DESC
LIMIT 3;
```
- Count items in each category:
```
SELECT COUNT(*) AS Item_Count, Category, Item_Purchased
FROM shopping_trends
GROUP BY Category,Item_Purchased;
```
- Retrieve items purchased in the last 30 days:
```
SELECT * FROM shopping_trends
WHERE Frequency_of_Purchases>= CURDATE() - INTERVAL 30 DAY;
```
- Add a new column for item ratings:
```
ALTER TABLE shopping_trends
Add column Item_Ratings decimal(3,2);
```
- change discount applied as no where payment is made via credit card:
```
UPDATE shopping_trends
SET Discount_Applied  = 'No'
WHERE Payment_Method = 'Credit Card';
```
- Find total sales and the highest-reviewed item in each category:
```
SELECT Category, SUM(Purchase_Amount) AS Total_sales, ROUND(MAX(Review_Rating),2)AS highest_rating
FROM shopping_trends
GROUP BY Category;
```
- Count how many purchases were made with a discount:
```
SELECT count(*), Category as count_discount FROM shopping_trends
WHERE Discount_Applied like 'Yes'
GROUP BY Category;
```
- Calculate the percentage of purchases with a promo code:
```
SELECT 
(COUNT(CASE WHEN Promo_Code_Used = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS Promo_Use_Percentage
FROM shopping_trends;
```
- Find the most used payment method:
```
SELECT  Payment_Method, COUNT(*) AS Usage_Count
FROM shopping_trends
GROUP BY Payment_Method
ORDER BY Usage_Count DESC;
```
- Count purchases by preferred payment method:
```
SELECT  Preferred_Payment_Method, COUNT(*) AS Usage_Count
FROM shopping_trends
GROUP BY Preferred_Payment_Method;
```
- Find the top 5 customers with the highest number of previous purchases:
```
SELECT Customer_ID, Previous_Purchases
FROM shopping_trends
ORDER BY Previous_Purchases desc
limit 5;
```
- Calculate the average purchase amount by customer age group:
```
SELECT 
CASE 
        WHEN Age < 20 THEN 'Under 20'
        WHEN Age BETWEEN 20 AND 40 THEN '20-40'
        WHEN Age BETWEEN 41 AND 60 THEN '41-60'
        ELSE 'Above 60'
        END AS Age_Group,
ROUND(AVG(Purchase_Amount),2) AS avg_amount
FROM shopping_trends
GROUP BY Age_Group;
```
- Delete records where the purchase amount is zero:
```
DELETE FROM shopping_trends
where Purchase_Amount ='0';
```
- Update subscription status for customers with less than 30 purchase amount:
```
UPDATE shopping_trends
SET Subscription_Status ='NO'
WHERE Purchase_Amount <30;
```
- find customers from the same location who purchased items in the same category:
```
SELECT S1.Customer_ID AS Customer_1, S2.Customer_ID AS Customer_2,S1.location,S1.Category
FROM shopping_trends S1
JOIN shopping_trends S2
ON S1.Location = S2.Location
    AND S1.Category = S2.Category
    AND S1.Customer_ID <> S2.Customer_ID
LIMIT 10;
```
- Find the highest-rated product in each category using a subquery:
```
SELECT Item_Purchased, Category, Review_Rating
FROM shopping_trends
WHERE  Review_Rating = (
SELECT MAX(Review_Rating)
FROM shopping_trends T
WHERE T.Category = shopping_trends.Category)
ORDER BY Category;
```
- Find the average purchase amount by category and then identify the categories where the average purchase amount exceeds $50:
```
WITH Average AS(
    SELECT AVG(Purchase_Amount) as avg_amount, category
    FROM shopping_trends
    GROUP by Category
)
SELECT category,avg_amount
FROM Average
WHERE avg_amount>50
```
- Drop table:
```
DROP TABLE shopping_trends;
```

# 🎉 Closing Thoughts
This case study showcases how SQL can be effectively used to analyze complex datasets and extract meaningful insights. By exploring real-world problems like customer purchase behavior and sales performance, this project highlights the versatility of SQL for business intelligence and analytics.

