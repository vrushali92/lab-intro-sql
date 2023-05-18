Use sakila;

-- 1. Select all the actors with the first name ‘Scarlett’

Select *
From actor
where first_name = "Scarlett";

-- Answer: There are 2 actors with scarlett as first name.

-- 2. How many physical copies of movies are available for rent in the store's inventory? How many unique movie titles are available?

Select distinct count(*)
From film;

Select distinct count(title)
From film;

-- There are 1000 physical copies of movies are available for rent and same number of unique movie title.

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration. 

Select min(length) as shortest_duration, max(length) as longest_duration
From film;

Select * 
from film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?

Select Avg(length) as "Average duration in minutes", 
	   CONCAT(FLOOR(Avg(length)/60),'h ',round(MOD(Avg(length),60)),'m') as "Average duration"
From film;

-- Answer: 1h 55


-- 5. How many distinct (different) actors' last names are there?

Select distinct count(last_name)
From actor;

-- Answer: There are 200 distinct last names.

-- 6. How many days was the company operating? Assume the last rental date was their closing date. (check DATEDIFF() function)

select max(rental_date), 
	   min(rental_date) , 
       DATEDIFF(max(rental_date), min(rental_date)) as operating_days
from sakila.rental;

-- Answer: 266 days

-- 7. Show rental info with additional columns month and weekday. Get 20 results.

Select *, 
	   month(rental_date) as rental_date_month, 
       monthname(rental_date) as rental_date_month_name, 
       weekday(rental_date) as rental_week_day
From rental
order by rental_date
limit 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

Select *,
case when weekday(rental_date) = 5 or weekday(rental_date) = 6 then "weekend"
else "workday"
end as day_type
From rental
order by rental_date;

-- Alternate solution
SELECT *, 
       MONTH(rental_date) AS rental_month, 
       DAYNAME(rental_date) AS rental_weekday,
       CASE WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend' ELSE 'workday' END AS day_type FROM rental
LIMIT 20;

-- 9. Get release years.

Select distinct release_year
From film;

-- Answer: 2006

-- 10. Get all films with ARMAGEDDON in the title.

Select *
from film
where title like "%ARMAGEDD%";

-- Answer: There isnt any film with this title. Hence tried with above query. There is one movie called Armageddon lost.

-- 11. Get all films which title ends with APOLLO.

Select *
from film
where title like "%APOLLO";

-- Answer: There are 5 movies with title ending in APOLLO.

-- 12. Get the 10 longest films.

Select *
From film
order by length desc
limit 10;

-- 13. How many films include Behind the Scenes content?

Select *
From film
where special_features like "%Behind the Scenes%"

-- Answer: There are 538 films with this feature.



