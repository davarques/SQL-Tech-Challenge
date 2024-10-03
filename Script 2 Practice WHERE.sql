USE sakila;

-- Practicing: WHERE clauses

-- Retrieve films with a rental duration that is IN a set of values.
SELECT * 
FROM film
WHERE rental_duration IN (5,6);

-- Find films where the rental rate is greater than ANY rental rate in the set.
SELECT * 
FROM film
WHERE rental_duration <= 4;

-- Retrieve films where the length EXISTS in a subquery selecting films longer than 120 minutes.
SELECT title, length
FROM film
WHERE EXISTS (
    SELECT length
    FROM film
    WHERE length > 120)
ORDER BY length DESC;

-- Retrieve films that do NOT have a rental duration of 5 days.
SELECT * FROM film 
WHERE rental_duration != 5;

-- Retrieve films with a rental duration equal or greater than 5 days.
SELECT * 
FROM film
WHERE rental_duration >= 5;

-- Retrieve films where the length is less than 90 minutes.
SELECT * 
FROM film
WHERE length < 90;