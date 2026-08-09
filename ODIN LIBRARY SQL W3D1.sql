/* comparision operators -- =,<=.>=,<,>,!=
logical operators -- and, or
range oprators -- between, not between
membership operators -- in .not in
data types
string functions
numeric functions
*/
use mavenmovies;
select * from customer;
select * from customer
where customer_id = 5;
select concat(first_name,space(1),last_name) as customername from customer
where customer_id = 5;

-- ALIAS AS 
-- ALIAS USED IN THE SELECT STATEMENT ONLY
select customer_id as id from customer;
select concat(first_name,space(1),last_name) as customername from customer;

-- MATHEMATICAL FUNCTIONS

-- round --      >=.5 higherlimit  ,   <.5 lowerlimit
select round(4.5);
select round(4.1);
select round(4.9);
select round(4.12349,2);
select round(amount,2) from payment;
-- ceiling -- higher limit
select ceil(4.5);
select ceiling(4.5);
select ceil(amount) from payment;
-- floor -- lower limit
select floor(4.5);
select floor(4.9);
select floor(4.1);
select floor(amount) from payment;
-- power -- base value, power value
select power(2,3);
select power(12.5,3);
select power(12.5346,5.1);
select round(power(12.5,3));
select power(amount,2) from payment;
-- round vs truncate
select round(4.546785,2);
select truncate(4.546785,2);
-- absolute
SELECT -253;
SELECT ABS(-253);
select 300-450;
select ABS(300-450); -- WORKS LIKE A MOD| |
SELECT ABS(TRUNCATE(POWER(AMOUNT,2),2)-(AMOUNT/0.22)) FROM PAYMENT;
SELECT ROUND(ABS(TRUNCATE(POWER(AMOUNT,2),2)-(AMOUNT/0.22)),3) FROM PAYMENT;
SELECT (AMOUNT*100),(AMOUNT*100)*0.2 FROM PAYMENT;
SELECT (AMOUNT*100)-(AMOUNT*100)*0.2 FROM PAYMENT;
SELECT (AMOUNT*100)*0.2-(AMOUNT*100) FROM PAYMENT;
SELECT TRUNCATE(ABS((AMOUNT*100)*0.2-(AMOUNT*100)),2) FROM PAYMENT;
-- find the ceiling values of the sum  of the replace  
/*
DISTINCT -- IS A KEYWORD 
LIMIT -- IS A CLAUSE
 --                                                                --CLAUSES-- 
SELECT<COLUMN>
FROM<TABLE>
WHERE<CONDITION>
GROUPBY<COLUMNS>
HAVING<CONDITION>
ORDER BY<SORTING COLUMNS>
LIMIT<NUMBER OF RECORDS>
*/


-- DISTINCT
-- Distinct always comes after select word
SELECT * FROM PAYMENT;
SELECT DISTINCT CUSTOMER_ID FROM PAYMENT;
SELECT DISTINCT CUSTOMER_ID, AMOUNT, PAYMENT_DATE FROM PAYMENT;
SELECT DISTINCT(CUSTOMER_ID), AMOUNT, PAYMENT_DATE FROM PAYMENT;
SELECT DISTINCT * FROM PAYMENT;
SELECT DISTINCT CUSTOMER_ID,AMOUNT FROM PAYMENT;

-- LIMIT -- LIMITS THE NO OF RECORDS
-- LIMIT is written at the end of the query
SELECT * FROM PAYMENT
LIMIT 5;
SELECT * FROM PAYMENT where amount > 5
LIMIT 10;
SELECT * FROM PAYMENT 
LIMIT 10,20; -- start,no of records
SELECT * FROM PAYMENT 
LIMIT 10,10;
select distinct customer_id from payment
limit 5;
select * from customer where first_name like 'A%';
select distinct first_name from customer where first_name like 'A%';
select distinct first_name from customer where first_name like 'A%'
limit 5;
select distinct first_name from customer where first_name like 'A%'
limit 10,2;
select distinct first_name from customer where first_name like 'A%'
limit 3,2;
select distinct first_name from customer where first_name like 'A%'
limit 1,2;

