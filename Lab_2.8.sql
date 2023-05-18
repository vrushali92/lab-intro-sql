-- 1. Write a query to display for each store its store ID, city, and country.

Select s.store_id as "Store ID",
	   c.city as "City",
       cy.country as "Country"
From sakila.store as s
inner join sakila.address as a
using(address_id)
inner join sakila.city as c
using(city_id)
inner join sakila.country as cy
using(country_id);

SELECT d.store_id, d.address, d.city, country.country FROM country
JOIN (SELECT b.store_id, b.address, c.city, c.country_id FROM city c
JOIN (SELECT s.store_id, a.address, a.city_id FROM store s 
JOIN address a
ON s.address_id = a.address_id) b
ON (b.city_id = c.city_id)) d ON (d.country_id = country.country_id);

-- Answer: 
-- '1', 'Lethbridge', 'Canada'
-- '2', 'Woodridge', 'Australia'

-- 2. Write a query to display how much business, in dollars, each store brought in. (Assumming amount is in $)

-- payment ->  staff -> store

Select st.store_id as "Store ID", 
	   concat("$", " ", round(sum(p.amount) ,2)) as "Total amount"
From payment as p
inner join staff as s
on p.staff_id = s.staff_id
inner join store as st
on st.store_id = s.store_id
group by st.store_id;

-- 3. Which film categories are longest?

Select c.name, sum(f.length) as "Total duration in mins", CONCAT(FLOOR(sum(length)/60),'h ',round(MOD(sum(length),60)),'m') as "Total duration"
From category as c
inner join film_category as fc
on c.category_id = fc.category_id
inner join film as f
on f.film_id = fc.film_id
group by 1
order by 2 desc;

-- 4. Display the most frequently rented movies in descending order.

Select f.title, COUNT(f.title) as rentals 
From film AS f 
inner join inventory AS i
on i.film_id = f.film_id
inner join rental AS r
on i.inventory_id = r.inventory_id
group by f.title 
order by 2 DESC;

-- 5. List the top five genres in gross revenue in descending order.

Select c.name, SUM(p.amount) AS "gross revenue"
From category c
inner join film_category fc
on c.category_id = fc.category_id
inner join inventory i
on i.film_id = fc.film_id
inner join rental r
on r.inventory_id = i.inventory_id
inner join payment p
on p.rental_id = r.rental_id
group by c.name
order by 2 desc
limit 5;

-- 6. Is "Academy Dinosaur" available for rent from Store 1?
-- film ->inventory ->store

Select s.store_id, f.title
From film as f
inner join inventory as i
on f.film_id = i.film_id
inner join store as s
on s.store_id = i.store_id
where f.title like "%Academy Dinosaur%"
and s.store_id = 1;

-- Answer: 4 copies are available.

-- 7. Get all pairs of actors that worked together.

Select f1.actor_id, f1.film_id, f2.actor_id, f2.film_id, f1.last_update
from film_actor as f1
inner join film_actor as f2
on f1.film_id = f2.film_id
and f1.actor_id <> f2.actor_id;







