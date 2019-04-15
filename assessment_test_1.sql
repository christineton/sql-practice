-- ASSESSMENT TEST 1 --

SELECT customer_id
	,staff_id
	,SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
	,staff_id
HAVING SUM(amount) > 110

SELECT COUNT(title)
FROM film
WHERE title  ilike 'J%';

SELECT first_name
	,last_name
	,customer_id
FROM customer
WHERE first_name ilike 'e%'
AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;

	,