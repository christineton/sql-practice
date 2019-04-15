SELECT *
FROM customer;

SELECT first_name
	,last_name
FROM customer
ORDER BY first_name;

SELECT first_name
	,last_name
FROM customer
ORDER BY first_name DESC;

SELECT first_name
	,last_name
FROM customer
ORDER BY last_name DESC;

SELECT first_name
	,last_name
FROM customer
ORDER BY first_name ASC
	,last_name DESC;

SELECT first_name
FROM customer
ORDER BY last_name;

SELECT customer_id
	,amount
FROM payment
ORDER BY amount DESC
LIMIT 10;

SELECT title
	,film_id
FROM film
WHERE film_id BETWEEN 1 AND 5

SELECT film_id
	,title
	,release_year
FROM film
ORDER BY film_id
LIMIT 5;























