SELECT *
FROM customer;

SELECT * 
FROM payment;

SELECT customer.customer_id
	,customer.first_name
	,customer.last_name
	,customer.email
	,payment.amount
	,payment.payment_date
FROM customer 
INNER JOIN payment
ON customer.customer_id = payment.customer_id;

SELECT customer.customer_id
	,customer.first_name
	,customer.last_name
	,customer.email
	,payment.amount
	,payment.payment_date
FROM customer 
INNER JOIN payment
ON customer.customer_id = payment.customer_id
ORDER BY customer.customer_id;

SELECT customer.customer_id
	,customer.first_name
	,customer.last_name
	,customer.email
	,payment.amount
	,payment.payment_date
FROM customer 
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id = 2;

SELECT customer.customer_id
	,customer.first_name
	,customer.last_name
	,customer.email
	,payment.amount
	,payment.payment_date
FROM customer 
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.first_name LIKE 'A%';

SELECT * 
FROM payment
LIMIT 5;

SELECT * 
FROM staff
LIMIT 5;

SELECT payment.payment_id
	,payment.amount
	,staff.first_name
	,staff.last_name
FROM payment
INNER JOIN staff
ON payment.staff_id = staff.staff_id;

SELECT * 
FROM inventory
LIMIT 5;

SELECT *
FROM film
LIMIT 5;

SELECT title
	,COUNT(film.title) AS copies_at_store1
FROM inventory
INNER JOIN film 
ON inventory.film_id = film.film_id
WHERE inventory.store_id = 1
GROUP BY title
ORDER BY title;

SELECT *
FROM film
LIMIT 2;

SELECT *
FROM language
LIMIT 2;

SELECT film.title
	,language.name AS movie_language
FROM film
INNER JOIN language
ON film.language_id = language.language_id;



















