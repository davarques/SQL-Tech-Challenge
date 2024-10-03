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

-- Practicing GROUP BY, HAVING, ORDER BY and LIMIT:

-- Group customers by their active status and count how many customers are in each group.
SELECT DISTINCT active AS status_type FROM customer;

SELECT active AS status_type, COUNT(customer_id) AS customer_count
FROM customer
GROUP BY active;

-- Group staff members by their last name and count how many have the same last name.
SELECT DISTINCT last_name, COUNT(staff_id) AS staff_count
FROM staff
GROUP BY last_name;

-- Find the total amount spent by each customer and group them, only showing those who spent more than 100.
SELECT DISTINCT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING total_spent >100
ORDER BY total_spent DESC;

-- Group films by rental duration and show only groups that have more than 10 films, ordered by the number of films.
SELECT rental_duration, COUNT(title) AS film_count 
FROM film
GROUP BY rental_duration
HAVING film_count > 10
ORDER BY film_count;

-- Find the count of customers per store, ordering by the store with the most customers first, limiting to the top 5.
SELECT store_id, COUNT(customer_id) AS client_count
FROM customer
GROUP BY store_id
ORDER BY client_count DESC
LIMIT 5;

-- Group payments by payment date and show the total amount received on each date, ordering by date in descending order.
SELECT payment_date, SUM(amount) AS total_amount
FROM payment 
GROUP BY payment_date
ORDER BY payment_date DESC;

-- Group inventory items by store and count how many items are available in each store, showing only stores with more than 50 items.
SELECT store_id, COUNT(inventory_id) AS count_inventory
FROM inventory
GROUP BY store_id
HAVING count_inventory > 50
ORDER BY count_inventory DESC;

-- Group rentals by return date and count how many rentals were returned on each date, ordering by the most returned date.
SELECT return_date, COUNT(*) AS rentals_count
FROM rental
GROUP BY return_date
ORDER BY rentals_count DESC;

-- Group customers by store and calculate the total amount they spent per store, showing only stores with a total greater than 5000.

SELECT customer.store_id, COUNT(customer.customer_id) AS client_count, SUM(payment.amount) AS total_spent
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.store_id
HAVING total_spent > 5000
ORDER BY total_spent DESC;

-- Group films by rating and show the total rental duration for each rating, ordering by rental duration in descending order.
SELECT rating, SUM(rental_duration) AS total_rental_duration
FROM film
GROUP BY rating
ORDER BY total_rental_duration DESC;



