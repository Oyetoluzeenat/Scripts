SQL Query Document

This document provides a detailed explanation of a set of SQL queries used to retrieve specific information from a database. The queries address various data retrieval needs based on different conditions and requirements.

    Query to Find Order IDs Based on Quantity

Objective: Retrieve a list of order IDs where either the gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table.

SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;

Explanation:

    Table: orders
    Columns: id, gloss_qty, poster_qty
    Condition: The query filters rows where either gloss_qty or poster_qty exceeds 4000.
    Output: Only the id column is returned for rows meeting the condition.

Purpose: This query is useful for identifying orders with significant quantities in either gloss or poster categories, potentially for inventory management or special handling.

    Query to Find Orders with Specific Quantities

Objective: Return a list of orders where standard_qty is zero and either gloss_qty or poster_qty is over 1000.

SELECT id
FROM orders
WHERE standard_qty = 0
AND (gloss_qty > 1000 OR poster_qty > 1000);

Explanation:

    Table: orders
    Columns: id, standard_qty, gloss_qty, poster_qty
    Condition: The query filters rows where standard_qty is zero and either gloss_qty or poster_qty exceeds 1000.
    Output: Only the id column is returned for rows meeting the condition.

Purpose: This query helps to identify orders that have no standard quantity but have significant quantities in either gloss or poster categories. This could be used for analyzing special cases or exceptions in order processing.

    Query to Find Company Names and Contact Information

Objective: Find all company names that start with a 'C' or 'W', where the primary contact contains 'ana' or 'Ana', but does not contain 'eana'.

SELECT name
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%')
  AND (primary_poc ILIKE '%ana%' OR primary_poc ILIKE '%Ana%')
  AND primary_poc NOT ILIKE '%eana%';

Explanation:

    Table: accounts
    Columns: name, primary_poc
    Conditions:
        name starts with 'C' or 'W'.
        primary_poc contains 'ana' or 'Ana' (case-insensitive).
        primary_poc does not contain 'eana' (case-insensitive). -Output: The name column of the accounts table for rows meeting all conditions.

Purpose: This query is designed to filter company names based on specific patterns in their primary contact information, useful for targeted marketing or customer outreach.

    Query to List Regions, Sales Reps, and Accounts

Objective: Provide a table that shows the region for each sales rep along with their associated accounts. The final table includes three columns: the region name, the sales rep name, and the account name. The accounts are sorted alphabetically (A-Z) by account name.

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

Explanation:

    Tables:
        Accounts (aliased as a)
        Sales_Reps (aliased as sr)
        Region (aliased as r)
    Columns: r.name (region name), sr.name (sales rep name), a.name (account name)
    Joins:
        Join Accounts with Sales_Reps on a.sales_rep_id and sr.id.
        Join Sales_Reps with Region on sr.region_id and r.id.
    Ordering: Results are sorted by a.name (account name) in ascending order.

Purpose: This query generates a comprehensive view of accounts along with their sales reps and associated regions, sorted by account name. It helps in analyzing sales rep performance and region distribution.
