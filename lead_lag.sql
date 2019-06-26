-- LEAD and LAG Functions
SELECT first_name
	,last_name
	,salary
	,LEAD(salary) OVER() next_salary
FROM employees

SELECT department
	,last_name
	,salary
	,LAG(salary) OVER(ORDER BY salary DESC) next_higher_salary
FROM employees

SELECT department
	,last_name
	,salary
	,LAG(salary) OVER(ORDER BY salary DESC) closest_higher_salary
FROM employees

SELECT department
	,last_name
	,salary
	,LEAD(salary) OVER(PARTITION BY department ORDER BY salary DESC) closest_higher_salary
FROM employees




