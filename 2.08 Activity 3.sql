-- # 2.08 Activity 3

-- 1. Get a rank of districts ordered by the number of customers.
select
	district_id,
    count(*) as number_of_clients,
    rank () over (order by count(*) desc) as ranked
from bank.client
group by district_id;

-- 2. Get a rank of regions ordered by the number of customers.
select
    dis.a3 as region,
    count(*) as number_of_customers,
    rank () over (order by count(*) desc) as ranked
from bank.district as dis
inner join bank.client as cl on dis.a1 = cl.district_id
group by dis.a3;

-- 3. Get the total amount borrowed by the district together with the average loan in that district.
select
    acc.district_id,
    round(avg(ln.amount),0) as avg_loan,
    round(sum(ln.amount),0) as total_loan
from bank.loan as ln
inner join bank.account as acc using (account_id)
group by acc.district_id
order by total_loan;

-- 4. Get the number of accounts opened by district and year.
select
	district_id,
    count(*) as n_of_accounts,
    concat('19',left(date,2)) as year
from bank.account
group by district_id, left(date,2)
order by district_id;