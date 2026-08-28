  --   AGREGATE FUNCTIONS
  -- avg , sum , min, max, count
  
select * from payment;
select sum(amount) as sum from payment;
select avg(amount) as avg from payment;
select min(amount) as min from payment;
select max(amount) as max from payment;
select sum(amount) as sum , avg(amount) as avg,min(amount) as min ,max(amount) as max from payment;-- all in single output
-- using alias
select sum(amount) as sum from payment;
select avg(amount) as avg from payment;
select min(amount) as min from payment;
select max(amount) as max from payment;
select sum(amount) as sum , avg(amount) as avg,min(amount) as min ,max(amount) as max from payment;-- all in single output

-- GROUP BY is used only for aggregate functions

select sum(amount) as sum ,
       avg(amount) as avg,
       min(amount) as min,
       max(amount) as max 
from payment
WHERE customer_id =1 ;

select sum(amount) as sum ,
       avg(amount) as avg,
       min(amount) as min,
       max(amount) as max 
from payment
WHERE customer_id between 1 and 16049;  -- it gives sum,min,max,avg combined for all these customer_id combined


select sum(amount) as sum ,
       avg(amount) as avg,
       min(amount) as min,
       max(amount) as max 
from payment
WHERE customer_id in(1,2,3,4,5); -- it gives sum,min,max,avg combined for all these customer_id combined

-- PER CUSTOMER ID GIVE ME sum,avg,max,min in single output
select customer_id,
       sum(amount) as total_amount ,
       avg(amount) as avg,
       min(amount) as min,
       max(amount) as max 
from payment
group by customer_id;
-- arrange customer_id in desc order based on total amount per customer_id
select customer_id,
       sum(amount) as total_amount 
from payment
group by customer_id
order by total_amount desc ;
-- top 10 highest paying customer_id
select customer_id,
       sum(amount) as total_amount 
from payment
group by customer_id
order by total_amount desc
limit 10 ;
-- top 10 least paying customer_id
select customer_id,
       sum(amount) as total_amount 
from payment
group by customer_id
order by total_amount 
limit 10 ;
-- or
select customer_id,
       sum(amount) as total_amount 
from payment
group by customer_id
order by total_amount asc
limit 10 ;


-- how many movies are there in each rating

 select  * from film;
 
 select rating,
       count(film_id) as number_of 
from film
group by rating ;  

-- how many movies are there in each rating in desc order
select rating,
       count(film_id) as number_of 
from film
group by rating
order by number_of desc ;  

-- how many movies are there in each rating top 10 by number of films    
select rating,
       count(film_id) as number_of 
from film
group by rating
order by number_of desc
limit 10;   

-- total amount collected by each staff 
select staff_id,
       sum(amount) as total_amount 
from payment
group by staff_id;

select customer_id,
       staff_id,
       sum(amount) as total_amount 
from payment
group by staff_id , customer_id;

-- HAVING 
-- CUSTOMER_IDS WHOSE TOTAL AMOUNT GREATER THAN 200
SELECT 
    customer_id, SUM(amount) AS total_amount
FROM
    payment
GROUP BY customer_id
HAVING total_amount > 200;

-- USING WHERE, GROUPBY, HAVING IN ONE QUERY
-- IN CUSTOMER_IDS 1 TO 7  WHOSE TOTAL AMOUNT GREATER THAN 100
SELECT 
    customer_id, SUM(amount) AS total_amount
FROM
    payment
WHERE 
    CUSTOMER_ID IN(1,2,3,4,5,6,7)
GROUP BY customer_id
HAVING total_amount > 100;

SELECT 
    customer_id, SUM(amount) AS total_amount
FROM
    payment
WHERE 
    CUSTOMER_ID BETWEEN 1 AND 7
GROUP BY customer_id
HAVING total_amount > 100
ORDER BY TOTAL_AMOUNT;

SELECT CUSTOMER_ID,COUNT(AMOUNT)
FROM PAYMENT
GROUP BY CUSTOMER_ID;
-- HOW MANY CUSTOMERS MADE GREATER THAN 30 PAYMENTS
SELECT CUSTOMER_ID,COUNT(AMOUNT) AS NO_OF_PAYMENTS
FROM PAYMENT
GROUP BY CUSTOMER_ID
HAVING NO_OF_PAYMENTS > 30;

