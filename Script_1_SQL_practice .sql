USE sakila;

-- Retrieve all film titles.
SELECT * FROM film;

-- Retrieve all film titles.
SELECT title FROM film;

-- Retrieve unique film ratings.
SELECT DISTINCT rating FROM film;

-- Count the total number of films.
SELECT COUNT(film_id) FROM film;

-- Calculate the total rental duration of all films.
SELECT SUM(rental_duration) FROM film;

-- Find the average length of films.
SELECT AVG(length) FROM film;

-- Find the shortest and longest film lengths.
SELECT MIN(length) AS shortest_film, MAX(length) AS longest_film
FROM film;

-- Retrieve films with a rating of 'PG'.
SELECT * FROM film
WHERE rating = 'PG'
LIMIT 5;

-- Retrieve films with a rating of 'PG' or 'G'.
SELECT * FROM film
WHERE rating = 'PG' OR rating = 'G';

-- Retrieve films with the word 'love' in their title.
SELECT title FROM film
WHERE title LIKE '%love%';

-- Retrieve films with a rating of either 'PG', 'G', or 'R'.
SELECT * FROM film
WHERE rating = 'PG' AND rating = 'G' OR rating = 'R';

-- Retrieve films with a length between 60 and 120 minutes.
SELECT film_id, title FROM film 
WHERE length BETWEEN 60 AND 120;

-- Group films by their release year and count them.
SELECT release_year, COUNT(title)
FROM film
GROUP BY release_year;

-- Group films by rating and count how many have more than 50 films.
SELECT rating, COUNT(film_id) AS count_films
FROM film
GROUP BY rating
HAVING count_films > 50
ORDER BY count_films DESC;

-- Order films by their length in descending order.
SELECT * FROM film
ORDER BY length DESC;

-- Retrieve the first 10 films by title.
SELECT * FROM film
ORDER BY title DESC
LIMIT 10;

