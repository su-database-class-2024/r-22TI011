CREATE VIEW rental_amount AS SELECT inventory_id,amount FROM rental, payment 
WHERE rental.rental_id = payment.rental_id;
CREATE VIEW film_amount AS SELECT film_id, amount FROM inventory, rental_amount 
WHERE inventory.inventory_id = rental_amount.inventory_id;
CREATE VIEW category_amount AS SELECT category_id, amount FROM film_category, film_amount 
WHERE film_category.film_id = film_amount.film_id;
CREATE VIEW ctgr_amount AS SELECT category_id, COUNT(*), SUM(amount)  FROM category_amount 
GROUP BY category_id ORDER BY category_id;
SELECT name AS category, count AS rental, SUM AS amount  FROM category, ctgr_amount 
WHERE category.category_id = ctgr_amount.category_id;