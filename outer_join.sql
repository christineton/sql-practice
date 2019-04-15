SELECT *
FROM film
LIMIT 5;

SELECT *
FROM inventory
LIMIT 5;

SELECT film.film_id
	,film.title
	,inventory.inventory_id
FROM film
LEFT OUTER JOIN inventory
ON film.film_id = inventory.film_id;

SELECT film.film_id
	,film.title
	,inventory.inventory_id
FROM film
LEFT OUTER JOIN inventory
ON film.film_id = inventory.film_id
WHERE inventory.film_id IS NULL
ORDER BY film.film_id;

SELECT film.film_id
	,film.title
	,inventory.inventory_id
FROM film
LEFT OUTER JOIN inventory
ON film.film_id = inventory.film_id
WHERE inventory_id IS NULL
ORDER BY title;










