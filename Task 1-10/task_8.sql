/*Walmart needs to identify customers who made repeat  purchases 
within a specific time frame (e.g., within 30days)*/
USE walmart_db;
with Grouped_time_frame as (
	select 
		`customer id` as customer_id, `Invoice ID` as invoice_id,
		str_to_date(`Date`, '%d-%m-%Y') as purchase_date,
		floor( datediff(str_to_date(`Date`, '%d-%m-%Y') ,
        (select min(str_to_date(`Date`, '%d-%m-%Y')) from walmart))/30) as Grouped_30days_buckets
    from walmart
    )

select case
			when Grouped_30days_buckets = 0 then "Day 1 to 30"
			when Grouped_30days_buckets = 1 then "Day 31 to 60"
			when Grouped_30days_buckets = 2 then "Day 61 to 90"
			end as Day_Bucket_Label,
		customer_id,
		count(invoice_id) as purchase_counts_in_buckets
from Grouped_time_frame
group by Grouped_30days_buckets, customer_id
having purchase_counts_in_buckets > 1
order by Grouped_30days_buckets, purchase_counts_in_buckets desc ;

