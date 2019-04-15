SELECT customer_id
	,SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 200;

SELECT store_id
	,COUNT(customer_id)
FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 300;

SELECT *
FROM film
LIMIT 2;

SELECT rating
	,rental_rate
FROM film
WHERE rating IN ('R','G','PG');

SELECT rating
	,ROUND(AVG(rental_rate),2)
FROM film
WHERE rating IN ('R', 'G', 'PG')
GROUP BY rating
HAVING AVG(rental_rate) < 3;

SELECT customer_id
	,COUNT(amount)
FROM payment
GROUP BY customer_id
HAVING COUNT(amount) >= 40
ORDER BY COUNT(amount);

SELECT rating
	,ROUND(AVG(rental_duration),2) as avg_rental_duration
FROM film
GROUP BY rating
HAVING AVG(rental_duration) > 5
ORDER BY avg_rental_duration DESC;

















