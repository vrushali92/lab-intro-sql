-- 1. Use sakila database.

-- To know the table names.
Show Tables; 

-- 2. Get all the data from tables actor, film and customer.

Select *
FROM actor;

Select *
From film;

Select * 
From Customer;

-- 3. Get film titles.

Select title
From film;

-- 4. Get unique list of film languages under the alias language. 

Select distinct(name) as language
From language;

-- Answer: English, Italian, Japanese, Mandarin, French, German

-- 5.1 Find out how many stores does the company have?

Select count(store_id)
From store;

-- Answer: There are 2 stores.

Select *
From store;

-- There are only 2 rows in store table.

-- 5.2 Find out how many employees staff does the company have?

Select count(*)
From staff;

-- Answer: There are 2 employees

Select *
From staff;

-- There are only 2 rows in staff table.

-- 5.3 Return a list of employee first names only?

Select first_name
From staff;
