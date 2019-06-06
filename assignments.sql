-- Write a query to display the names of those students that are between the ages of 18 and 20.
SELECT student_name
FROM students
WHERE age BETWEEN 18 and 20

-- Write a query to display all of those students that contain the letters "ch" in their name 
-- or their name ends with the letters  "nd".

SELECT student_name
FROM students
WHERE student_name ilike '%ch%'
OR student_name ilike '%nd';

-- Write a query to display the name of those students that have the letters "ae" or "ph" in their name 
-- and are NOT 19 years old.

SELECT student_name
	,age
FROM students
WHERE (student_name like '%ae%' OR student_name like '%ph%')
AND age != 19;

-- Write a query that lists the names of students sorted by their age from largest to smallest. 
SELECT student_name
	,age
FROM students
ORDER BY age DESC;

-- Write a query that displays the names and ages of the top 4 oldest students.
SELECT student_name
	,age
FROM students
ORDER BY age DESC
LIMIT 4;

-- The student must not be older than age 20 if their student_no is either between 3 and 5 or their student_no is 7. 
--Your query should also return students older than age 20 but in that case they must have a student_no that is at least 4. 
SELECT student_name
	,age
	,student_no
FROM students
WHERE age >= 20
AND (student_no BETWEEN 3 AND 5 OR student_no = 7)
OR (age > 20 AND student_no = 4);

-- Upper
SELECT UPPER(first_name)
FROM employees;

-- Lower
SELECT LOWER(first_name)
FROM employees;

SELECT UPPER(first_name)
	,LOWER(department)
FROM employees;

SELECT LENGTH(first_name)
	,LOWER(department)
FROM employees;

SELECT LENGTH('     HELLO THERE    ')

SELECT *
FROM employees;

-- Pipes
SELECT first_name ||' '|| last_name AS full_name
	,department
FROM employees;

-- Boolean expression
SELECT first_name ||' '|| last_name AS full_name, (salary >140000)
	,department
FROM employees
ORDER BY salary DESC;

SELECT department, ('Clothing' IN (department))
FROM employees;

SELECT department, (department like '%oth%')
FROM employees;

SELECT 'This is test data' AS test_data

SELECT SUBSTRING('This is test data' FROM 1 FOR 4) AS test_data_extracted

SELECT SUBSTRING('This is test data' FROM 9 FOR 4) AS test_data_extracted

SELECT SUBSTRING('This is test data' FROM 9) AS test_data_extracted

SELECT department 
	,REPLACE(department, 'Clothing','Attire') AS modified
FROM departments

SELECT department
	,department || ' Department' AS modified
FROM departments

SELECT *
FROM employees

SELECT email
	,SUBSTRING(email, POSITION('@' IN email) + 1) AS formated_text
FROM employees

SELECT COALESCE(email, 'NONE') AS email
FROM employees

SELECT *
FROM employees

SELECT ROUND(AVG(salary))
FROM employees

SELECT UPPER(first_name)
FROM employees

SELECT MAX(salary)
FROM employees

SELECT MIN(salary)
FROM employees

SELECT COUNT(employee_id)
FROM employees

SELECT *
FROM employees

SELECT COUNT(*)
FROM employees

SELECT SUM(salary)
FROM employees

SELECT SUM(salary)
FROM employees
WHERE department = 'Clothing'

SELECT SUM(salary)
FROM employees
WHERE department = 'Toys'

CREATE TABLE cars(make varchar(10))

SELECT *
FROM cars

INSERT INTO cars VALUES('HONDA');
INSERT INTO cars VALUES('HONDA');
INSERT INTO cars VALUES('HONDA');
INSERT INTO cars VALUES('TOYOTA');
INSERT INTO cars VALUES('TOYOTA');
INSERT INTO cars VALUES('NISSAN');

SELECT COUNT(*)
	,make
FROM cars
GROUP BY make

SELECT * 
FROM cars

INSERT INTO cars VALUES (NULL);
INSERT INTO cars VALUES (NULL);
INSERT INTO cars VALUES (NULL);
INSERT INTO cars VALUES (NULL);

SELECT make
	,COUNT(*)
