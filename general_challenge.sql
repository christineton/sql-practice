SELECT COUNT(amount)
FROM payment
WHERE amount >= 5;

SELECT COUNT(first_name)
FROM actor
WHERE first_name ILIKE 'P%';

SELECT COUNT(DISTINCT(district))
FROM address;

SELECT DISTINCT(district)
FROM address
ORDER BY district;

SELECT title
	,rating
	,replacement_cost
FROM film
WHERE rating = 'R'
AND replacement_cost BETWEEN 5 AND 15
ORDER BY replacement_cost;

SELECT *
FROM film
LIMIT 1;

SELECT COUNT(*)
FROM film
WHERE title ILIKE '%truman%';










