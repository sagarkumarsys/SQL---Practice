use world;

-- like operator

select * from city where name= 'delhi';


select * from city where name= 'b';

select * from city where name like '%b'; -- ends from b

select * from city where name like 'b%'; -- starts from b

select * from city where name like 'ka%';

select * from city where name like 'a%k'; -- starts with a ends with k and anything between a and k

select * from city where name like 'be%'; -- starts with be

select * from city where name like '%a%'; -- a in the middle

-- wildcard character

select* from city where name like 'A__';  -- here we use double underscores __ means any two character after A

select * from city where name like 'T__%'; -- starts with T, any two character after it, any charater after it or not