FROM cars
GROUP BY make

-- Write a query against the professors table that can output the following in the result: "Chong works in the Science department"
SELECT * FROM professors

SELECT last_name || ' works in the ' || department || ' department'
FROM professors
WHERE last_name = 'Chong'

-- Write a SQL query against the professors table that would return the following result: 

-- "It is false that professor Chong is highly paid"
-- "It is true that professor Brown is highly paid"
-- "It is false that professor Jones is highly paid"
-- "It is true that professor Wilson is highly paid"
-- "It is false that professor Miller is highly paid"
-- "It is true that professor Williams is highly paid"

-- NOTE: A professor is highly paid if they make greater than 95000. 

SELECT * FROM professors

SELECT 'It is ' || (salary >= 95000) || ' that professor ' || last_name || ' is highly paid'
FROM professors

-- Write a query that returns all of the records and columns from the professors table 
-- but shortens the department names to only the first three characters in upper case. 
SELECT * FROM professors

SELECT last_name
	,UPPER(SUBSTRING(department,1,3)) AS department
	,salary
	,hire_date
FROM professors

-- Write a query that returns the highest and lowest salary from the professors table excluding the professor named 'Wilson'.
SELECT * 
FROM professors

SELECT MAX(salary)
	,MIN(salary)
FROM professors
WHERE last_name != 'Wilson'

-- Write a query that will display the hire date of the professor that has been teaching the longest.
SELECT MIN(hire_date)
FROM professors



CREATE TABLE fruit_imports
(
	id integer,
	name varchar(20),
	season varchar(10),
	state varchar(20),
	supply integer,
	cost_per_unit decimal
);

insert into fruit_imports values(1, 'Apple', 'All Year', 'Kansas', 32900, 0.22);
insert into fruit_imports values(2, 'Avocado', 'All Year', 'Nebraska', 27000, 0.15);
insert into fruit_imports values(3, 'Coconut', 'All Year', 'California', 15200, 0.75);
insert into fruit_imports values(4, 'Orange', 'Winter', 'California', 17000, 0.22);
insert into fruit_imports values(5, 'Pear', 'Winter', 'Iowa', 37250, 0.17);
insert into fruit_imports values(6, 'Lime', 'Spring', 'Indiana', 40400, 0.15);
insert into fruit_imports values(7, 'Mango', 'Spring', 'Texas', 13650, 0.60);
insert into fruit_imports values(8, 'Orange', 'Spring', 'Iowa', 18000, 0.26);
insert into fruit_imports values(9, 'Apricot', 'Spring', 'Indiana', 55000, 0.20);
insert into fruit_imports values(10, 'Cherry', 'Summer', 'Texas', 62150, 0.02);
insert into fruit_imports values(11, 'Cantaloupe', 'Summer', 'Texas', 8000, 0.49);
insert into fruit_imports values(12, 'Apricot', 'Summer', 'Kansas', 14500, 0.20);
insert into fruit_imports values(13, 'Mango', 'Summer', 'Texas', 17000, 0.68);
insert into fruit_imports values(14, 'Pear', 'Fall', 'Nebraska', 30500, 0.12);
insert into fruit_imports values(15, 'Grape', 'Fall', 'Illinois', 72500, 0.35);

-- Write a query that displays only the state with the largest amount of fruit supply.
SELECT * FROM fruit_imports

SELECT state
	,SUM(supply)
FROM fruit_imports
GROUP BY state
ORDER BY SUM(supply) DESC
LIMIT 1

-- Write a query that returns the most expensive cost_per_unit of every season. 
-- The query should display 2 columns, the season and the cost_per_unit
SELECT * FROM fruit_imports

SELECT season
	,MAX(cost_per_unit)
FROM fruit_imports
GROUP BY season

-- Write a query that returns the state that has more than 1 import of the same fruit. 
SELECT * FROM fruit_imports

SELECT state
	,COUNT(name)
FROM fruit_imports
GROUP BY state
HAVING COUNT(name) > 1

-- Write a query that returns the seasons that produce either 3 fruits or 4 fruits.
SELECT * FROM fruit_imports

SELECT season
	,COUNT(name)
