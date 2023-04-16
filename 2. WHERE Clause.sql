-- 1. Filtering SELECT Statement Results

-- The WHERE clause goes after the FROM statement and before any GROUP BY, ORDER BY, or LIMIT statements in the SELECT query

-- get product_id, product_name, and product category id, where category id = 1
SELECT product_id,product_name,product_category_id
FROM product
WHERE product_category_id = 1
LIMIT 5;

-- 2. Filtering on Multiple Conditions

-- OR condition
SELECT market_date,customer_id,product_id,quantity,
 quantity * cost_to_customer_per_qty AS price
FROM customer_purchases
WHERE customer_id = 3
 OR customer_id = 4
ORDER BY market_date, customer_id, vendor_id, product_id;

-- AND condition
SELECT market_date,customer_id,vendor_id,product_id,quantity,
quantity * cost_to_customer_per_qty AS price
FROM customer_purchases
WHERE customer_id > 3 AND customer_id <=5
ORDER BY market_date,customer_id,vendor_id,product_id;

-- AND, OR. NOT conditions

-- Type 1
SELECT product_id,product_name
FROM product
WHERE product_id = 10
		OR (product_id > 3 AND product_id < 8);
        
-- Type 2
SELECT product_id,product_name
FROM product
WHERE (product_id = 10
		OR product_id > 3) AND product_id < 8;
        
-- 3. Multi-Column Conditional Filtering
SELECT market_date, customer_id, vendor_id,
		quantity * cost_to_customer_per_qty AS price
FROM customer_purchases
WHERE customer_id = 4
		AND vendor_id = 7;

-- 4 . BETWEEN
SELECT *
FROM vendor_booth_assignments
WHERE vendor_id = 7
		AND market_date BETWEEN '2019-04-02' AND '2019-04-16'
ORDER BY market_date;

-- 5. IN 
SELECT customer_id, customer_first_name, customer_last_name
FROM customer
WHERE customer_last_name IN ('Diaz', 'Edwards', 'Wilson')
ORDER BY customer_last_name, customer_first_name;

-- 6. LIKE
SELECT
 customer_id,
 customer_first_name,
 customer_last_name
FROM farmers_market.customer
WHERE
 customer_first_name LIKE 'Jer%';
 
 -- 7. IS NULL
SELECT *
FROM farmers_market.product
WHERE product_size IS NULL;

-- 8. Filtering using Subqueries
SELECT market_date, customer_id, vendor_id,
 quantity * cost_to_customer_per_qty price
FROM farmers_market.customer_purchases
WHERE
 market_date IN
		 (
		 SELECT market_date
		 FROM farmers_market.market_date_info
		 WHERE market_rain_flag = 1
		 )
LIMIT 5;

-- Exercise

/* Write a query that returns all customer purchases of product IDs 4 and 9 */

SELECT *
FROM customer_purchases
WHERE product_id IN (4,9);

/*Write two queries, one using two conditions
with an AND operator, and one using the BETWEEN operator, that will return
all customer purchases made from vendors with vendor IDs between 8 and 10 (inclusive)*/

SELECT *
FROM customer_purchases
WHERE vendor_id >= 8 AND vendor_id <= 10;

SELECT *
FROM customer_purchases
WHERE vendor_id BETWEEN 8 AND 10;
