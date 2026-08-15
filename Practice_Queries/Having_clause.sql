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

select * from employees;

select dept, count(*) as employeecount from employees having employeecount>=7; -- Show only departments that have more than 7 employees.

select dept, count(*) as totalemployee from employees group by dept having totalemployee>=7; -- Show only departments that have more than 7 employees.

select dept, avg(salary) from employees group by dept having avg(salary)>=65000; --  Show departments where the average salary exceeds 65000

select city, sum(salary) as totalsalary from employees group by city having sum(salary)>65000; -- Show cities where the total salary bill is greater than 650000.

select dept, max(salary) as maximumsalary from employees group by dept having max(salary)>=80000; -- Show departments where the maximum salary is at least 80000.

select role, count(*) as numberrole from employees group by role having count(role)>5; -- Show roles that appear more than 5 times in the table

-- Show departments with more than 5 employees
select dept, count(*) from employees group by dept having count(*)>5;

-- Show Departments with average salary above 70,000
select dept, avg(salary) as avgsalary from employees group by dept having avgsalary>70000;

-- Show Cities with more than 8 employees
select city, count(*) from employees group by city having count(*)>8;

-- Show Departments with maximum salary above 80,000.
select dept, max(salary) as maxsalary from employees group by dept having maxsalary>80000;

-- Show Genders with more than 10 employees
select gender, count(*) as genderemp from employees group by gender having genderemp>10;

-- Show Department-gender groups with more than 2 employees
select gender, dept,  count(*) as comb from employees group by dept,gender having comb>2;