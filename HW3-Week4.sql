--############################### HW 3 - Week 4 ###############################--

-- Question 1. List all customers who live in Texas (use JOINs)
-- Answer: 5 customers were found
SELECT customer_id, first_name, last_name, district 
FROM customer 
JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';


-- Question 2. Get all payments above $6.99 with the Customer's Full Name
-- Answer: 1406 customers were found
SElECT payment_id, first_name, last_name, amount 
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;


-- Question 3. Show all customers names who have made at least 4 payments(use subqueries)
-- Answer: 599 customers were found
SELECT first_name, last_name
FROM customer 
WHERE customer_id IN(
	SELECT customer_id
	FROM payment 
	GROUP BY customer_id
	HAVING COUNT(customer_id) >= 4
);


-- Question 4. List all customers that live in Nepal (use the city table)
-- Answer: 0 customer was found
SELECT first_name, last_name, customer.customer_id
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON city.city_id = address.city_id
WHERE city.city = 'Nepal';


-- Question 5. Which staff member (first/last name) had the most transactions?
-- Answer: Jon Stephens
SELECT first_name, last_name, COUNT(amount)
FROM staff
JOIN payment
ON payment.staff_id = staff.staff_id
GROUP BY first_name, last_name
ORDER BY COUNT(amount) DESC;


-- Question 6. Which movie title(s) has been rented the most?
-- Answer:Bucket Brotherhood
SELECT title, COUNT(rental_id)
FROM film
JOIN inventory
ON inventory.film_id = film.film_id
JOIN rental
ON rental.inventory_id = inventory.inventory_id
GROUP BY title
ORDER BY COUNT(rental_id) DESC;


-- Question 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
-- Answer: 130 customers were found
SELECT first_name, last_name
FROM customer 
WHERE customer_id IN(
	SELECT customer_id 
	FROM payment
	WHERE amount > 6.99
	GROUP BY customer_id
	HAVING COUNT(amount) = 1
);


-- Question 8. Which employee gave out the most free rentals?
-- Answer: Mike Hillyer 
SELECT first_name, last_name, COUNT(amount)
FROM staff
JOIN payment
ON payment.staff_id = staff.staff_id
WHERE amount = 0
GROUP BY first_name, last_name
ORDER BY COUNT(amount) DESC;


