Use sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT  c.name, count(*) as "Total films"
FROM sakila.category c
JOIN sakila.film_category f
ON c.category_id = f.category_id
group by c.name;

-- 2. Display the total amount rung up by each staff member in August of 2005.

Select s.staff_id as "Staff ID",  
	   s.first_name as "First name",  
       s.last_name as "Last name",   
       sum(p.amount) as "Total amount collected"
From staff as s
inner join payment as p
on s.staff_id = p.staff_id
and payment_date like "2005-08%"
group by 1, 2, 3;

-- Answer: staff id 1 = 11,853 and staff is 2 = 12,216

-- 3. Which actor has appeared in the most films?

Select a.first_name  as "First name",  
	   a.last_name  as "Last name",  
       count(f.actor_id) as "Number of films"
from actor as a
inner join film_actor as f
on a.actor_id = f.actor_id
group by 1, 2
order by 3 desc;

-- Answer: Susan Davis = 54 films

-- 4. Most active customer (the customer that has rented the most number of films)

Select c.first_name  as "First name",  
	   c.last_name  as "Last name", 
       count(r.rental_id) as "Number of films rented"
From customer as c
inner join rental as r
on c.customer_id = r.customer_id
group by 1, 2
order by 3 desc;

-- Answer: Eleanor Hunt = 46 films

-- 5. Display the first and last names, as well as the address, of each staff member.

Select s.first_name as "First name", 
	   s.last_name as "Last name", 
       concat(a.address, ", ", a.district, ", ", c.city, a.postal_code) as Address
From staff as s
inner join address as a
on s.address_id = a.address_id
inner join city as c
on c.city_id = a.city_id;

-- Answer: 1. Mike Hillyner, '23 Workhaven Lane' 2. Jon, Stephens '1411 Lillydale Drive'

-- 6. List each film and the number of actors who are listed for that film.

Select f.film_id, 
	   f.title, 
       count(fa.actor_id) as "Total films"
From film as f
left join film_actor as fa
on f.film_id = fa.film_id
group by 1, 2
order by 3;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

Select c.customer_id, 
	   c.first_name, 
       c.last_name, 
       sum(p.amount) as "Total amount"
From customer as c
left join payment as p
on c.customer_id = p.customer_id
group by 1, 2, 3
order by 3;

-- 8. List number of films per category.

Select c.name, count(fc.film_id) as  "Total films"
from film_category as fc
inner join category as c
on fc.category_id = c.category_id
group by 1;