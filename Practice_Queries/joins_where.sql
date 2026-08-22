CREATE TABLE departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50),
location VARCHAR(50)
);
INSERT INTO departments VALUES
(10,'HR','Jaipur'),
(20,'IT','Bangalore'),
(30,'Finance','Mumbai'),
(40,'Marketing','Delhi'),
(50,'Legal','Pune');
CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
dept_id INT,
salary INT,
city VARCHAR(50)
);
INSERT INTO employees VALUES
(101,'Amit',10,45000,'Jaipur'),
(102,'Bhavna',20,72000,'Bangalore'),
(103,'Chirag',20,68000,'Bangalore'),
(104,'Divya',30,55000,'Mumbai'),
(105,'Esha',NULL,39000,'Delhi'),
(106,'Farhan',40,61000,'Delhi'),
(107,'Gaurav',60,50000,'Kolkata'),
(108,'Hina',30,83000,'Mumbai');
CREATE TABLE projects (
proj_id INT PRIMARY KEY,
proj_name VARCHAR(50),
dept_id INT,
budget INT
);
INSERT INTO projects VALUES
(1,'Payroll Revamp',10,120000),
(2,'Cloud Migration',20,500000),
(3,'Mobile App',20,300000),
(4,'Audit Automation',30,250000),
(5,'Brand Refresh',40,180000),
(6,'Data Lake',70,400000);

select * from employees;
select * from departments;
select * from projects;

-- Q1. Show employees with salary greater than 60000
select * 
from employees 
where salary>60000;

-- Q2.  Show employees from Delhi or Mumbai
select e.emp_name, e.emp_id, e.salary, e.city 
from employees as e
where city In ('Delhi','Mumbai');

-- Q3. Show employees with no department assigned 
select e.emp_id, e.emp_name, e.dept_id, salary
from employees as e
where e.dept_id is null;

-- Q4. Show departments located in Bangalore or Delhi
select * 
from departments
where location in ('Bangalore' ,'Delhi');

-- Q5. Show departments with dept_id 30 or higher
select * from departments
where dept_id= 30 or dept_id>30;

-- Q6. Show departments whose name starts with F or L 
select * 
from departments
where dept_name like 'F%' 
or dept_name like '%L' ;

-- Q7. Show projects with budget between 200000 and 400000
select *
from projects
where budget between 200000 and 400000;

-- Q8. Show projects belonging to dept_id 20
select *
from projects
where dept_id = 20;

-- Q9.Show projects containing 'a' with budget under 300000
select * from projects
where proj_name like '%a%' and budget<300000;

-- Q10. Show employee name, department name, location and project name for all matching rows across all three tables. 
select e.emp_name, d.dept_name, location, p.proj_name, budget
from employees as e
join departments as d
join projects as p
where e.dept_id = d.dept_id and d.dept_id = p.dept_id;