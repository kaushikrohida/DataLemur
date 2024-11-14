# Amazon Average Review Ratings Analysis

## Project Overview
This SQL project analyzes product review ratings from Amazon's review database. The goal is to calculate the average star rating for each product on a monthly basis, providing insights into product performance over time.

## Problem Statement
Given a table of product reviews containing review dates, product IDs, and star ratings, write a SQL query to:
- Calculate the average star rating for each product by month
- Display results with month as a numerical value
- Round average ratings to two decimal places
- Sort results by month and product ID

## Database Schema

### Reviews Table
| Column Name  | Type      | Description |
|-------------|-----------|-------------|
| review_id   | integer   | Unique identifier for each review |
| user_id     | integer   | Identifier for the user who submitted the review |
| submit_date | datetime  | Date when the review was submitted |
| product_id  | integer   | Identifier for the product being reviewed |
| stars       | integer   | Rating given (1-5 stars) |

## Solution

```sql
SELECT
  extract(month from submit_date) as mth,
  product_id as product,
  round(avg(stars), 2) as avg_stars
FROM reviews
group by 1, 2
order by 1, 2
```

### Solution Explanation
1. `extract(month from submit_date)`: Extracts the month number from the submission date
2. `round(avg(stars), 2)`: Calculates the average star rating and rounds to 2 decimal places
3. `group by 1, 2`: Groups results by month and product_id
4. `order by 1, 2`: Sorts results first by month, then by product_id

## Sample Data

### Example Input
| review_id | user_id | submit_date          | product_id | stars |
|-----------|---------|---------------------|------------|-------|
| 6171      | 123     | 06/08/2022 00:00:00 | 50001      | 4     |
| 7802      | 265     | 06/10/2022 00:00:00 | 69852      | 4     |
| 5293      | 362     | 06/18/2022 00:00:00 | 50001      | 3     |
| 6352      | 192     | 07/26/2022 00:00:00 | 69852      | 3     |
| 4517      | 981     | 07/05/2022 00:00:00 | 69852      | 2     |

### Example Output
| mth | product | avg_stars |
|-----|---------|-----------|
| 6   | 50001   | 3.50      |
| 6   | 69852   | 4.00      |
| 7   | 69852   | 2.50      |

## Key Learning Points
- Using `extract()` function to get specific parts of a datetime value
- Implementing `round()` for precise decimal formatting
- Grouping and sorting data using multiple columns
- Calculating averages with `avg()` function

## Skills Demonstrated
- Data aggregation
- Date manipulation
- Result formatting
- Data grouping and sorting
- SQL query optimization

## Source
This problem is inspired by real SQL interview questions from Amazon and is part of the DataLemur SQL practice problems collection.
