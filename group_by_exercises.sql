USE employees;
# Create a new file named group_by_exercises.sql.
# In your script, use DISTINCT to find the unique titles in the titles table. Your results should look like:
SELECT DISTINCT title
from employees.titles;
#
# Senior Engineer
# Staff
# Engineer
# Senior Staff
# Assistant Engineer
# Technique Leader
# Manager
# Find your query for employees whose last names start and end with 'E'. Update the query to find just the unique last names that start and end with 'E' using GROUP BY. The results should be:

SELECT last_name
FROM employees
WHERE last_name LIKE 'E%e'
GROUP By last_name ASC;
#
# Eldridge
# Erbe
# Erde
# Erie
# Etalle

# Update your previous query to now find unique combinations of first and last name where the last name starts and ends with 'E'. You should get 846 rows.
SELECT DISTINCT CONCAT(first_name,last_name)
FROM employees
WHERE last_name LIKE 'E%e';

#     Find the unique last names with a 'q' but not 'qu'. Your results should be:
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE'%q%'
AND last_name NOT LIKE '%qu%';

#     Chleq
#     Lindqvist
#     Qiwen

#     Add a COUNT() to your results and use ORDER BY to make it easier to find employees whose unusual name is shared with others.
SELECT last_name, count(*)
FROM employees
WHERE last_name LIKE'%q%'
  AND last_name NOT LIKE '%qu%'
group by last_name;


# Update your query for 'Irena', 'Vidya', or 'Maya'. Use count(*) and GROUP BY to find the number of employees for each gender with those names. Your results should be:
SELECT gender,COUNT(*)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;
#
# 441 M
# 268 F
