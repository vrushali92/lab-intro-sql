-- 1. In the table actor, which are the actors whose last names are not repeated? 
-- For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. 
-- So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.

Select last_name, count(last_name) as occurrences
From actor
group by last_name
having count(last_name) = 1;

-- Answer: There are 66 last names which are not repeated.

-- 2. Which last names appear more than once? We would use the same logic as in the previous question 
-- but this time we want to include the last names of the actors where the last name was present more than once.

Select last_name, count(last_name) as occurrences
From actor
group by last_name
having count(last_name) > 1
order by count(last_name) desc;

-- Answer: There are 55 last names which are repeated more than once.

-- 3. Using the rental table, find out how many rentals were processed by each employee.

Select staff_id, count(staff_id) as "Processed rentals"
from rental
group by staff_id;

-- Answer: There are 2 staff ids.(Staff id 1 proccessed 8040 and Staff id 2 processed 8004) 

-- 4. Using the film table, find out how many films were released each year.

Select release_year, count(release_year)
From film
group by release_year;

-- Answer: There is single record showing 1000 films were released in 2006.

-- 5. Using the film table, find out for each rating how many films were there.

Select rating, count(rating)
From film
group by rating;

-- Answer: PG = 194, G = 178, NC-17 = 210, PG-13 = 223, R = 195

-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places.

Select rating, round(avg(length), 2) as Average_duration
from film
group by rating;

-- Answer: PG = 112.01, G = 111.05, NC-17 = 113.23, PG-13 = 120.44, R = 118.66

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?

Select rating, round(avg(length), 2) as Average_duration
from film
group by rating
having Average_duration > 120;

-- Answer: Only 1 rating has duration more than 2 hours i.e PG-13

-- 8. Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.

Select title, length, rank() over (partition by length)
From film
where length != Null or length > 0
order by 2;


Select length, sum(length)
from film
group by 1
order by 1;

-- partitioning table by length
Select title, length, sum(length) over (partition by length) as partitioned_length
from film
having sum(length) < 100;
-- order by 2;

Select count(*)
from film
