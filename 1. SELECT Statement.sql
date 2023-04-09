-- SELECT Columns and Limiting the Number of Rows Returned

-- Select everything from the product table
SELECT * 
FROM product;

-- Get the first 5 rows of the product table
SELECT * 
FROM product 
LIMIT 5;

-- ORDER BY Clause: Sorting Results

-- order by product name ascending
SELECT product_id, product_name
FROM product
ORDER BY product_name
LIMIT 5;

-- order by product id descending
SELECT product_id, product_name
FROM product
ORDER BY product_id DESC
LIMIT 5;

-- Simple Inline Calculations
SELECT *
FROM customer_purchases;

/* In the customer_purchases table, we have a quantity column and
a cost_to_customer_per_qty column, so we can multiply those to get a price column which is an alias of the multiplication*/

SELECT *,quantity * cost_to_customer_per_qty AS price
FROM customer_purchases
limit 10;

-- more Inline Calculation examples: Rounding
SELECT
 market_date,
 customer_id,
 vendor_id,
 ROUND(quantity * cost_to_customer_per_qty, 2) AS price
FROM customer_purchases
LIMIT 10;

-- more Inline Calculation examples: Concatenating Strings
SELECT
 customer_id,
 CONCAT(customer_first_name, " ", customer_last_name) AS customer_name
FROM customer
LIMIT 5;

/*It’s also possible to nest functions inside other functions, which are executed
by the SQL interpreter from the “inside” to the “outside.” UPPER() is a function
that capitalizes string values. We can enclose the CONCAT() function inside it
to uppercase the full name. Let’s also change the order of the concatenation
parameters to put the last name first, and add a comma after the last name (note
the comma before the space inside the double quotes)*/
SELECT
 customer_id,
 UPPER(CONCAT(customer_last_name, ", ", customer_first_name)) AS customer_name
FROM customer
ORDER BY customer_last_name, customer_first_name
LIMIT 5;


-- more Inline Calculation examples: Round function
SELECT
 market_date,
 customer_id,
 vendor_id,
 ROUND(quantity * cost_to_customer_per_qty, 2) AS price
FROM customer_purchases;

-- Exercise
-- 1. Write a query that returns everything in the customer table.
SELECT *
FROM customer;

/* 2. Write a query that displays all of the columns and 10 rows from the customer table, 
sorted by customer_last_name, then customer_first_name.*/

SELECT *
FROM customer
ORDER BY customer_last_name, customer_first_name
LIMIT 10;

/* Write a query that lists all customer IDs and first names in the customer
table, sorted by first_name.*/
SELECT customer_id, customer_first_name
FROM customer
ORDER BY customer_first_name;


