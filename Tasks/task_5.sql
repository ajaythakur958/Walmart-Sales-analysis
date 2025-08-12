/*Walmart needs to determine the most popular payment method 
in each city to tailor marketing strategies.*/
USE walmart_db;
select city, payment, payment_count
from (
	select 
		city, payment, 
		count(*) as payment_count,
		RANK() over (PARTITION BY city ORDER BY count(*) desc) as ranking
	from walmart
	group by city, payment
	order by city, payment_count desc
    ) as payment_count
where ranking = 1 ;