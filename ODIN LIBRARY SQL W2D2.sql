use sql_practice_db;

SELECT * FROM CUSTOMERS;
SELECT * FROM PRODUCTS;
SELECT * FROM ORDERS;
SELECT * FROM ORDERITEMS;
SELECT * FROM EMPLOYEES;


/* 
OPERATORS
ARITHEMATIC OPERATORS(+,_,/,*,%)
COMPARISION OPERATORS(=,<,>,<=,>=,!=)
LOGICAL OPERATORS(AND,OR)
MEMBERSHIP OPERATORS(IN,NOT IN,BETWEEN,NOT BETWEEN)
LIKE OPERATORS

STRING DATATYPE    : CHAR,VARCHAR,text,NVARCHAR
NUMBER DATA TYPES  : INT,DECIMAL(5,2)123.45,TINYINT
DATE DATA TYPES    : DATE,DATE TIME.TIME
BOOLEAN DATATYTPES : 
*/

/*
LIKE OPERATORS -- SHOULD BE USED FOR STRING DATA TYPES ONLY USED FOR PATTERN
MATCHING
*/

-- DISPLAY THE CUSTOMER RECORDS WHICH STARTS WITH MI
SELECT * FROM CUSTOMERS
WHERE FIRSTNAME LIKE 'MI%';
-- GET THE CUSTOMER RECORD WHOSE LAST NAME END WITH SON 
SELECT * FROM CUSTOMERS
WHERE LASTNAME LIKE '%SON';
-- GET THE CUSTOMER DETAILS WHOSE EMAIL HAS NE IN THEIR EMAILID
SELECT * FROM CUSTOMERS 
WHERE EMAIL LIKE '%NE%';
--
SELECT * FROM CUSTOMERS 
WHERE FIRSTNAME  LIKE '_L__';
--
SELECT * FROM CUSTOMERS 
WHERE FIRSTNAME  LIKE '%N%';
--
SELECT * FROM CUSTOMERS 
WHERE FIRSTNAME  LIKE 'JA%NE';

SELECT * FROM CUSTOMERS 
WHERE FIRSTNAME  LIKE '%';
--
SELECT * FROM CUSTOMERS 
WHERE FIRSTNAME  LIKE '________';
--
use mavenmovies;

/*find the films with a rental rate which is not equal to $2.99 or a length less than 120 minutes,but not both.*/
select * from film
where (rental_rate <> 2.99 or length < 120) and not(rental_rate <> 2.99 and length < 120);
/*find the films with a rental rate which is not equal to $2.99 or a length less than 120 minutes.*/
select title, rental_rate,length from film
where rental_rate <> 2.99 or length < 120 ;
-- Find all films where the replacement cost is not $15.99. Table name: film
SELECT * FROM FILM
WHERE  REPLACEMENT_COST != 15.99;
-- Find all films where rental duration is less than 5 days or greater than 7 days. Table name: film
SELECT * FROM FILM
WHERE RENTAL_DURATION < 5 OR RENTAL_DURATION > 7;
-- Find the titles and descriptions of films that are longer than 2 hours (120 minutes) or have a rental rate less than $2.50.
 SELECT TITLE,DESCRIPTION FROM FILM 
 WHERE length > 120 or RENTAL_RATE < 2.50;
 -- List films that do not carry an 'R' rating and do not have a replacement cost less than or equal to $15.99.
 SELECT * FROM FILM
WHERE RATING !='R' AND REPLACEMENT_COST > 15.99;
-- Find all films details from film table where a rental rate is between 2 and 4
select * from film
where rental_rate between 2 and 4;
-- Find all films details from film table where a length is between 90 and 120 minutes and a rental rate less than $4
SELECT * from film 
where (length between 90 and 120) and (rental_rate<4);

-- FUNCTION 
/* 
FUNCTION - a stored piece of code that performs a specific task function takes input called as parameters.  
Functions can be of two types SCALAR and TABLE VALUED FUNCTONS.
Function can be System Defined or User Defined.

string functions
mathematical functions
temporal functions
aggregate functions
*/

