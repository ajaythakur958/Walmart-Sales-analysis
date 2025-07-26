USE walmart_db;
select * from walmart;


WITH customer_totals AS (
  SELECT 
    `customer ID`, 
    round(SUM(total),2) AS total
  FROM walmart
  GROUP BY `customer ID`
  ORDER BY `customer ID`
),
grand_total as (
	select round(sum(total),2) as overalltotal from customer_totals
    )
    
select *,0.4*overalltotal,
case
	when total < 0.5*overalltotal then 'low'
    when total < 0.8*overalltotal then 'mid'
    else 'high'
end as category
from (
		select * from customer_totals
		cross join grand_total
        ) as all_total;





    






