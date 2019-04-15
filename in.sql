SELECT *
FROM rental
LIMIT 1;

SELECT customer_id
	,rental_id
	,return_date
FROM rental
WHERE customer_id IN (1,2)
ORDER BY return_date DESC;

SELECT customer_id
	,rental_id
	,return_date
FROM rental
WHERE customer_id NOT IN (1,2)
ORDER BY return_date DESC;

SELECT customer_id
	,rental_id
	,return_date
FROM rental
WHERE customer_id IN (7,19,10)
ORDER BY return_date;

SELECT *
FROM payment
LIMIT 1;

SELECT *
FROM payment
WHERE amount IN (7.99,8.99)









