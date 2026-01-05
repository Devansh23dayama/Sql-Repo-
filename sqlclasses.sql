-- comments( used in sql )

-- case insensitive langusge 
-- DDl data defination langugae 
-- DML data amnupulation language 
-- DCL Data control language 
-- TCl Transaction Control language 
-- DQL Data Query Language 

-- To show the Database 
show databases;

-- To create a database 
create database tata;

-- to use database 
use tata;

-- to see tables in specified Database 
show tables;

-- to create table 
create table nexon(price int , color char(20) );
show tables;



-- now will take random database to learn DQL 
-- download world db from chrome and use file and click on select sql script 

use world;
Show tables;

-- describe _table name ; to describe the column
describe country; 

-- to print the columns ---> * =for all table 
select * from country;
-- this command is for specific column 
select name , population , region from country ; 
-- these changes will not done in gthe database because it is only printing the details(population-500)
select name , population , region,population-500 from country ; 
-- data is fetch in sql row by row 
select * from country;
-- for data filter we use Where 
select * from country where continent= 'Asia'; 
select * from country where indepyear=1984;
/*
 Assigenment 1 --> what is db ,
					file system v/s dbms ,
                    dbms v/s rdbms,
                    type of dbms and write a brief about it .
*/

-- operators in SQL
select * from country where indepyear >= 1947;
use world;
select * from country where indepyear >= 1947;

show tables;

-- while giving "WHERE" we should use '' for String and for integer no quotes are requred
select * from country where continent='Asia';
select * from country where indepyear=1991;
select name,continent from country where indepyear=1991;


-- in operator use to find values which match to it --> in (x,x,x)
select * from country where continent in ('Africa' , 'Asia');
select * from country where continent not in ('Africa' , 'Asia');
select * from country where indepyear in(1960,1991);
select * from country where indepyear not in(1960,1991);


-- between operator is use to find values between them including given values 
-- syntax between values1 and value2
-- isse inke bech ki value milegi aur jo value di h vo bhi milegi 
select * from country where indepyear between 1960 and 1991;
select * from country where indepyear not between 1960 and 1991;


-- Q1 
select name,continent from country where continent not in ('Southern Europe')  ;

-- Q2
select name,continent ,population ,population+(0.1*population) as '10%' from country;

-- Q3
select * from country where LifeExpectancy in (75.1,77.8,63.7);

-- Q4
select name ,population , region from country where population not between 5000 and 300000;
/*
-- like operator 
match a pattern 
name => letter start , letter include , letter end 
special characters => %(wildcard charcter) zero or more character
%a -last word a hona chiye
a% - starting a hona chiye 
%a% - puri string me a kahi bhi ho   
*/
select * from country  where name like '%ra%';
select * from country  where name not like '%ra%';

/*
(underScrore ) : only  1 character 
*/

select * from country where name like '____';
select * from country where name like '_u__';
select * from country where name like '_u%';
select * from country where name like '__u%a%_';

-- Q1
select name , continent from country where continent like 'n%';

-- Q2 
select name , continent from country where continent like '%p_';

-- Q3
select name ,continent from country where continent like '____';

-- Q4
select name , continent,region  from country where region like '_a%a_';

-- Q5
select name ,continent,region from country where region like'__c%sia'; 

-- Q6
select name,region,continent from country where continent in('North America','South America');

-- concat_ws('$',name,code) from country;
-- concat(name,code)
select name,code,concat(name,'$',code),concat_ws('$',name,code,'dev') from country;


select name,code,concat(name,' ',code) from country where concat(name,' ',code)='Afghanistan AFG';

select name,region,continent from country where region like concat('%',continent);

select * from country where name=region ;
-- to take out first character of string 
-- left(name,1)

select name , continent, population from country where left(continent,1)=left(name,1);  



-- functions String 
-- select name,substr(name,2) from country;
select name,substr(name,2) from country;
use world;
select name,substr(name,2) from country;

-- substr(name,2,4)
select name,substr(name,2,4) from country;

-- substr(name-1,4)
select name,substr(name,-2,4) from country;

