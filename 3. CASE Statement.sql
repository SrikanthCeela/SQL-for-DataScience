-- CASE Statement

/*The vendors we want to label as “Fresh Produce” have the word “Fresh”
in the vendor_type column. We can use a CASE statement and the LIKE operator to create a new column, which we’ll alias
vendor_type_condensed, that condenses the vendor types to just “Fresh Produce” or “Other”*/

SELECT vendor_id, vendor_name, vendor_type
		,CASE
			WHEN LOWER(vendor_type) LIKE '%fresh%'
				THEN 'Fresh Produce'
			ELSE 'Others'
		END AS vendor_type_condensed
FROM vendor;

-- Creating Binary Flags using CASE

/* generate a binary flag field that indicates
whether it’s a weekday or weekend market*/

SELECT market_date,market_day,
		CASE
			WHEN market_day IN ('Saturday','Sunday')
				THEN 1
			ELSE 0
		END AS weekend_flag
FROM market_date_info;

-- Grouping or Binning Continuous Values using CASE

/* to return all rows, and instead of
using that value as a filter, only indicate whether the cost was over $50 or not*/

SELECT
	 market_date,
	 customer_id,
	 vendor_id,
	 ROUND(quantity * cost_to_customer_per_qty, 2) AS price,
	 CASE
		WHEN quantity * cost_to_customer_per_qty > 50
			THEN 1
		ELSE 0
	END AS price_over_50
FROM customer_purchases;

-- Exercise
/*1. Products can be sold by the individual unit or by bulk measures like lbs.
or oz. Write a query that outputs the product_id and product_name columns from the product table, and add a column called prod_qty_type_
condensed that displays the word “unit” if the product_qty_type is “unit,”
and otherwise displays the word “bulk.”*/
SELECT product_id,product_name,product_qty_type,
		 CASE
			 WHEN product_qty_type = 'unit'
				THEN 'unit'
			ELSE 'bulk'
		END AS product_qty_type_condensed
FROM product;

/*2. We want to flag all of the different types of pepper products that are sold
at the market. Add a column to the previous query called pepper_flag
that outputs a 1 if the product_name contains the word “pepper” (regardless of capitalization), and otherwise outputs 0*/

SELECT product_id,product_name,product_qty_type,
		 CASE
			 WHEN product_qty_type = 'unit'
				THEN 'unit'
			ELSE 'bulk'
		END AS product_qty_type_condensed
        ,CASE
			WHEN product_name LIKE '%pepper%'
				THEN 1
			ELSE 0
		END AS pepper_flag
FROM product;
