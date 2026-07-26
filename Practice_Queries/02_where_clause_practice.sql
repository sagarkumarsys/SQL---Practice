
show databases;
use world;

select * from country where continent = 'europe';

-- get the country code and country name only for the countrues where the region is southern europe
select code, name 
from  country 
where region = 'southern europe';


-- get the country code and country name where the surface area of the country is >1900
select code, name 
from country 
where surfacearea > 1900;


--  get the country code and country name where the country belongs to africa and the region is central africa
select code, name
from country
where continent = 'africa' 
and region = 'central africa';


--  get the country name, continent and population where  they belong to asia or africa
select name, continent, population 
from country 
where continent = 'asia' 
or continent = 'africa';


-- get the country name, population and region with 10% increment in population for the countries whose indepence year is after 1950
select name,
population, population*1.10 as newpopulation, 
region 
from country 
where indepyear>1950; 


-- get all the values of the county where the country name and local name is same
select * 
from country 
where name = localname;

use world;

select * from country;

select district, population, countrycode from city where countrycode = 'ind' ;

select name
, district, population, countrycode 
from city 
where countrycode = 'ind' 
and population>200000;

select name, 
district,countrycode, population  
from city 
where countrycode = 'ind' 
or population>200000;

select * from city where countrycode = 'afg' and district = 'kabol'