select 1;

-- STRING FUNCTIONS

-- CONCAT() -- is a scaler function since it gives only one value
select 'Odin','school';
select concat('Odin','school');
select concat('Odin',' ','school',' ','SQL',' ','Class');
USE sql_practice_db;
select * from customers;
select concat(firstname,lastname) from customers;
select concat(firstname,' ',lastname) from customers;
-- SPACE() -- is a scaler function since it gives only one value
select concat(firstname,space(10),lastname) from customers;
select concat(firstname,space(5),lastname) AS fullname from customers;
select firstname,lastname, concat(firstname,space(1),lastname) AS fullname from customers;
USE MAVENMOVIES;
select CONCAT(customer_id,customer_id) from customer;
/*
IMPLICIT CONVERSIONS
EXPLICIT CONVERSIONS
CAST
*/
-- TRIM -- REMOVES LEADING AND TRAILING SPACES
SELECT TRIM('          ODIN     SCHOOL           '); -- REMOVES BOTH LEADING AND TRAILING SPACES
SELECT LTRIM('          ODIN     SCHOOL           '); -- REMOVES ONLY LEADING SPACES
SELECT RTRIM('          ODIN     SCHOOL           '); -- REMOVES ONLY TRAILING SPACES
-- LENGTH
SELECT LENGTH('       ODIN SCHOOL              '),LENGTH(TRIM('       ODIN SCHOOL              ')),LENGTH(LTRIM('       ODIN SCHOOL              ')),
LENGTH(RTRIM('       ODIN SCHOOL              '));

SELECT CONCAT(TRIM(FIRST_NAME),SPACE(1),TRIM(LAST_NAME)) AS FULLNAME FROM CUSTOMER;
-- LOWER AND UPPER
SELECT LOWER(FIRST_NAME),UPPER(LAST_NAME) FROM CUSTOMER;
SELECT CONCAT(TRIM(LOWER(FIRST_NAME)),SPACE(1),TRIM(UPPER(LAST_NAME))) FROM CUSTOMER;
SELECT CONCAT(TRIM(LOWER(FIRST_NAME)),SPACE(1),TRIM(UPPER(LAST_NAME)),' MR') FROM CUSTOMER;
SELECT * FROM CUSTOMER WHERE LENGTH(FIRST_NAME)>4; -- NAMES WHOSE LENGTH IS GREATER THAN 4
SELECT * FROM CUSTOMER WHERE LENGTH(CONCAT(FIRST_NAME,LAST_NAME))<10;
SELECT * FROM CUSTOMER WHERE CONCAT(FIRST_NAME,LAST_NAME)='ELIZABETHBROWN';
-- POSITION 
SELECT POSITION('D' IN 'ODINSCHOOL');
-- REPLACE
SELECT REPLACE('THIS IS A DC FANCLUB','DC','MARVEL');
SELECT REPLACE(FIRST_NAME,'A','@') FROM CUSTOMER;
SELECT REPLACE(FIRST_NAME,'A','   ') FROM CUSTOMER;
SELECT REPLACE(FIRST_NAME,'A',SPACE(5)) FROM CUSTOMER;
SELECT REPLACE(FIRST_NAME,'A','   ') AS NAME FROM CUSTOMER;
-- SUBSTRING
SELECT SUBSTRING('THIS IS A MARVEL FAN CLUB', 12, 6);
SELECT first_name,SUBSTRING(first_name, 2, 2) from customer;
/*
-- ABC DEF GHI MNO QRS ; GET THE TOTAL LENGTH OF THE STRING WITHOUT SPACES
-- 'ODIN SCHOOL DATASCIENCE' ; SPLIT THIS STRING IN TO THREE COLUMNS USING SUBSTRING FUNCTION HARDCODED POSITION SHOULD NOT BE USED
SUBSTRING
POSTION
LENGTH
*/
