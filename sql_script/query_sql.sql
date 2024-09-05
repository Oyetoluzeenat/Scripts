/* Find a list of order IDs where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table. */
SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;

/* Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000. */
SELECT id
FROM orders
WHERE standard_qty = 0
AND (gloss_qty > 1000 OR poster_qty > 1000);

/* Find all the company names that start with a 'C' or 'W', and where the primary contact contains 'ana' or 'Ana', but does not contain 'eana'. */
SELECT name
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%')
  AND (primary_poc ILIKE '%ana%' OR primary_poc ILIKE '%Ana%')
  AND primary_poc NOT ILIKE '%eana%';

/* Provide a table that shows the region for each sales rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) by account name. */
SELECT
    r.name AS region_name,
    sr.name AS sales_rep_name,
    a.name AS account_name
FROM
    Accounts a
JOIN
    Sales_Reps sr ON CAST(a.sales_rep_id AS INTEGER) = sr.id
JOIN
    Region r ON sr.region_id = r.id
ORDER BY
    a.name;

