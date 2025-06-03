README

Queries Summary

This document tend to summarize several SQL queries that has been designed to extract key insights and data from the availed database. Each query serves a specific purpose, from tracking customer contacts to account details and order information.

1. Information regarding contacted Individuals in 2016 via Organic or Adwords Channels

Purpose:	To retrieve all records of individuals contacted through 'organic' or 'adwords' channels who started their accounts in 2016, sorted from newest to oldest.

Query:

SELECT * 
FROM web_events
WHERE channel IN ('organic', 'adwords') 
  AND EXTRACT(YEAR FROM occurred_at) = 2016
ORDER BY occurred_at DESC;


2. Companies whose names are Not Starting with 'C' and are Ending with 's'

Purpose:	To find all companies whose names do not begin with 'C' and end with 's'.

Query:

SELECT name
FROM accounts
WHERE NOT name LIKE 'C%' AND name LIKE '%s';


3. List of Orders with Zero Standard Quantity and High Gloss or Poster Quantity

Purpose:	List orders where standard_qty is zero and either gloss_qty or poster_qty exceeds 1000.

Query:

SELECT * FROM orders
WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);


4. To retrieve all the Accounts with Primary point of contacts Starting with ‘T’ or ‘E’ and ordered alphabetically

Purpose:	Retrieve accounts where the primary point of contact (POC) starts with 'T' or 'E', sorted alphabetically.

Query:

SELECT * FROM accounts
WHERE primary_poc LIKE 'T%' OR primary_poc LIKE 'E%'
ORDER BY primary_poc;


5. To retrieve the total number of Unique Sales Reps and Unique Accounts

Purpose:	Calculate the total number of unique sales representatives and accounts, combined into a single view.

Query:

SELECT
    COUNT(DISTINCT sales_rep_id) AS total_unique_sales_reps,
    COUNT(DISTINCT id) AS total_unique_accounts
FROM accounts;


6. To fetch the Website and primary point of contact (POC) for some Selected Accounts

Purpose:	Fetch the website and primary_poc for Walmart, Target, and Nordstrom.

Query:

SELECT website, primary_poc
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');


This collection of queries is designed to support various analytical needs, including customer behavior, account management, and order analysis.
