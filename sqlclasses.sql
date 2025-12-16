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


