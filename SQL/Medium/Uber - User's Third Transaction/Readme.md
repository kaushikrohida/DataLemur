This is the same question as problem #11 in the SQL Chapter of Ace the Data Science Interview!

Assume you are given the table below on Uber transactions made by users. Write a query to obtain the third transaction of every user. Output the user id, spend and transaction date.

transactions Table:
Column Name	Type
user_id	integer
spend	decimal
transaction_date	timestamp
transactions Example Input:
user_id	spend	transaction_date
111	100.50	01/08/2022 12:00:00
111	55.00	01/10/2022 12:00:00
121	36.00	01/18/2022 12:00:00
145	24.99	01/26/2022 12:00:00
111	89.60	02/05/2022 12:00:00
Example Output:
user_id	spend	transaction_date
111	89.60	02/05/2022 12:00:00
The dataset you are querying against may have different input & output - this is just an example!

p.s. for more Uber SQL interview tips & problems, check out the Uber SQL Interview Guide

```sql
SELECT
  user_id,
  spend,
  transaction_date
FROM (
SELECT
  user_id,
  spend,
  transaction_date,
  row_number() over (partition by user_id order by transaction_date) as rn
FROM transactions
) a
where rn = 3
```