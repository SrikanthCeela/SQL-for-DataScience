-- JOINS

/* LEFT JOIN - All rows from the "left table"
, and only rows from the "right table" with matching values in the specified fields*/

SELECT *
FROM product p
LEFT JOIN product_category pc ON p.product_category_id=pc.product_category_id;


SELECT
 p.product_id,
 p.product_name,
 pc.product_category_id,
 pc.product_category_name
FROM product AS p
 LEFT JOIN product_category AS pc
 ON p.product_category_id = pc.product_category_id
ORDER BY pc.product_category_name, p.product_name;

/* RIGHT JOIN - All rows from the "right table",
and only rows from the "left table" with matching values in the speicified list*/

SELECT
 p.product_id,
 p.product_name,
 pc.product_category_id,
 pc.product_category_name
FROM product AS p
 RIGHT JOIN product_category AS pc
 ON p.product_category_id = pc.product_category_id
ORDER BY pc.product_category_name, p.product_name;


/* INNER JOIN - Only rows from the "right table" and "left table" where
values in the specified fields have matches in both tables */

SELECT *
FROM customer AS c
INNER JOIN customer_purchases AS cp
 ON c.customer_id = cp.customer_id
WHERE cp.customer_id > 0;

-- JOINS with more than 2 tables
SELECT
 b.booth_number,
 b.booth_type,
vba.market_date,
 v.vendor_id,
 v.vendor_name,
 v.vendor_type
FROM booth AS b
 LEFT JOIN vendor_booth_assignments AS vba ON b.booth_number = vba.booth_number
 LEFT JOIN vendor AS v ON v.vendor_id = vba.vendor_id
ORDER BY b.booth_number, vba.market_date;

-- Exercise
/*1. . Write a query that INNER JOINs the vendor table to the vendor_booth_
assignments table on the vendor_id field they both have in common, and
sorts the result by vendor_name, then market_date.*/

SELECT *
FROM vendor v
INNER JOIN vendor_booth_assignments vba ON v.vendor_id=vba.vendor_id
ORDER BY vendor_name,market_date;