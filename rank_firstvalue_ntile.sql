-- RANK, FIRST_VALUE AND NTILE Functions

-- Rank data based on criteria
SELECT first_name
	,email
	,department
	,salary
	,RANK() OVER(PARTITION BY department ORDER BY salary DESC)
FROM employees

-- Gather those in Rank 8
SELECT * FROM (
				SELECT first_name
					,email
					,department
					,salary
					,RANK() OVER(PARTITION BY department ORDER BY salary DESC)
				FROM employees) a
WHERE RANK = 8

-- Group buckets of rows into a partition. Rank group of rows. First highest 5 employees as Rank 1
SELECT first_name
	,email
	,department
	,salary
	,NTILE(5) OVER(PARTITION BY department ORDER BY salary DESC) AS salary_bracket
FROM employees

-- First Value. Takes column as argument, first salary of each department
SELECT first_name
	,email
	,department
	,salary
	,first_value(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS salary_bracket
FROM employees

SELECT first_name
	,email
	,department
	,salary
	,MAX(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS salary_bracket
FROM employees
EXCEPT
SELECT first_name
	,email
	,department
	,salary
	,first_value(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS salary_bracket
FROM employees

SELECT first_name
	,email
	,department
	,salary
	,first_value(salary) OVER(PARTITION BY department ORDER BY first_name ASC) AS salary_bracket
FROM employees

SELECT first_name
	,email
	,department
	,salary
	,nth_value(salary, 5) OVER(PARTITION BY department ORDER BY first_name ASC) AS nth_value
FROM employees
