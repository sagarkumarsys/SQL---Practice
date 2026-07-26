show databases; -- will show databases persent in the mysql

use world;

describe country;  -- What are the  tables and their datatype 

-- data access
select * from country;

select name, continent from country;

select name, continent, population from country;

select name, continent, population+500 from country;

select name, continent, population+500 as newpopulation from country; -- changed population column with newpopulation

select * from country where continent = 'Asia'; -- where  clause to filter data

select * from country where name = 'India';

select name, continent, population from country
where name= 'India';

select * from country where population = 1013662000;

select * from country where continent = 'Europe';

select * from country where continent = 'Europe'
and Indepyear >1900;  -- here, we use and operator for two condition in our statement , both the condtion should be true or false

select * from country where continent = 'Europe'
or Indepyear >1900;  -- here, we use or operator for two condition in our statement , one of the condtion should be true or false
-- 