SELECT YEAR(PAYMENT_DATE) AS YEAR, 
        MONTH(PAYMENT_DATE) AS MONTH,
        SUM(AMOUNT) AS TOTAL_SALES
FROM PAYMENT
GROUP BY YEAR,MONTH;

-- WITH ROLLUP -ROLLUP is an extension of the GROUP BY clause in SQL that generates hierarchical subtotals (aggregates) along with a grand total in a single query. It helps in summarizing data at multiple levels of aggregation.
SELECT CUSTOMER_ID,COUNT(AMOUNT) AS NO_OF_PAYMENTS
FROM PAYMENT
GROUP BY CUSTOMER_ID 
WITH ROLLUP;

SELECT CUSTOMER_ID,COUNT(AMOUNT) AS NO_OF_PAYMENTS
FROM PAYMENT
WHERE CUSTOMER_ID BETWEEN 1 AND 5
GROUP BY CUSTOMER_ID 
WITH ROLLUP;

SELECT YEAR(PAYMENT_DATE) AS YEAR, 
        MONTH(PAYMENT_DATE) AS MONTH,
        SUM(AMOUNT) AS TOTAL_SALES
FROM PAYMENT
GROUP BY YEAR,MONTH WITH ROLLUP;


-- ---------------------------------------------------------------odin labs --------------------------------------------------------------------------
-- Write a query to find the total number of films acted by each actor grouped by the film rating.
select actor_id,rating,count(*)
from film_actor
inner join film on film_actor.film_id = film.film_id
group by film_actor.actor_id,film.rating
order by actor_id;

-- find the total count for each distinct actor i.e. find the total number of films each actor has acted along with the count of different ratings.
select actor_id,rating, count(*) from 
film_actor inner join film 
on film_actor.film_id = film.film_id
group by actor_id, rating
order by count(*) desc; -- vvimp
-- all the columns in the select statement should also be in groupby also while writing group by clause

-- Using roll up, modify the above query to find the total count for each distinct actor i.e. find the total number of films each actor has acted along with the count of different ratings.
select actor_id,rating, count(*) from 
film_actor inner join film 
on film_actor.film_id = film.film_id
group by actor_id, rating with rollup
order by 1,2;
-- or
select actor_id,rating, count(*) from 
film_actor inner join film 
on film_actor.film_id = film.film_id
group by actor_id, rating with rollup
order by actor_id,rating;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------SUB QUERIES----------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------------------------
-- SUBQUERY -a query within a query or a select statement inside another select statement
-- subquery is written in these places where,from,select,having

-- find the films which have a rental rate higher than average rental rate

select * from film; -- this gives all columns in film table

select rental_rate from film; -- this gives rental_rate column from film table

select avg(rental_rate) from film;  -- this gives avg rental rate 
 
select rental_rate from film
where rental_rate > 2.980 ; -- this gives the rental rate greater than 2.980 (which is the avg rental_rate)

select rental_rate from film
where rental_rate > (select avg(rental_rate) from film) ; -- by replacing 2.980 with query that gives avg rental rate we use subquery to get those rental rates which are greater than avg rental rate

-- subqueries 
-- non correlated subquery
-- correlated subqueries

-- Write a query that returns all cities that are in India or Pakistan

select city_id,city from city
where country_id in 
(select country_id from country  
where country = "pakistan" or country = "india");
-- or
select city_id,city from city
where country_id in 
(select country_id from country  
where country in( "pakistan","india"));

-- Write a query to find all customers who have never gotten a free film rental. (ie the zero amount paid for a rental). Use the all operator.
select first_name,last_name from customer
where customer_id <> all
(select customer_id from payment 
where amount = 0);

/* this is not correct
select first_name,last_name from customer
where customer_id in
(select customer_id from payment
where amount > 0);

select first_name,last_name from customer
where customer_id in
(select customer_id from payment);

*/
-- all
   