WITH customer_totals AS (
  SELECT 
    `customer ID`, 
    round(SUM(total),2) AS total
  FROM walmart
  GROUP BY `customer ID`
  ORDER BY `customer ID`
),
ranked_customers AS (
  SELECT *,
         NTILE(3) OVER (ORDER BY total) AS ntile_rank
  FROM customer_totals
)
    
select *,
case
	when ntile_rank = 1 then 'low'
	when ntile_rank = 2 then 'mid'
	else 'high'
end as category
from ranked_customers;
