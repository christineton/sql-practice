-- JOINS

SELECT *
FROM employees, regions

SELECT * FROM regions

SELECT first_name
	,country
FROM employees, regions
WHERE employees.region_id = regions.region_id

-- Assignment first name, email, division employee is in

SELECT e.first_name
	,e.email
	,d.department
	,d.division
	,r.country
FROM employees e
LEFT JOIN departments d
ON e.department = d.department
LEFT JOIN regions r
ON e.region_id = r.region_id
WHERE email IS NOT NULL

-- country and total number of employees in that country
SELECT r.country
	,COUNT(e.employee_id) AS employee_count
FROM employees e
LEFT JOIN regions r
ON e.region_id = r.region_id
GROUP BY r.country

SELECT country
	,COUNT(employee_id)
FROM employees e, (SELECT * FROM regions) r
WHERE e.region_id = r.region_id
GROUP BY country

-- INNER AND OUTER JOINS
SELECT first_name
	,country
FROM employees e
INNER JOIN regions r
ON e.region_id = r.region_id

SELECT first_name
	,email
	,division
	,country
FROM employees e
INNER JOIN departments d
ON e.department = d.department
INNER JOIN regions r
ON e.region_id = r.region_id
WHERE email IS NOT NULL

SELECT distinct(department)
FROM employees
-- 27 departments

SELECT DISTINCT(department)
FROM departments
-- 24 departments

SELECT DISTINCT e.department
	,d.department
FROM employees e
INNER JOIN departments d
	ON e.department = d.department

SELECT DISTINCT e.department
	,d.department
FROM employees e
LEFT JOIN departments d
	ON e.department = d.department
-- 27 departments
	
SELECT DISTINCT e.department employees_department
	,d.department departments_department
FROM employees e
RIGHT JOIN departments d
	ON e.department = d.department
-- 24 departments

-- only departments in employees that do not exist in department table
SELECT DISTINCT(e.department) AS employees_department
	,d.department
FROM employees e
LEFT JOIN departments d
ON e.department = d.department
WHERE d.department IS NULL

SELECT DISTINCT(e.department) AS employees_department
	,d.department
FROM employees e
FULL OUTER JOIN departments d
ON e.department = d.department
-- 28 rows

SELECT department
	,COUNT(*)
FROM employees
GROUP BY department
UNION ALL
SELECT 'TOTAL'
	,COUNT(*)
FROM employees
	
-- CARTESIAN PRODUCT AND CROSS JOINS
SELECT COUNT(*) FROM (
SELECT *
FROM employees, departments) a

SELECT COUNT(*) FROM (
SELECT * 
FROM employees a, employees b) a

SELECT *
FROM employees a
CROSS JOIN departments b 

-- EXERCISE JOINS & SUBQUERIES
-- assignment first name, departmenre, hire_date, country: first hire and last hire

(SELECT first_name
	,department
	,hire_date
	,country
FROM employees e
INNER JOIN regions r
ON e.region_id = r.region_id
WHERE hire_date = (SELECT MIN(hire_date) FROM employees e2)
LIMIT 1)
UNION ALL
SELECT first_name
	,department
	,hire_date
	,country
FROM employees e
INNER JOIN regions r
ON e.region_id = r.region_id
WHERE hire_date = (SELECT MAX(hire_date) FROM employees e2)
ORDER BY hire_date

-- report that shows salary budget per every 90 day period
-- hiredate first employee to hiredate last employee

SELECT first_name
	,hire_date
	,hire_date - 90
FROM employees 
WHERE hire_date BETWEEN hire_date AND hire_date - 90

SELECT hire_date
	,salary
	,(SELECT SUM(salary) 
	 FROM employees e2
	 WHERE e2.hire_date BETWEEN e.hire_date - 90 AND e.hire_date) as spending_pattern
FROM employees e
ORDER BY hire_date

-- Creating Views vs. Inline Views
CREATE VIEW v_employee_information AS 
SELECT first_name
	,email
	,e.department
	,salary
	,division
	,region
	,country
FROM employees e, departments d, regions r
WHERE e.department = d.department
AND e.region_id = r.region_id

SELECT * FROM departments

SELECT * FROM regions


-- ASSIGNMENT: ADVANCED PROBLEMS USING JOINS, GROUPING AND SUBQUERIES

-- Write a query that shows the student's name, 
-- the courses the student is taking and
-- the professors that teach that course. 

SELECT s.student_name 
	,c.course_title
	,p.last_name
FROM students s
JOIN student_enrollment se
	ON s.student_no = se.student_no
JOIN courses c
	ON se.course_no = c.course_no
JOIN teach t
	ON t.course_no = c.course_no
JOIN professors p
	ON p.last_name = t.last_Name
GROUP BY s.student_name
	,c.course_title
	,p.last_name

SELECT a.student_name
	,a.course_title
	,MIN(a.last_name)
FROM(SELECT s.student_name 
		,c.course_title
		,p.last_name
	FROM students s
	JOIN student_enrollment se
		ON s.student_no = se.student_no
	JOIN courses c
		ON se.course_no = c.course_no
	JOIN teach t
		ON t.course_no = c.course_no
	JOIN professors p
		ON p.last_name = t.last_Name
	GROUP BY s.student_name
		,c.course_title
		,p.last_name) a
GROUP BY a.student_name
	,a.course_title

-- Write a query that returns employees whose salary is above 
-- average for their given department

SELECT first_name
FROM employees outter_emp
WHERE salary > (SELECT AVG(salary)
			   FROM employees e
			   WHERE e.department = outter_emp.department)
			   
-- Write a query that retuns ALL of the students
-- as well as any courses they may or may not be taking

SELECT s.student_no
	,student_name
	,course_no
FROM students s
LEFT JOIN student_enrollment se
ON s.student_no = se.student_no




