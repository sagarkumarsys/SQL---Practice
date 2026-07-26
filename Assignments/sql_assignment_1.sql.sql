CREATE DATABASE EMPLOYEE_PRACTICE;

USE EMPLOYEE_PRACTICE;

CREATE TABLE Employees (
EmpID INT PRIMARY KEY,
Name VARCHAR(50) NOT NULL,
Dept VARCHAR(50) NOT NULL,
City VARCHAR(50) NOT NULL,
Gender CHAR(1) NOT NULL,
Salary INT NOT NULL,
JoinDate DATE NOT NULL,
Role VARCHAR(50) NOT NULL
);


INSERT INTO Employees (EmpID, Name, Dept, City, Gender, Salary, JoinDate, Role) VALUES
(1,'Alice','HR','New York','F',55000,'2019-03-15','Manager'),
(2,'Bob','IT','Chicago','M',72000,'2020-07-22','Developer'),
(3,'Carol','Finance','New York','F',68000,'2018-11-01','Analyst'),
(4,'David','HR','Chicago','M',52000,'2021-01-10','Executive'),
(5,'Eve','IT','Houston','F',85000,'2017-06-30','Senior Dev'),
(6,'Frank','Finance','New York','M',74000,'2019-09-14','Manager'),
(7,'Grace','Marketing','Chicago','F',60000,'2022-02-28','Executive'),
(8,'Hank','IT','Houston','M',90000,'2016-04-05','Lead'),
(9,'Ivy','HR','New York','F',58000,'2020-12-19','Executive'),
(10,'Jack','Finance','Chicago','M',65000,'2021-03-07','Analyst'),
(11,'Karen','Marketing','Houston','F',62000,'2018-08-23','Manager'),
(12,'Leo','IT','New York','M',78000,'2019-11-11','Developer'),
(13,'Mia','HR','Chicago','F',53000,'2022-05-16','Executive'),
(14,'Nate','Finance','Houston','M',71000,'2017-12-02','Manager'),
(15,'Olivia','Marketing','New York','F',66000,'2020-06-18','Analyst'),
(16,'Paul','IT','Chicago','M',82000,'2018-03-27','Senior Dev'),
(17,'Quinn','HR','Houston','F',57000,'2021-09-09','Executive'),
(18,'Rita','Finance','New York','F',76000,'2019-01-25','Lead'),
(19,'Sam','Marketing','Chicago','M',63000,'2022-07-14','Executive'),
(20,'Tina','IT','Houston','F',88000,'2016-10-31','Lead'),
(21,'Uma','HR','New York','F',60000,'2020-04-03','Manager'),
(22,'Victor','Finance','Chicago','M',69000,'2018-07-19','Analyst'),
(23,'Wendy','Marketing','Houston','F',64000,'2021-11-27','Manager'),
(24,'Xander','IT','New York','M',95000,'2015-02-14','Architect'),
(25,'Yara','HR','Chicago','F',54000,'2022-09-08','Executive'),
(26,'Zoe','Finance','Houston','F',73000,'2019-05-21','Manager'),
(27,'Aaron','Marketing','New York','M',67000,'2020-10-15','Analyst'),
(28,'Bella','IT','Chicago','F',80000,'2017-08-06','Senior Dev'),
(29,'Carlos','HR','Houston','M',56000,'2021-06-24','Executive'),
(30,'Diana','Finance','New York','F',77000,'2018-02-09','Lead');




select dept, count(*) from employees group by dept; -- total number of employees in each department

select dept,sum(salary) from employees group by dept; --  total salary paid per department

select city, avg(salary) from employees group by city; -- average salary in each city

select dept, max(salary) from employees group by dept; --  maximum salary in each department

select dept, min(salary) from employees group by dept; -- minimum salary in each department

select dept, count(*) as employeeCount from employees group by dept  order by employeeCount desc; --  List departments with their employee count, sorted by count descending

select city, sum(salary) as totalsalary from employees group by city order by totalsalary; -- cities with total salary, sorted by TotalSalary ascending

select name,dept,salary from employees order by dept, salary desc; --  all employees ordered by department (A–Z) then by salary (highest first).

select name, city, joindate from employees order by city, joindate asc; -- all employees ordered by city (A–Z) then by join date (oldest first)

select name,dept,salary from employees order by dept asc,name asc, salary asc;	-- List all employees ordered by role (A–Z) then by salary (lowest first). 

select dept, count(*) as employeecount from employees having employeecount>=7; -- Show only departments that have more than 7 employees.

select dept, count(*) as totalemployee from employees group by dept having totalemployee>=7; -- Show only departments that have more than 7 employees.

select dept, avg(salary) from employees group by dept having avg(salary)>=65000; --  Show departments where the average salary exceeds 65000

select city, sum(salary) as totalsalary from employees group by city having sum(salary)>65000; -- Show cities where the total salary bill is greater than 650000.

select dept, max(salary) as maximumsalary from employees group by dept having max(salary)>=80000; -- Show departments where the maximum salary is at least 80000.

select role, count(*) as numberrole from employees group by role having count(role)>5; -- Show roles that appear more than 5 times in the table

select avg(salary) as avgsalary from employees; -- Find the overall average salary of all employees.

select dept, count(*) as femaleemployee from employees  where gender = 'F' group by dept;  -- Count how many female employees exist in each department.

select max(salary) as Highest, min(salary) as lowest from employees; -- highest and lowest salary across the entire company

select sum(salary) as totalsalary from employees where joindate>'2019-01-01'; -- total salary paid to employees who joined after 2019-01-01.

select gender, avg(salary) as average_salary from employees group by gender; -- average salary grouped by gender.

select dept, city, count(*) as totalemployee from employees group by dept, city; -- total employees grouped by department AND city

select dept, gender, avg(salary) as avgsalary  from employees group by dept, gender; -- average salary grouped by department AND gender.


--  total salary grouped by city AND role, ordered by city and total salary descending
select city, role, sum(salary) as totalsalary from employees  group by city, role order by city, totalsalary desc;


-- Count employees grouped by department AND role, show only groups with more than 1 employee
select dept, role, count(*) as countemployee from employees group by dept, role having countemployee>1;


-- max salary grouped by city AND gender.
select city, gender, max(salary) as maxsalary from employees group by city, gender;


--  departments with avg salary > 60000, ordered by avg salary descending
select dept, avg(salary) as avgsalary from employees group by dept having  avgsalary>60000 order by avgsalary desc;

 
 -- Show city+dept combos with more than 1 employee, ordered by count descending then city
 select city, dept, count(*) as countemployee from employees group by dept, city having countemployee>1  order by countemployee desc, city ; 
 
 
-- Show roles where total salary exceeds 300000, ordered by total salary ascending.
select role, sum(salary) as totalsalary from employees group by role having totalsalary>300000  order by totalsalary asc;
 
 
-- List each employee's name in UPPER CASE along with the year they joined, ordered by join year
select upper(name), year(joindate) from employees order by year(joindate);


-- Find the number of employees who joined each year, sorted by year.
select year(joindate), count(*) from employees group by year(joindate) order by year(joindate);