select name ,continent ,substr(name,1,1),substr(continent,1,1)from  country where substr(name,1,1)=substr(continent,1,1);
select name ,population ,substr(name,1,3) from country where substr(name,1,3)='ALG';


-- select name,instr(name,'e') from country 
-- return first occurance of character.
select name,instr(name,'e') from country ;

-- select name , char_length(name) from country;--> return characters length 
select name , char_length(name) from country;

-- trim
select char_length('       devansh         ');
select trim('       devansh         ');
select char_length(trim('       devansh         '));

-- rtrim -->remove right side spaces 
-- ltrim -->remove left side spaces 


SELECT 
    name, TRIM(BOTH 'a' FROM TRIM(BOTH 'A' FROM name))
FROM
    country;


-- lpad and rpad 
select name,population
-- when we want to define a column with fixed size 

-- select name , population ,rpad(population,5,#) from country;
-- numeric Functions 
-- 1. round()
use world;
select lifeexpectancy,round(lifeexpectancy) from country;
select 30.68,round(30.68,1);
select 5000.0000 , round(457.68,1),truncate(3653.68,1);

-- add date function => default date add,(month ,year ,time )
select now() , current_timestamp(),current_date(),current_time();

-- aggregate function ,what are relationships in SQL



/* ! classs left */










use world;
select sum(population) from country ;
-- where 
select continent, count(name) from country group by continent;
select count(name) from country Where continent ='Asia' and indepyear<1950;
select continent ,count(name) from country where indepyear>1950 group by continent;
select continent ,count(name) from country where count(name)>30 group by continent;  -- wrong due to down given point 
-- where me vo hi data filter hoga jo aapki physical table me present hoga 


-- having hamesha aggregating function ke uapr lagta h 
select continent , count(name) from country  group by continent  having count(name)> 30;


--  Q in each continent  total population

select continent ,sum(population)  from country group by continent;

-- total population is greater than 100 

select continent ,sum (population) from country group by continent having 
sum(population) >300000; 

select indepyear,count(name) from country where indepyear >1930 group by indepyear ;
select indepyear , count (name ) from country where indepyear> 1930 group by indepyear having count(name) > 2;


-- Q  you need to get govt form and the total no coubntry for each govy form whwere the total no country should be greater thAN 20 
-- Q  you need to get govt form and the total no coubntry for each govy form where the country should capital greater than 30  
-- Q  get the no of country and  regions with the total population where the life expenteancy shouuld be greater than 38 and populatiopn in each continent should be greater than 3 lakh 
select * from country  ;
select GovernmentForm,count(name) from country group by GovernmentForm having count(name)> 20 ;

select GovernmentForm , count(name) from country  Where capital > 30 group by GovernmentForm;
select continent, count(name) , count(region) ,sum(population) from country where lifeExpectancy >38 group by continent having sum(population ) > 300000;



-- Structure :- how to organize 

-- types :- 1--> conceptual-> Entity and Attribute 
           -- 2-->  Logical --> conceptual + Relationship 
           -- 3-->  Physical--> physical ,table ,column 
           
           
           /*
           Types of relationship 
          1. one to one 
          2. one to many 
          3. many to one 
		  4.many to many 
           
           
           Primary key uniquely identifies records in a table.(no null ,no redundancy)
           foreign key connects one table to another by referencing the primary key.(can be null and redundancy possible)
         
                          (foriegn key )                   (primarykey)
           oid   producct  cid                                     cid cname
           101    A
           102    B
           103    C
           103    A
           104    D
           104    E
           104    F
           
           
           */
			

             use world ;
             -- city table ID is my primary key , and country code is the foriegn key 
             select * from city;
             describe city;
             select count(code),count(distinct code) from country ;
             
             
             -- join is use to connect two tables in SQL
             -- use to create alias name
             
             select cy.id,cy.name,cy.countrycode ,cnt.code,cnt.name,cnt.continent from city as cy 
             join country as cnt where cy.countrycode= cnt.code;
             
             
             
             select cnt.code,cnt.name,cnt.continent from country as cnt;
             
             
             -- find the city name ,population ,country name along with the govt form  for each city 
             desc city ;
             select ct.name ,ct.population,ctry.name,ctry.governmentform  from city as ct
             join
             country as ctry
             where ct.countrycode=ctry.code;
             select ctry.name,ctry.governmentform from country as ctry;
             
             
             -- get the country nmae ,population and the language spoken with percentage of each langugae 
             desc country;
             select ctry.name,ctry.population,clang.language,clang.percentage from country as ctry
             join 
             countrylanguage as clang where
             ctry.code=clang.countrycode;
             
             
             select clang.language,clang.percentage from countrylanguage as clang;
             
             
             
             
             
             
use sakila;
select * from actor ;
select * from film_actor;
select count(distinct film_id),count(distinct actor_id) from film_actor;
select count(film_id),count(distinct film_id) from film_actor;
select count( actor_id),count(distinct actor_id) from film_actor;


select a.first_name,a.actor_id from actor as a join film_actor as fa
where a.actor_id=fa.actor_id;
desc Film_actor;
select fa.film_id,fa.actor_id,f.film_id,f.title from film_actor as fa join film as f where fa.film_id = f.film_id;

-- actor name ,in which movie he work 
select * from film_actor;
desc film_actor;
select * from film;

-- what are inner joins ,what are outer joins types of outer joins --> learning assignment 
select * from actor;
             
             CREATE DATABASE REGEX;
USE REGEX;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);


INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'Los Angeles'),
(3, 'Charlie', 'Chicago'),
(4, 'David', 'Houston'),
(5, 'Eva', 'Phoenix'),
(6, 'Frank', 'Philadelphia'),
(7, 'Grace', 'San Antonio'),
(8, 'Henry', 'San Diego'),
(9, 'Ivy', 'Dallas'),
(10, 'Jack', 'San Jose');


INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(101, 1, '2024-01-05', 250.00),
(102, 2, '2024-01-06', 150.00),
(103, 3, '2024-01-07', 300.00),
(104, 1, '2024-01-10', 120.00),
(105, 5, '2024-01-12', 450.00),
(106, 6, '2024-01-15', 200.00),
(107, 2, '2024-01-18', 175.00),
(108, 8, '2024-01-20', 500.00),
(109, 11, '2024-01-22', 90.00),
(110, 12, '2024-01-25', 60.00);
             
             
             select c.customer_id,c.customer_name,o.amount,o.order_date from customers as c 
             inner join orders as o on c.customer_id = o.customer_id;  
             -- ineer join where some colums are common in both 
             
             -- new syntax for inner join 
             select c.customer_id,c.customer_name,o.amount,o.order_date from customers as c 
             inner join orders as o on c.customer_id = o.customer_id;  
             -- in this in place of where ---> on is there
             
             
             -- left outer join 
             select c.customer_id,c.customer_name ,o.order_id,o.amount ,o.customer_id from customers as c left join orders as o  on customer_id= o.customer_id;
             
             -- right outer join 
             select c.customer_id,c.customer_name ,o.order_id,o.amount ,o.customer_id from customers as c right join   orders as o  on c.customer_id= o.customer_id;
             
             -- natural join 
             -- no condition is define here , on common column join will be done 
          
             
             alter table customers rename column customer_id to cid ;
             
             desc customers;
   -- in natural join if it did't find any common column then there will be cross join (many to many )
   alter table customers rename column cid to customer_id ;
   
   
select a.actor_id,a.first_name ,count(f.film_id) from actor as a join film_actor as f where a.actor_id =f.actor_id group by actor_id;


-- what is normaization in sql 
-- super key ,primary key , candidate key 
-- what is 1 nf ,2nf , 3nf
-- outer joins and self joins 








use regex;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    major VARCHAR(50)
);

INSERT INTO students (student_id, student_name, major) VALUES
(1, 'Aarav', 'Computer Science'),
(2, 'Bhavya', 'Mathematics'),
(3, 'Chetan', 'Physics'),
(4, 'Diya', 'Computer Science'),
(5, 'Esha', 'Mathematics'),
(6, 'Farhan', 'Physics'),
(7, 'Gauri', 'Computer Science'),
(8, 'Harsh', 'Mathematics'),
(9, 'Isha', 'Physics'),
(10, 'Jay', 'Computer Science'),
(11, 'Kiran', 'Mathematics'),
(12, 'Leena', 'Physics'),
(13, 'Manav', 'Computer Science'),
(14, 'Neha', 'Mathematics'),
(15, 'Om', 'Physics'),
(16, 'Pooja', 'Computer Science'),
(17, 'Qadir', 'Mathematics'),
(18, 'Riya', 'Physics'),
(19, 'Sahil', 'Computer Science'),
(20, 'Tina', 'Mathematics');


CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(50),
    credits INT
);

INSERT INTO enrollments (enrollment_id, student_id, course_name, credits) VALUES
(101, 1, 'Data Structures', 4),
(102, 1, 'Algorithms', 4),
(103, 2, 'Linear Algebra', 3),
(104, 3, 'Quantum Mechanics', 4),
(105, 4, 'Operating Systems', 4),
(106, 5, 'Statistics', 3),
(107, 6, 'Electromagnetism', 4),
(108, 7, 'Databases', 4),
(109, 8, 'Probability', 3),
(110, 9, 'Thermodynamics', 4),
(111, 10, 'Computer Networks', 4),
(112, 11, 'Calculus II', 3),
(113, 12, 'Optics', 4),
(114, 13, 'Machine Learning', 4),
(115, 14, 'Discrete Math', 3),
(116, 15, 'Nuclear Physics', 4),
(117, 16, 'Software Engineering', 4),
(118, 17, 'Numerical Methods', 3),
(119, 18, 'Solid State Physics', 4),
(120, 1, 'Artificial Intelligence', 4);
 
 
 select s.student_name,s.student_id,e.enrollment_id,e.course_name from students as s join enrollments as e where s.student_id=e.student_id;
 
 -- student detail wheather they have enroll or not 
 select s.student_name,s.student_id,e.enrollment_id,e.course_name from students as s left join enrollments as e 
 on s.student_id=e.student_id where enrollment_id is null;
 
 select s.student_id ,s.student_name,count(e.enrollment_id)from students as s join enrollments as e on s.student_id=e.student_id 
 group by student_id;
 
 select s.student_id ,s.student_name,count(e.enrollment_id)from students as s join enrollments as e on s.student_id=e.student_id 
  group by student_id having count(e.enrollment_id)>2;
  
  select count(student_id), major from students group by major;
 
 select sum(e.credits), s.major from students as s join enrollments as e  where s.student_id= e.student_id group by s.major;
 
 
 -- write a sql query to group students by the length of there names and show the count of students in each group ;
 
 
 select char_length(student_name),count(student_id) from students group by char_length(student_name);
 
-- find  no of courses enroll in each group name

select char_length(s.student_name),count(e.enrollment_id) from students as s join enrollments as e on s.student_id=e.student_id group by char_length(Student_name)
order by count;


-- self join

















-- SubQuery



use Sakila;
select * from payment where payment_id=5;
select * from payment where amount =9.99;

-- using Subquery 
select * from payment where amount =(select * from payment where payment_id=5);

-- get payment id and amount where amt is not equals to amt of payment id =23;
select payment_id ,amount from payment;
select payment_id ,amount from payment where payment_id !=23;

select payment_id ,amount from payment where amount!=(select amount from payment where payment_id =23);


-- ques 
select month(payment_date)from payment where payment_id =6;
select * from payment;
select payment_id,customer_id,amount,payment_date from payment where month(payment_date)=(select month(payment_date)from payment where payment_id =6);
-- ques 
select staff_id from payment where payment_id = 7;
select * from payment where staff_id=(select staff_id from payment where payment_id = 7);


-- ques
select max(amount) from payment ;
select * from payment where amount =11.99;
select * from payment where amount =(select max(amount) from payment);

-- ques 
select amount from payment where rental_id =1725;

select amount ,count(payment_id) from payment where amount <(select amount from payment where rental_id =1725) group by amount ;

-- ques 
select month(payment_date) from payment where customer_id=1 && payment_id=3;

select month(payment_date),sum(amount) from payment where month(payment_date)>(select month(payment_date)from payment where customer_id=1 and payment_id=3) group by month(payment_date);

