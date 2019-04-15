SELECT first_name
	,last_name
FROM customer
WHERE first_name LIKE 'Jen%';

SELECT first_name
	,last_name
FROM customer
WHERE first_name LIKE '%y';

SELECT first_name
	,last_name
FROM customer
WHERE first_name LIKE '%er%';

SELECT first_name
	,last_name
FROM customer
WHERE first_name LIKE '_her%';
-- The underscore is the single character as a wild card

SELECT first_name
	,last_name
FROM customer
WHERE first_name NOT LIKE 'Jen%';

SELECT first_name
	,last_name
FROM customer
WHERE first_name ILIKE 'BaR%';











