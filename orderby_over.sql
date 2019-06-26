-- Using ORDER BY in the OVER Clause

SELECT first_name
	,hire_date
	,salary
	-- Order by clause structuring window by hire_date and range of data is between unboarded preceding and current row 
	-- (suming all rows preceding current row)
	,SUM(salary) OVER(ORDER BY hire_date RANGE BETWEEN UNBOUNDED PRECEDING
					 AND CURRENT ROW) AS running_total_of_salaries
FROM employees

-- Same as above
SELECT first_name
	,hire_date
	,salary
	,SUM(salary) OVER(ORDER BY hire_date) AS running_total_of_salaries
FROM employees


SELECT first_name
	,hire_date
	,department
	,salary
	,SUM(salary) OVER(PARTITION BY department ORDER BY hire_date RANGE BETWEEN UNBOUNDED PRECEDING
					 AND CURRENT ROW) AS running_total_of_salaries
FROM employees

-- Adjacent calculation
SELECT first_name
	,hire_date
	,department
	,salary
	,SUM(salary) OVER(ORDER BY hire_date ROWS BETWEEN 1 PRECEDING AND CURRENT ROW)
FROM employees

