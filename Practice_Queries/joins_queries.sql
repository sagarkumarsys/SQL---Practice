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


-- Q1. List each employee with their department name and location.
select e.emp_id, e.emp_name, d.dept_name, d.location
from employees as e
join departments d
on e.dept_id =d.dept_id;

-- Q2. Show every project along with the name of the department that owns it.
select p.proj_id, p.proj_name, p.dept_id, p.budget, d.dept_name 
from projects as p
join departments d
on d.dept_id =p.dept_id;

-- Q3. Show employee names together with the projects run by their own department.
select e.emp_name,p.proj_name,d.dept_name
from employees as e
join projects as p
join departments as d
on e.dept_id=d.dept_id and p.dept_id=d.dept_id;

-- Q4. List ALL employees with their department name; show NULL when the employee has no matching department
select e.emp_id, e.emp_name,e.dept_id, d.dept_name
from employees as e
left join departments as d
on e.dept_id = d.dept_id;

-- Q5. List ALL departments with their projects; departments with no project must still appear.
select d.dept_id, d.dept_name, p.proj_name,p.proj_name
from departments as d
left join projects as p
on d.dept_id = p.dept_id;

-- Q6. Find only those employees who do NOT belong to any valid department.
select e.emp_id, e.emp_name, d.dept_id
from employees as e
left join departments as d
on e.dept_id = d.dept_id where d.dept_name is null;

-- Q7. List ALL departments and any employees in them, using a RIGHT JOIN with employees on the left.
select e.emp_name, d.dept_name, d.dept_id
from employees as e
right join departments as d
on e.Dept_id = d.dept_id;

-- Q8. List ALL projects and the department that owns them, keeping projects that point to a missing department.
select p.proj_id, p.proj_name, d.dept_name, d.dept_id
from departments as d
right join projects as p
on d.dept_id = p.dept_id;

-- Q9. Find departments that currently have NO employee assigned.
select d.dept_id, d.dept_name, location
from departments as d
left join employees as e
on d.dept_id = e.dept_id where e.emp_id is null;

-- Q10. Produce every possible pairing of the Finance/Legal departments with employees earning above 70000.
select * from employees as e 
cross join departments as d
where (d.dept_name = 'Legal' or d.dept_name = 'Finance')
and Salary>70000;

-- Q11. Pair every project having a budget of at least 400000 with every department located in Mumbai or Pune. 
select p.proj_id, p.proj_name,location, d.dept_name, budget
from projects as p
cross join departments as d
where (budget>=400000 ) and location in ('Mumbai', 'Pune');

-- Q12. How many total row combinations result from CROSS JOIN of employees and departments? Show the count. 
select count(*) 
from employees as e
cross join departments as d;

-- Q13. Show ALL employees, plus department and project details where available (keep employees even with no dept/project). 
select e.emp_id, e.emp_name, d.dept_name, p.proj_name
from employees as e
left join departments as d
on e.dept_id = d.dept_id
left join projects as p
on p.dept_id = d.dept_id;

-- Q14. Show employees earning more than 60000 along with department and any project over 250000 budget. 
select e.emp_id, e.emp_name,salary, d.dept_name,p.proj_name, budget
from employees as e
join departments as d
on e.dept_id = d.dept_id 
join projects as p
on p.dept_id = d.dept_id
where salary>60000 and budget>250000;

-- Q15. List ALL departments with their employees and projects, including departments having neither.
select d.dept_id, d.dept_name, e.emp_name, p.proj_name
from departments as d
left join employees as e
on e.dept_id = d.dept_id 
left join projects as p
on p.dept_id = d.dept_id;

-- Q16. Show employees who work in a department located in Bangalore or Mumbai, along with the projects of that department. 
select e.emp_id, e.emp_name, d.dept_name, p.proj_name, location
from employees as e
join departments as d
on d.dept_id = e.dept_id
join projects as p
on p.dept_id = d.dept_id
where location in ('Bangalore','Mumbai');

-- Q17. Pair employees who work in the same city (avoid duplicate pairs and self-pairing). 
select e1.emp_id, e1.emp_name, e1.city, e2.emp_id,e2.emp_name,e2.city
 from employees as e1
join employees as e2
on e1.city =e2.city and e1.emp_id!=e2.emp_id and e1.emp_id<e2.emp_id;

-- Q18. Show every project along with employees of that department; keep projects with no employees. 
select p.proj_name, e.emp_name, location
from projects as p
left join employees as e
on e.dept_id = p.dept_id
left join departments as d
on d.dept_id =p.dept_id;