USE sakila;

-- Practicing sub-queries:

-- 1) Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.

SELECT COUNT(*)
FROM inventory
WHERE film_id = (SELECT film_id FROM film WHERE title = "HUNCHBACK IMPOSSIBLE");

-- 2) List all films whose length is longer than the average length of all the films in the Sakila database.

SELECT ROUND(AVG(length),2) FROM film;

SELECT *
FROM film 
WHERE length > (SELECT AVG(length) FROM film);

-- 3) Use a subquery to display all actors who appear in the film "Alone Trip".

SELECT a.* 
FROM actor a
JOIN film_actor fa USING (actor_id)
WHERE fa.film_id = (SELECT film_id FROM film WHERE title LIKE '%ALONE TRIP%');

-- 4) Identify all movies categorized as family films.

SELECT f.*
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
WHERE fc.category_id = 9;

-- 5) Retrieve the name and email of customers from Canada using both subqueries and joins.

SELECT cu.first_name, cu.last_name, cu.email
FROM customer cu
JOIN address a ON cu.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
WHERE co.country = 'Canada';

-- 6) Find the film titles that have a rental rate higher than the average rental rate.

SELECT title
FROM film
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);

-- 7) Identify the customers who have rented more than the average number of films.

SELECT c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
HAVING COUNT(r.rental_id) > (SELECT AVG(rental_count) FROM (
    SELECT COUNT(rental_id) AS rental_count
    FROM rental
    GROUP BY customer_id
) AS avg_rentals);

-- 8) List the names of staff members who have processed more rentals than the average staff member.

SELECT s.first_name, s.last_name
FROM staff s
JOIN rental r ON s.staff_id = r.staff_id
GROUP BY s.staff_id
HAVING COUNT(r.rental_id) > (SELECT AVG(rental_count) FROM (
    SELECT COUNT(rental_id) AS rental_count
    FROM rental
    GROUP BY staff_id
) AS avg_rentals);

