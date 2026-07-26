-- get the cities and population where you have the letter E in the city name
-- get the cities and population where second last letter should be B
-- get the cities and population where the city name have the second character as a and last second char R
-- get the cities and population where you have AA in the city name
-- get the cities and population where country name have the two charcater E seprated with a charcater and it should be in the middle

use world;

select name, population from city where name like '%E%';

select name, population from city where name like '%B_';

select name,population from city where name like '_A%R_';

select name,population from city where name like '%AA%';

select name,population from city where name like '%E_E%';
