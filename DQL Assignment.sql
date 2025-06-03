-- 1.	Find all information regarding individuals who were contacted via the organic or adwords channels, and started their account at any point in 2016, sorted from newest to oldest.

SELECT * 
FROM web_events
WHERE channel IN ('organic', 'adwords') 
  AND EXTRACT(YEAR FROM occurred_at) = 2016
ORDER BY occurred_at DESC;

-- 2.	Find all the companies whose names do not start with 'C' and end with 's'.

SELECT name
FROM accounts
WHERE NOT name LIKE 'C%' AND name LIKE '%s';

-- 3.	Fetch a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000.

SELECT * FROM orders
WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);

-- 4.	Retrieve all the accounts whose primary point of contact has a name that starts with ‘T’ or ‘E’. The result should be ordered alphabetically.

SELECT * FROM accounts
WHERE primary_poc LIKE 'T%' OR primary_poc LIKE 'E%'
ORDER BY primary_poc;

-- 5.	Retrieve the total number of unique sales reps and unique accounts.

SELECT COUNT(DISTINCT sales_rep_id) FROM accounts;

SELECT COUNT(DISTINCT id) FROM accounts;

-- combine the two queries to display the result in one view

SELECT
    COUNT(DISTINCT sales_rep_id) AS total_unique_sales_reps,
    COUNT(DISTINCT id) AS total_unique_accounts
FROM accounts;

-- 6. Fetch the website and primary point of contact for these accounts:  Walmart, Target, and Nordstrom.

SELECT website, primary_poc
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');