/*Walmart wants to know which product lines are 
preferred by different customer types(Member vs. Normal)*/
USE walmart_db;
with customer_purchases as (
	select 
		`customer type` as Customer_Type ,
		`product line` as Product_Line,
		count(*) as total_purchases
	from walmart
	group by Customer_Type, Product_Line
	order by Customer_Type, total_purchases desc
)

select 
	Customer_Type, Product_Line, total_purchases
from (
    select *,
        rank() over (partition by Customer_Type  order by total_purchases desc ) as rnk
    FROM customer_purchases
    ) as ranked_purchases
where rnk = 1 ;
