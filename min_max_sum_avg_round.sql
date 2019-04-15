SELECT * 
FROM payment
LIMIT 5;

SELECT AVG(amount)
FROM payment;

SELECT ROUND(AVG(amount),2)
FROM payment;

SELECT MIN(amount)
FROM payment;

SELECT amount
FROM payment
ORDER BY amount;

SELECT COUNT(amount)
FROM payment
WHERE amount = 0.00;

SELECT MAX(amount)
FROM payment;

SELECT ROUND(SUM(amount))
FROM payment;

-- MIN MAX SUM AVG COUNT --
-- ROUND









