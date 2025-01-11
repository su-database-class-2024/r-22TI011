CREATE VIEW film_time AS SELECT film_id, age(return_date, rental_date) 
FROM inventory, rental WHERE inventory.inventory_id = rental.inventory_id;
CREATE VIEW film_days AS SELECT film_id, DATE_PART('day',age) FROM film_time;
CREATE VIEW category_days AS SELECT category_id, AVG(date_part) AS days 
FROM film_category JOIN film_days ON film_category.film_id = film_days.film_id GROUP BY category_id;
SELECT name AS category, AVG(days) AS days FROM category JOIN category_days 
ON category.category_id = category_days.category_id GROUP BY name ORDER BY name;