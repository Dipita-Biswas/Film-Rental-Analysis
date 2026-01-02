
USE sakila;
DROP TABLE IF EXISTS film_summary;
CREATE TABLE film_summary AS
SELECT 
	YEAR(r.rental_date) AS rental_year,
    MONTH(r.rental_date) AS rental_month,
    f.film_id,
    f.title,
    fc.category_id,
    c.name AS category_name,
    COUNT(r.rental_id) AS total_rentals,
    ROUND(SUM(p.amount), 2) AS total_revenue,
    AVG(DATEDIFF(r.return_date, r.rental_date)) AS avg_rental_duration,
    f.replacement_cost,
    a.actor_count,
    cn.country AS rental_country,
    ct.city AS rental_city
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
LEFT JOIN payment p ON r.rental_id = p.rental_id
LEFT JOIN (
    SELECT fa.film_id, COUNT(fa.actor_id) AS actor_count
    FROM film_actor fa
    GROUP BY fa.film_id
) a ON f.film_id = a.film_id
JOIN customer cu ON r.customer_id = cu.customer_id
JOIN address ad ON cu.address_id = ad.address_id
JOIN city ct ON ad.city_id = ct.city_id
JOIN country cn ON ct.country_id = cn.country_id
GROUP BY rental_year, rental_month, f.film_id, f.title, fc.category_id, c.name, 
         f.replacement_cost, a.actor_count, cn.country, ct.city;


SELECT * FROM film_summary;

SELECT * FROM film_summary
WHERE category_name <> 'action';

SELECT category_name, COUNT(*)
FROM film_summary
GROUP BY category_name;

-- query 1 Top 5 Most Profitable Categories

SELECT category_name, SUM(total_revenue) AS total_earnings
FROM film_summary
GROUP BY category_name
ORDER BY total_earnings DESC
LIMIT 5;

-- query 2 Top 10 films that generated the highest total revenue
SELECT title, category_name, total_revenue
FROM film_summary
ORDER BY total_revenue DESC
LIMIT 10;

-- query 3 Actors that have starred in the most high-revenue films
SELECT fa.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS num_films, SUM(fs.total_revenue) AS total_earnings
FROM film_actor fa
JOIN actor a ON fa.actor_id = a.actor_id
JOIN film_summary fs ON fa.film_id = fs.film_id
GROUP BY fa.actor_id, a.first_name, a.last_name
ORDER BY total_earnings DESC
LIMIT 10;


-- query 4 Top cities that rent the most films

SELECT rental_city, SUM(total_rentals) AS total_rentals
FROM film_summary
GROUP BY rental_city
ORDER BY total_rentals DESC
LIMIT 10;



-- query 5: most rented film in each category?
SELECT fs1.category_name, fs1.title, fs1.total_rentals
FROM film_summary fs1
JOIN (
    SELECT category_name, MAX(total_rentals) AS max_rentals
    FROM film_summary
    GROUP BY category_name
) fs2 
ON fs1.category_name = fs2.category_name AND fs1.total_rentals = fs2.max_rentals;



-- query 6 highest-grossing film in each category
SELECT fs1.category_name, fs1.title, fs1.total_revenue
FROM film_summary fs1
JOIN (
    SELECT category_name, MAX(total_revenue) AS max_revenue
    FROM film_summary
    GROUP BY category_name
) fs2 
ON fs1.category_name = fs2.category_name AND fs1.total_revenue = fs2.max_revenue;


-- query 7 Countries Generating Highest Revenue
SELECT rental_country, SUM(total_revenue) AS revenue
FROM film_summary
GROUP BY rental_country
ORDER BY revenue DESC
LIMIT 10;

-- query 8 if higher-cost films generate more revenue.
SELECT 
    CASE 
        WHEN replacement_cost < 10 THEN 'Low Budget (<$10)'
        WHEN replacement_cost BETWEEN 10 AND 20 THEN 'Mid Budget ($10-$20)'
        ELSE 'High Budget (>$20)'
    END AS budget_category,
    COUNT(film_id) AS num_films,
    SUM(total_revenue) AS total_revenue
FROM film_summary
GROUP BY budget_category
ORDER BY total_revenue DESC;

