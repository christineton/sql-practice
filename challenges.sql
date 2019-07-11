-- Write a query that finds students who do not take CS180.

SELECT student_name
FROM students
WHERE student_no IN (
					SELECT student_no
					FROM student_enrollment
					WHERE course_no != 'CS180')
					
-- Write a query to find students who take CS110 or CS107 but not both.
SELECT * FROM student_enrollment

SELECT student_name
FROM students
WHERE student_no NOT IN(
						SELECT a.student_no
						FROM student_enrollment a, student_enrollment b
						WHERE a.student_no = b.student_no
							AND a.course_no = 'CS110'
							AND b.course_no = 'CS107')
-- Solution A uses a self join on the student_enrollment table so that those students 
-- are narrowed down that take both CS110 and CS107 in the subquery. 
-- The outer query filters for those student_no that are not the ones retrieved from the subquery. 

-- Write a query to find students who take CS220 and no other courses.
SELECT s.student_no
FROM student_enrollment s, student_enrollment se
WHERE s.student_no = se.student_no
	AND s.student_no NOT IN(
							SELECT student_no
							FROM student_enrollment
							WHERE course_no = 'CS220')
-- In Solution A, the subquery returns all students that take a course other than CS220. 
-- The outer query gets all students regardless of what course they take. 
-- In essence, the subquery finds all students who take a course that is not CS220. 
-- The outer query returns all student who are not amongst those that take a course other than CS220. 
-- At this point, the only available students are those who actually take CS220 or take nothing at all. 

	