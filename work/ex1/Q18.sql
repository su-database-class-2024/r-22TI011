CREATE VIEW cityID AS SELECT country, city_id FROM country, city WHERE city.country_id = country.country_id;
CREATE VIEW addressID AS SELECT address_id, country FROM address, cityID WHERE address.city_id = cityID.city_id;
CREATE VIEW people AS SELECT country, count(*) AS people FROM customer, addressID WHERE customer.address_id = addressID.address_id GROUP BY country;
CREATE VIEW customerID AS SELECT customer_id, country FROM customer, addressID WHERE customer.address_id = addressID.address_id;
CREATE VIEW amount AS SELECT country, SUM(amount) AS amount FROM payment, customerID WHERE payment.customer_id = customerID.customer_id GROUP BY country;
SELECT people.country, people, amount FROM people, amount WHERE people.country = amount.country ORDER BY country;