FROM fruit_imports
GROUP BY season
HAVING COUNT(name) IN (3,4)

-- Write a query that takes into consideration the supply and cost_per_unit columns for 
-- determining the total cost and returns the most expensive state with the total cost.
SELECT * FROM fruit_imports

SELECT state
	,SUM(cost_per_unit * supply) AS total_cost
FROM fruit_imports
GROUP BY state
ORDER BY total_cost
LIMIT 1

-- Write a query that returns the count of 4. You'll need to count on the column fruit_name and not use COUNT(*)
-- HINT: You'll need to use an additional function inside of count to make this work.
SELECT * FROM fruit_imports

SELECT COUNT(COALESCE(fruit_name, 'SOMEVALUE'))
FROM fruits;

SELECT SUM(salary)
	,department
FROM employees
GROUP BY department

SELECT SUM(salary)
	,department
FROM employees
WHERE region_id IN (4,5,6,7)
GROUP BY department

SELECT * FROM employees

SELECT COUNT(employee_id)
	,department
FROM employees
GROUP BY department

SELECT department
	,count(*) AS total_number_employees
	,ROUND(AVG(salary)) AS avg_sal
	,MIN(salary) AS min_sal
	,MAX(salary) AS max_sal
FROM employees
WHERE salary > 70000
GROUP BY department
ORDER BY total_number_employees DESC

SELECT department
	,gender
	,count(*) 
FROM employees
GROUP BY department
	,gender
ORDER BY department

SELECT department
	,COUNT(*)
FROM employees
GROUP BY department
HAVING COUNT(*) > 35
ORDER BY COUNT(*) DESC

SELECT *
FROM employees

SELECT first_name
	,COUNT(*)
FROM employees
GROUP BY first_name
HAVING COUNT(*) > 1

SELECT first_name
	,COUNT(*)
FROM employees
GROUP BY first_name
HAVING COUNT(*) > 2

SELECT department
FROM employees
GROUP BY department

SELECT *
FROM employees

SELECT SUBSTRING(email, POSITION('@' IN email) +1) AS domain_name
	,COUNT(first_name) AS employee_count
FROM employees
WHERE email IS NOT NULL
GROUP BY domain_name
ORDER BY employee_count DESC

SELECT gender
	,region_id
	,MIN(salary) AS min_salary
	,MAX(salary) AS max_salary
	,ROUND(AVG(salary)) AS avg_salary
FROM employees
GROUP BY gender
	,region_id
ORDER BY gender
	,region_id

SELECT * FROM employees

SELECT first_name
	,last_name
	,*
FROM employees

SELECT employees.department
FROM employees, departments

SELECT departments.department
FROM employees, departments

SELECT e.department
FROM employees e, departments d

SELECT e.department
FROM (SELECT * FROM ...)

-- SUBQUERIES
SELECT * FROM employees
WHERE department NOT IN (SELECT department FROM departments)

SELECT a.employee_name
	,a.yearly_salary
FROM (SELECT first_name AS employee_name
	  	,salary AS yearly_salary
	  FROM employees WHERE salary > 150000) a

SELECT a.employee_name
	,a.yearly_salary
FROM (SELECT first_name AS employee_name
	  	,salary AS yearly_salary
	  FROM employees WHERE salary > 150000) a,
	  (SELECT department department_name FROM departments) b

SELECT *
FROM employees
WHERE department IN (SELECT department FROM departments)

SELECT * 
FROM (SELECT department FROM departments) a

SELECT first_name
	,last_name
	,salary
	,(SELECT first_name FROM employees limit 1)
FROM employees 

SELECT *
FROM departments

SELECT *
FROM employees
WHERE department 
IN (SELECT department
	  	FROM departments
	  	WHERE division = 'Electronics')
		
SELECT *
FROM employees
WHERE region_id IN 
			(SELECT region_id
			FROM regions
			WHERE country IN ('Asia','Canada'))
AND salary > 130000

SELECT *
FROM regions

SELECT first_name
	,department
	,(SELECT MAX(salary) FROM employees) - salary AS salary_diff_from_max
FROM employees
WHERE region_id IN 
				(SELECT region_id
				FROM regions
				WHERE country IN ('Asia','Canada'))

