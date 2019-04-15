SELECT last_name, first_name
FROM customer
where first_name = 'Jamie';

SELECT last_name
	,first_name
FROM customer 
WHERE first_name = 'Jamie'
AND last_name = 'Rice';

SELECT customer_id
	,amount
	,payment_date
FROM payment
WHERE amount <= 1 OR amount >= 8;

SELECT email
FROM customer
WHERE first_name = 'Jared';

SELECT *
FROM payment
WHERE amount = 7.99;

SELECT *
FROM payment
WHERE amount > 4.99;

SELECT *
FROM payment
WHERE amount < 4.99;

SELECT *
FROM payment
WHERE amount <= 4.99;

SELECT amount
		,payment_date
FROM payment
WHERE amount != 4.99;

SELECT amount
		,payment_date
FROM payment
WHERE amount = 4.99
AND amount = 1.99;
-- does not work 

SELECT amount
	,payment_date
FROM payment
WHERE amount = 4.99
OR amount = 1.99;

SELECT * 
FROM customer
WHERE store_id = 1
AND address_id > 5;

SELECT *
FROM customer
WHERE store_id = 1 OR store_id = 2;

SELECT *
FROM customer
WHERE store_id = 1 AND address_id >= 200;

SELECT email
	,first_name
	,last_name
FROM customer
WHERE first_name = 'Nancy'
AND last_name = 'Thomas';

SELECT * 
FROM film;

SELECT title
	,description
FROM film
WHERE title = 'Outlaw Hanky';

SELECT phone
FROM address 
WHERE address = '259 Ipoh Drive'



