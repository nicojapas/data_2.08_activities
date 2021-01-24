-- # 2.08 Activity 2

-- 1. Use the transactions table in the `bank` database to find the Top 20 `account_id`s based on the balances.
select
    trans_id,
    balance,
    rank () over (order by balance desc) as ranked
from bank.trans
limit 20;

-- 2. Illustrate the difference between `Rank()` and `Dense_Rank()`.
select
	a2 as district,
    a10 as ratio_of_urban_inhabitants,
    rank () over (order by a10 desc) as ranked,
    dense_rank () over (order by a10 desc) as dense_ranked,
    row_number () over (order by a10 desc) as row_numbered
from bank.district
limit 10;