SELECT first_name
	,department
	,salary
	,(SELECT MAX(salary) FROM employees)
	,(SELECT MAX(salary) FROM employees) - salary AS salary_diff_from_max
FROM employees
WHERE region_id IN 
				(SELECT region_id
				FROM regions
				WHERE country IN ('Asia','Canada'))


SELECT *
FROM regions

SELECT *
FROM employees
WHERE region_id IN 
				(SELECT region_id 
				FROM regions 
				WHERE country = 'United States')
				
-- ALL
SELECT *
FROM employees
WHERE region_id > ALL
				(SELECT region_id
				FROM regions
				WHERE country = 'United States')

SELECT *
FROM departments

SELECT department
FROM employees
GROUP BY department
ORDER BY department DESC

SELECT first_name
	,last_name
	,hire_date
FROM employees
WHERE department IN (SELECT department
					FROM departments
					WHERE division IN ('Kids'))
AND hire_date > ALL (SELECT hire_date
	 				FROM employees
					WHERE department = 'Maintenance')

SELECT salary FROM (
SELECT salary
	,COUNT(*)
FROM employees
GROUP BY salary
ORDER BY COUNT(*) DESC
	,salary DESC
LIMIT 1) a

SELECT salary
FROM employees
GROUP BY salary
HAVING COUNT(*) >= ALL(SELECT COUNT(*)
					   FROM employees
					   GROUP BY salary)
ORDER BY salary DESC
LIMIT 1

CREATE table dupes (id integer, name varchar(10));

INSERT INTO dupes VALUES (1, 'FRANK');
INSERT INTO dupes VALUES (2, 'FRANK');
INSERT INTO dupes VALUES (3, 'ROBERT');
INSERT INTO dupes VALUES (4, 'ROBERT');
INSERT INTO dupes VALUES (5, 'SAM');
INSERT INTO dupes VALUES (6, 'FRANK');
INSERT INTO dupes VALUES (7, 'PETER');

SELECT *
FROM dupes

SELECT min(id)
	,name
FROM dupes
GROUP BY name

drop table dupes

SELECT *
FROM employees

SELECT ROUND(AVG(SALARY))
FROM employees
WHERE salary NOT IN(
			(SELECT MIN(salary)
			FROM employees),
			(SELECT MAX(salary)
			FROM employees))

-- Is the students table directly related to the courses table? Why or why not?
-- No

-- Using subqueries only, write a SQL statement that returns the names of those students that are taking the courses  Physics and US History. 

SELECT *
FROM courses

SELECT *
FROM students

SELECT student_name
FROM students
WHERE student_no IN (
SELECT student_no
FROM student_enrollment
WHERE course_no IN (SELECT course_no
				   FROM courses
				   WHERE course_title IN('Physics','US History'))) 

SELECT *
FROM student_enrollment


-- Using subqueries only, write a query that returns the name of the student that is taking the highest number of courses. 
SELECT student_name 
FROM students 
WHERE student_no 
IN (
    SELECT student_no FROM (
        SELECT student_no, COUNT(course_no) course_cnt
        FROM STUDENT_ENROLLMENT
        GROUP BY student_no
        ORDER BY course_cnt desc
        LIMIT 1
    )a
)

-- Write a query to find the student that is the oldest. You are not allowed to use LIMIT or the ORDER BY clause to solve this problem.
SELECT student_name
	,age
FROM students
WHERE age = (SELECT MAX(age)
					FROM students) 

SELECT *
FROM students
WHERE age = (SELECT MAX(age)
					FROM students) 

SELECT *
FROM employees

SELECT first_name
	,salary
	,CASE 
		WHEN salary < 100000 THEN 'UNDER PAID'
		WHEN salary > 100000 AND salary < 160000 THEN 'PAID WELL'
		ELSE 'EXECUTIVE'
		END
FROM employees
ORDER BY salary DESC

SELECT a.category
		,COUNT(*)
		FROM (
SELECT first_name
	,salary
	,CASE 
		WHEN salary < 100000 THEN 'UNDER PAID'
		WHEN salary > 100000 AND salary < 160000 THEN 'PAID WELL'
		ELSE 'EXECUTIVE'
		END as category
FROM employees
ORDER BY salary DESC
	) a
