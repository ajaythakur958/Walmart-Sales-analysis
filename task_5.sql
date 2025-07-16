with payment_count as (
	select city, payment, 
	count(*) as payment_count,
    ROW_NUMBER() over (PARTITION BY city ORDER BY count(*) desc) as ranking
	from walmart
	group by city, payment
	order by city, payment_count desc
    )
select city, payment, payment_count 
from payment_count
where ranking = 1;