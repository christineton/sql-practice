-- Assignment: Select Statement
SELECT * 
FROM students
WHERE age BETWEEN 18 AND 20

SELECT *
FROM students
WHERE student_name ilike '%ch%' OR
	student_name ilike '%nd'
	
SELECT student_name 
	,age
FROM students
WHERE student_name ilike '%ae%'
OR student_name ilike '%ph%'
AND age != 19

SELECT student_name
	,age
FROM students
ORDER BY age DESC

SELECT student_name
	,age
FROM students
ORDER BY age DESC
LIMIT 4

SELECT *
FROM students 
WHERE age <= 20 
AND (student_no BETWEEN 3 AND 5 OR student_no = 7)
OR (age > 20 AND student_no >= 4)

-- Assignment: Using Functions
SELECT last_name || ' works in the ' || department || ' department'
FROM professors
WHERE last_name = 'Chong'

SELECT 'It is ' || (salary > 95000) || ' that professor ' || last_name || ' is highly paid.'
FROM professors

SELECT last_name
	,UPPER(substring(department,1,3)) AS department
	,salary
	,hire_date
FROM professors

SELECT MAX(salary)
	,MIN(salary)
FROM professors
WHERE last_name != 'Wilson'

SELECT hire_date
FROM professors
ORDER BY hire_date
Limit 1

-- Assignment: Practicing aggregation queries
SELECT state
	,supply
FROM fruit_imports
ORDER BY supply DESC 
LIMIT 1

SELECT season
	,MAX(cost_per_unit)
FROM fruit_imports
GROUP BY season

SELECT state
	,name
	,COUNT(name)
FROM fruit_imports
GROUP BY state
	,name
HAVING COUNT(name) > 1

SELECT season
	,COUNT(name)
FROM fruit_imports
GROUP BY season
HAVING COUNT(name) BETWEEN 3 and 4

SELECT state
	,SUM(supply * cost_per_unit) AS total_cost
FROM fruit_imports
GROUP BY state
ORDER BY total_cost DESC
LIMIT 1

-- Assignment: Practice with Subqueries
SELECT * 
FROM students

SELECT *
FROM student_enrollment

SELECT *
FROM courses
	
SELECT student_NAME
FROM students
WHERE student_no IN(
	SELECT student_no
	FROM student_enrollment
	WHERE course_no IN(
		SELECT course_no
		FROM courses
		WHERE course_title IN ('Physics','US History')))

SELECT student_name
FROM students
WHERE student_no IN
				(SELECT student_no 
				FROM 
					(SELECT student_no
						,COUNT(course_no) AS course_count
					FROM student_enrollment
					GROUP BY student_no
					ORDER BY course_count DESC
					LIMIT 1) a)

	
SELECT student_name 
FROM students
WHERE age IN(
			SELECT MAX(age)
			FROM students)

-- Assignment: Practice using Case & Transposing Data
SELECT name
	,SUM(supply) AS total_supply
	,CASE WHEN SUM(supply) < 20000 THEN 'LOW'
			WHEN SUM(supply) BETWEEN 20000 AND 50000 THEN 'ENOUGH'
			WHEN SUM(supply) > 50000 THEN 'FULL'
			END AS category
FROM fruit_imports
GROUP BY name

SELECT *
FROM fruit_imports

SELECT SUM(CASE WHEN season = 'Winter' THEN total_cost END) AS Winter_Total
	,SUM(CASE WHEN season = 'Summer' THEN total_cost END) AS Summer_Total
	,SUM(CASE WHEN season = 'All Year' THEN total_cost END) AS All_Year_Total
	,SUM(CASE WHEN season = 'Spring' THEN total_cost END) AS Spring_Total
	,SUM(CASE WHEN season = 'Fall' THEN total_cost END) AS Fall_Total
FROM (SELECT season
	,SUM(supply * cost_per_unit) AS total_cost
FROM fruit_imports
GROUP BY season) a

-- Correlated Subqueries
SELECT first_name
	,salary
	,department
FROM employees e1
WHERE salary > (SELECT ROUND(AVG(salary)) 
				FROM employees e2
			   WHERE e1.department = e2.department)
			   
SELECT first_name
	,salary
	,department
FROM employees e1
WHERE salary > (SELECT ROUND(AVG(salary)) 
				FROM employees e2
			   WHERE e1.region_id = e2.region_id)   
			   
SELECT first_name
	,salary
	,department
	,(SELECT ROUND(AVG(salary)) 
				FROM employees e2
			   WHERE e1.department = e2.department) AS avg_department_salary
FROM employees e1

-- Name of departments where there are less than 38 employees working
SELECT department
	,COUNT(employee_id)
FROM employees e2
GROUP BY department
HAVING COUNT(employee_id) < 38

SELECT department
FROM departments
WHERE 38 < (SELECT COUNT(*)
		   FROM employees e
		   WHERE e.department = departments.department)
			   
			   
SELECT department
FROM employees e1
WHERE 38 < (SELECT COUNT(employee_id)
		   FROM employees e2
		   WHERE e1.department = e2.department)
GROUP BY department
			   
-- ADD IN HIGHEST PAID EMPLOYEES SALARY FOR EACH DEPARTMENT
SELECT department
	,MAX(salary) AS max_salary
FROM employees e1
WHERE 38 < (SELECT COUNT(employee_id)
		   	FROM employees e2
		   	WHERE e1.department = e2.department)
GROUP BY department
			   
-- Assignment Coorelated Subqueries
SELECT department
	,first_name
	,salary
	,CASE WHEN salary = max_by_department THEN 'HIGHEST SALARY'
		WHEN salary = min_by_department THEN 'LOWEST SALARY'
		END AS salary_in_department
FROM (
	SELECT department
		,first_name
		,salary
		,(SELECT MAX(salary) 
		  FROM employees e2 
		  WHERE e1.department = e2.department) AS max_by_department
		,(SELECT MIN(salary) 
		  FROM employees e2 
		  WHERE e1.department = e2.department) AS min_by_department
	FROM employees e1
	ORDER BY department) a
WHERE salary in (max_by_department, min_by_department)

-- Introducing Table Joins
SELECT *
FROM employees

SELECT *
FROM regions

SELECT e.first_name
	,r.country
FROM employees e
JOIN regions r
	ON e.region_id = r.region_id

-- first name, email, and division
SELECT *
FROM departments

SELECT * 
FROM employees

SELECT e.first_name
	,e.last_name
	,d.division
FROM employees e
JOIN departments d
	ON e.department = d.department
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	