-- ORDER BY
select distinct first_name from customer where first_name like 'A%'
ORDER  BY FIRST_NAME ASC;
select distinct first_name from customer where first_name like 'A%'
ORDER BY FIRST_NAME DESC;
select distinct first_name from customer where first_name like 'A%'
ORDER BY FIRST_NAME;
select distinct first_name from customer where first_name like 'A%'
ORDER BY FIRST_NAME
LIMIT 5;
select distinct first_name from customer where first_name like 'A%'
ORDER BY FIRST_NAME DESC 
LIMIT 5;
select AMOUNT FROM PAYMENT
ORDER BY AMOUNT DESC;
select DISTINCT AMOUNT FROM PAYMENT
ORDER BY AMOUNT DESC;
select DISTINCT AMOUNT FROM PAYMENT
ORDER BY AMOUNT DESC
LIMIT 3;
SELECT * FROM CUSTOMER;
SELECT CUSTOMER_ID,FIRST_NAME,LAST_NAME FROM customer
ORDER BY FIRST_NAME;
SELECT * FROM PAYMENT;
SELECT CUSTOMER_ID,AMOUNT,PAYMENT_ID FROM PAYMENT
ORDER BY CUSTOMER_ID;
SELECT CUSTOMER_ID,AMOUNT,PAYMENT_ID FROM PAYMENT
ORDER BY CUSTOMER_ID,AMOUNT;
SELECT CUSTOMER_ID,AMOUNT,PAYMENT_ID FROM PAYMENT
ORDER BY CUSTOMER_ID ,AMOUNT ,PAYMENT_ID DESC;
/*
USE DISTINCT,ORDER BY ONLY WHEN NECESSARY
USE ORDER BY CLAUSE FOR 1,2,3, columns if needed
*/

-- TEMPORAL FUNCTIONS OR DATE FUNCTIONS
SELECT SYSDATE(); -- IT GIVES PRESENT DATE AND TIME
SELECT CURRENT_DATE(); -- IT GIVES PRESENT DATE ONLY
SELECT MONTH(SYSDATE());
SELECT MONTH('2022-05-15');
SELECT MONTH(PAYMENT_DATE) FROM PAYMENT;
SELECT MONTH(PAYMENT_DATE) FROM PAYMENT
WHERE MONTH(PAYMENT_DATE) = 5; 
SELECT * FROM PAYMENT
WHERE MONTH(PAYMENT_DATE) = 5; -- GIVES ALL INFORMATION ABOUT 5 TH MONTH FROM ALL THE YEARS

SELECT DAY('2022-05-15');
SELECT MONTH('2022-05-15');
SELECT YEAR('2022-05-15');

SELECT DAYNAME('2022-05-15');
SELECT MONTHNAME('2022-05-15');

-- EXTRACT
SELECT EXTRACT(MONTH FROM '2022-05-15');
SELECT EXTRACT(DAY FROM '2022-05-15');
SELECT EXTRACT(YEAR FROM '2022-05-15');

-- 2005
SELECT * FROM PAYMENT
WHERE YEAR(PAYMENT_DATE) = 2005;
-- AUGUST
SELECT * FROM PAYMENT
WHERE MONTH(PAYMENT_DATE) = 8;
-- 20TH AUGUST TO 30TH AUGUST
SELECT * FROM PAYMENT
WHERE MONTH(PAYMENT_DATE) =8 AND DAY(PAYMENT_DATE) BETWEEN 20 AND 30
ORDER BY PAYMENT_DATE ASC;
SELECT * FROM PAYMENT 
WHERE PAYMENT_DATE BETWEEN '2005-08-20' AND'2005-08-31'
ORDER BY PAYMENT_DATE ASC;

/*
ORDER OF EXECUTION
FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
LIMIT
*/
-- GET THE REVENUE DETAILS FROM THE PAYMENT TABLE FOR THE MONTH OF JUNE AND FOR THE YEARS FROM 2005 TO 2008

-- DATE_ADD
-- DATEDIFF
SELECT DATE_ADD(SYSDATE(),INTERVAL 30 DAY);
SELECT DATE_ADD(SYSDATE(),INTERVAL 3 MONTH);
SELECT DATE_ADD(SYSDATE(),INTERVAL 1 YEAR);

SELECT DATE_ADD(SYSDATE(),INTERVAL -1 YEAR);
SELECT DATE_ADD(SYSDATE(),INTERVAL -3 MONTH);
-- DATEDIFF -- GIVES THE DIFERENCE BETWEEN TO DATES
SELECT DATEDIFF('2023-01-01','2022-01-01');
SELECT DATEDIFF('2023-01-01','2022-01-01')/30;-- GIVES MONTHS
SELECT ROUND(DATEDIFF('2023-01-01','2022-01-01')/30);

SELECT DATEDIFF('2022-01-01','2023-01-01');
SELECT DATEDIFF('2022-01-01','2023-01-01')/30;-- GIVES MONTHS
SELECT ABS(ROUND(DATEDIFF('2022-01-01','2023-01-01')/30)); 




