GROUP BY a.category



SELECT first_name
	,salary
	,CASE 
		WHEN salary < 100000 THEN 'UNDER PAID'
		WHEN salary > 100000 AND salary < 160000 THEN 'PAID WELL'
		ELSE 'EXECUTIVE'
		END
FROM employees
ORDER BY salary DESC

SELECT SUM(CASE WHEN salary < 100000 THEN 1 ELSE 0 END) as under_paid
	,SUM(CASE WHEN salary > 100000 AND salary < 150000 THEN 1 ELSE 0 END) as paid_well
	,SUM(CASE WHEN salary > 150000 THEN 1 ELSE 0 END) AS executive
FROM employees

SELECT department
	,COUNT(*)
FROM employees
WHERE department IN ('Sports', 'Tools', 'Clothing', 'Computers')
GROUP BY department

SELECT 
	SUM(CASE WHEN department = 'Sports' THEN 1 ELSE 0 END) AS Sports
	,SUM(CASE WHEN department = 'Tools' THEN 1 ELSE 0 END) AS Tools
	,SUM(CASE WHEN department = 'Clothing' THEN 1 ELSE 0 END) AS Clothing
	,SUM(CASE WHEN department = 'Computers' THEN 1 ELSE 0 END) AS COMPUTER
FROM employees

SELECT *
FROM regions

SELECT first_name
	,CASE WHEN region_id = 1 THEN(SELECT country FROM regions
								 WHERE region_id = 1) END region_1
	,CASE WHEN region_id = 2 THEN(SELECT country FROM regions
								 WHERE region_id = 2) END region_2
	,CASE WHEN region_id = 3 THEN(SELECT country FROM regions
								 WHERE region_id = 3) END region_3
	,CASE WHEN region_id = 4 THEN(SELECT country FROM regions
								 WHERE region_id = 4) END region_4
	,CASE WHEN region_id = 5 THEN(SELECT country FROM regions
								 WHERE region_id = 5) END region_5
	,CASE WHEN region_id = 6 THEN(SELECT country FROM regions
								 WHERE region_id = 6) END region_6
	,CASE WHEN region_id = 7 THEN(SELECT country FROM regions
								 WHERE region_id = 7) END region_7							 
FROM employees

SELECT 2 + 3 AS added_numbers

SELECT COUNT(a.region_1) + COUNT(a.region_2) + COUNT(a.region_3) AS united_states
		,COUNT(a.region_4) + COUNT(a.region_5) AS Asia
		,COUNT(a.region_6) + COUNT(a.region_7) AS Canada
FROM (SELECT first_name
	,CASE WHEN region_id = 1 THEN(SELECT country FROM regions
								 WHERE region_id = 1) END region_1
	,CASE WHEN region_id = 2 THEN(SELECT country FROM regions
								 WHERE region_id = 2) END region_2
	,CASE WHEN region_id = 3 THEN(SELECT country FROM regions
								 WHERE region_id = 3) END region_3
	,CASE WHEN region_id = 4 THEN(SELECT country FROM regions
								 WHERE region_id = 4) END region_4
	,CASE WHEN region_id = 5 THEN(SELECT country FROM regions
								 WHERE region_id = 5) END region_5
	,CASE WHEN region_id = 6 THEN(SELECT country FROM regions
								 WHERE region_id = 6) END region_6
	,CASE WHEN region_id = 7 THEN(SELECT country FROM regions
								 WHERE region_id = 7) END region_7							 
FROM employees) a

SELECT *
FROM employees

SELECT first_name
	,country
FROM employees, regions
WHERE employees.region_id = regions.region_id


SELECT first_name
	,email
	,departments.department
	,division
	,country
FROM employees, departments, regions
WHERE employees.department = departments.department
AND employees.region_id = regions.region_id
AND email IS NOT NULL

SELECT country
	,count(employee_id)
FROM employees e
	,regions r
WHERE e.region_id = r.region_id
GROUP BY country

SELECT first_name
	,country
FROM employees
INNER JOIN regions











