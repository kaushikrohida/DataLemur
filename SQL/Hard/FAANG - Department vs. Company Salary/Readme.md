You work as a data analyst for a FAANG company that tracks employee salaries over time. The company wants to understand how the average salary in each department compares to the company's overall average salary each month.

Write a query to compare the average salary of employees in each department to the company's average salary for March 2024. Return the comparison result as 'higher', 'lower', or 'same' for each department. Display the department ID, payment month (in MM-YYYY format), and the comparison result.

employee Schema:
column_name	type	description
employee_id	integer	The unique ID of the employee.
name	string	The full name of the employee.
salary	integer	The salary of the employee.
department_id	integer	The department ID of the employee.
manager_id	integer	The manager ID of the employee.
employee Example Input:
employee_id	name	salary	department_id	manager_id
1	Emma Thompson	3800	1	6
2	Daniel Rodriguez	2230	1	7
3	Olivia Smith	7000	1	8
5	Sophia Martinez	1750	1	11
salary Schema:
column_name	type	description
salary_id	integer	A unique ID for each salary record.
employee_id	integer	The unique ID of the employee.
amount	integer	The salary of the employee.
payment_date	datetime	The date and time when the salary was paid to the employee.
salary Example Input:
salary_id	employee_id	amount	payment_date
1	1	3800	01/31/2024 00:00:00
2	2	2230	01/31/2024 00:00:00
3	3	7000	01/31/2024 00:00:00
4	4	6800	01/31/2024 00:00:00
5	5	1750	01/31/2024 00:00:00
Example Output:
department_id	payment_date	comparison
1	01-2024	lower
The output indicates that the average salary of Department 1 is lower than the company's average salary for January 2024.

The dataset you are querying against may have different input & output - this is just an example!


```sql
with cte as (
SELECT
  e.department_id,
  to_char(s.payment_date::date, 'mm-yyyy') as payment_date,
  avg(s.amount) avg_salary_dep
FROM employee e
Join salary s
  on e.employee_id = s.employee_id
where 
  extract(year from s.payment_date) = 2024
  and extract(month from s.payment_date) = 3
group by 1, 2
),

cte2 as (
SELECT
  avg(amount) as total_avg_comp
FROM salary
)

SELECT
  c1.department_id,
  c1.payment_date,
  CASE
    when c1.avg_salary_dep > c2.total_avg_comp then 'higher'
    when c1.avg_salary_dep < c2.total_avg_comp then 'lower'
    when c1.avg_salary_dep = c2.total_avg_comp then 'same'
  end as comparison
FROM cte c1
cross join cte2 c2
```