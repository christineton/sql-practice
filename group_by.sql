SELECT *
FROM payment
LIMIT 10;

SELECT customer_id
FROM payment
GROUP BY customer_id;

SELECT customer_id
	,SUM(amount) AS total_amount
FROM payment
GROUP BY customer_id
ORDER BY total_amount DESC;

SELECT *
FROM payment

SELECT staff_id
	,COUNT(payment_id)
FROM payment
GROUP BY staff_id;

SELECT *
FROM film
LIMIT 5;

SELECT rating
	,COUNT(rating)
FROM film
GROUP BY rating;

SELECT *
FROM film
LIMIT 1;

SELECT rental_duration
	,COUNT(rental_duration)
FROM film
GROUP BY rental_duration;

SELECT rental_rate
	,rating
FROM film
LIMIT 5;

SELECT rating
	,ROUND(AVG(rental_rate),2)
FROM film
GROUP BY rating;

SELECT staff_id
	,COUNT(payment_id) AS payment_count
	,SUM(amount) AS sum_amount
FROM payment
GROUP BY staff_id
ORDER BY payment_count DESC
	,sum_amount DESC

SELECT rating
	,ROUND(AVG(replacement_cost),2) AS avg_replacement_cost
FROM film
GROUP BY rating
ORDER BY avg_replacement_cost DESC;

SELECT customer_id
	,SUM(amount) AS total_spend
FROM payment
GROUP BY customer_id
ORDER BY total_spend DESC
LIMIT 5;






















