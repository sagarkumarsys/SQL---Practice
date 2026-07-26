
select current_user();
show databases;

use sakila;

-- Display all the tables present in the Sakila Database
show tables;

-- Display all the rows and columns from the customer table
select * from customer;

-- Display customer_id column from the customer table
select customer_id from customer;

-- Display customer_id and first_name column from the customer table
select customer_id, first_name from customer;

-- Display complete details of the customer marry from the customer table
select * from customer where first_name = 'MARY';







