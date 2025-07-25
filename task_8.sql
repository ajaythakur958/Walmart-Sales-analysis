/*Walmart needs to identify customers who made repeat  purchases 
within a specific time frame (e.g., within 30days)*/
with Grouped_time_frame as (
	select 
		`customer id` as customer_id,
		str_to_date(`Date`, '%d-%m-%Y') as purchase_date,
		floor( datediff(str_to_date(`Date`, '%d-%m-%Y') ,
        (select min(str_to_date(`Date`, '%d-%m-%Y')) from walmart))/30) as Grouped_30days
    from walmart
    )

select 
	Grouped_30days, customer_id,
	count(*) as purchase_counts
from Grouped_time_frame
group by Grouped_30days, customer_id
having purchase_counts > 1
order by Grouped_30days, purchase_counts desc ;

