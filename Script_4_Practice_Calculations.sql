USE sakila;

-- 1. Find the length of the first name of each actor.

SELECT first_name, LENGTH(first_name) AS name_length
FROM actor
LIMIT 10;

-- 2. Concatenate first and last names of actors with a space in between.
SELECT concat(first_name,' ', last_name) AS complete_name
FROM actor;

-- 3. Convert all film titles to uppercase.
SELECT title, upper(title) FROM film;

-- 4. Convert all customer emails to lowercase.
SELECT lower(email) from customer;

-- 5. Extract the first 3 characters from film titles.
SELECT substring(title, 1, 3) from film;

-- 6. Find the current date and time.

SELECT CURDATE(), CURTIME();

-- 7. Display the current date.

SELECT curdate();

-- 8. Display the current time.
SELECT current_time();

-- 9. Add 10 days to the rental date for each rental.
SELECT rental_date, date_add(rental_date, interval 10 day) as new_rental_date
FROM rental;

-- 10. Subtract 5 days from the return date for each rental.
SELECT return_date, date_sub(return_date, interval 5 day) 
FROM RENTAL;

-- 11. Find the number of days between rental date and return date.

SELECT datediff(return_date, rental_date) AS date_difference
FROM rental;

SELECT datediff(return_date, rental_date) AS date_difference
FROM rental
WHERE datediff(return_date, rental_date) > 8;

-- 12. Display actor names where the first name is longer than 5 characters.
SELECT first_name 
FROM actor
WHERE Length(first_name) > 5;

-- 13. Concatenate film title and description where the title has more than 10 characters.
SELECT concat(title, description)
FROM film
WHERE length(title) > 5;

-- 14. Convert the last names of staff to uppercase where the last name starts with 'S'.

SELECT UPPER(last_name)
FROM staff
WHERE last_name LIKE 'S%';

-- 15. Extract a substring from customer email, showing the first 4 characters and limit to 10 results.
SELECT substring(email ,1, 4)
FROM customer
LIMIT 10;


-- 16. Add 2 months to the payment date and order by amount.

SELECT payment_date, date_add(payment_date, interval 2 month) as new_pay_date
FROM payment;

-- 17. Subtract 1 week from the payment date and group by customer ID.

SELECT customer_id, MAX(date_sub(payment_date, interval 1 week))
FROM payment 
GROUP BY customer_id;

-- 18. Find the difference in days between the payment date and the rental date.
SELECT p.payment_date, r.rental_date, DATEDIFF(p.payment_date, r.rental_date) as pay_rental_date_diff
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id;

-- Conditional commands Practcie:

-- 1. Categorize films based on rental duration.

-- first know min and max to know classifications
SELECT MIN(rental_duration), MAX(rental_duration)
FROM film;

SELECT title, 
CASE 
WHEN rental_duration < 3 THEN 'short'
WHEN rental_duration BETWEEN 3 AND 5 THEN 'medium'
ELSE 'long'
END
FROM film;

-- 2. Determine if customers are active or inactive based on their last rental date.

SELECT c.customer_id,
       c.first_name,
       c.last_name,
       IF(MAX(r.rental_date) > NOW() - INTERVAL 1 YEAR, 'Active', 'Inactive') AS customer_status
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id;

-- Classify films as 'Action' or 'Non-Action' based on the category ID.
select * from category;

SELECT fi.title, fica.category_id, IF(ca.name LIKE '%Action%', 'Action', 'Non-Action') as action_or_not
FROM film fi
JOIN film_category fica USING (film_id)
JOIN category ca USING (category_id);

-- 3. Replace NULL rental rates with a default value of 0 in the inventory table.




-- 4. Find the first available phone number for each customer; use a default value if all are NULL.

-- 5. Identify films with no rentals by returning NULL if the rental count is zero.

-- 6. Count the number of films in each category based on their rating.

SELECT film_id, title, IFNULL(rental_rate, 'NULL') AS adjusted_rental_rate
FROM film
WHERE rental_rate = 'NULL';

SELECT film_id, title, rental_rate
FROM film
WHERE rental_rate IS NULL;