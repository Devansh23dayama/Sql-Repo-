use sakila;
show tables;
select * from payment;
select count(*) from payment where amount=2.99;
select count(*),amount from payment group by amount;  
select customer_id,sum(amount)  from payment group by customer_id;
 -- total trsaction done  by each customer in month by may 
select customer_id,count(amount) from payment where month(payment_date)=5 group by customer_id;

-- the max amt of trasaction , the avg trsaction amt and the total transaction amt done through each staff
select staff_id, max(amount),avg(amount),sum(amount) from payment group by staff_id;

--
select staff_id, max(amount),avg(amount),sum(amount) from payment where customer_id%2=0 group by staff_id;

-- get the amt and the total trasaction for each amt only for the payments done througth the staff id 1 and the total trsaction should be greater than 30;

select * from payment;
-- get amt and total transaction 
-- group by amount 
select amount ,count(*) from payment where staff_id=1 group by amount having count(*)>30;

-- find out the no of customer served along with the avg amount and the total amount spend in each month for nstaff id one and two 
-- find out the no of customer served along with the avg amount and the total amount spend in each  YEAR AND  each month for nstaff id one and two 
 

select  extract(month from payment_date),count(customer_id) ,avg(amount) , sum(amount) from payment where staff_id=1 or staff_id=2 group by extract(month from payment_date);
select  extract(year from payment_date),extract(month from payment_date),count(customer_id) ,avg(amount) , sum(amount) from payment where staff_id=1 or staff_id=2 group by extract(year from payment_date),extract(month from payment_date);


-- Order by 
-- do sorting from acending to decending by default acending if you want decending put desc in from of column name 

select * from payment order by customer_id,amount desc;











