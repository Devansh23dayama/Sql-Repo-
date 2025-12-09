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




