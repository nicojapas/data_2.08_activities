-- # 2.08 Activity 1

-- In this activity, we will be using the table `district` from the `bank` database and according to the description for the different columns:

-- - A4: no. of inhabitants
-- - A9: no. of cities
-- - A10: the ratio of urban inhabitants
-- - A11: average salary
-- - A12: the unemployment rate

-- 1. Rank districts by different variables.

select
	a2 as district,
    a4 as n_of_inhabitants,
    rank () over (order by a4 desc) as ranked
from bank.district;

select
	a2 as district,
    a9 as n_of_cities,
    rank () over (order by a9 desc) as ranked
from bank.district;

select
	a2 as district,
    a10 as ratio_of_urban_inhabitants,
    rank () over (order by a10 desc) as ranked
from bank.district;

select
	a2 as district,
    a11 as average_salary,
    rank () over (order by a11 desc) as ranked
from bank.district;

select
	a2 as district,
    a12 as unemployment_rate,
    rank () over (order by a12 asc) as ranked
from bank.district;

# Everything together
select
	a2 as district,
    a3 as region,
    a4 as n_of_inhabitants,
    rank () over (order by a4 desc) as ranked_by_n_of_inhabitants,
	a9 as n_of_cities,
    rank () over (order by a9 desc) as ranked_by_n_of_cities,
    a10 as ratio_of_urban_inhabitants,
    rank () over (order by a10 desc) as ranked_by_ratio_of_urban_inhabitants,
    a11 as average_salary,
    rank () over (order by a11 desc) as ranked_by_average_salary,
    a12 as unemployment_rate,
    rank () over (order by a12 asc) as ranked_by_unemployment_rate
from bank.district
order by n_of_inhabitants desc;

-- 2. Do the same but group by `region`.
select
    a3 as region,
    sum(a4) as n_of_inhabitants,
    rank () over (order by sum(a4) desc) as ranked_by_n_of_inhabitants,
	sum(a9) as n_of_cities,
    rank () over (order by sum(a9) desc) as ranked_by_n_of_cities,
    avg(a10) as ratio_of_urban_inhabitants,
    rank () over (order by avg(a10) desc) as ranked_by_ratio_of_urban_inhabitants,
    avg(a11) as average_salary,
    rank () over (order by avg(a11) desc) as ranked_by_average_salary,
    avg(a12) as unemployment_rate,
    rank () over (order by avg(a12) asc) as ranked_by_unemployment_rate
from bank.district
group by region
order by n_of_inhabitants desc;