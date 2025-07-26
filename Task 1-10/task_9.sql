/*Walmart wants to reward its top 5 customers 
who have generated the most sales Revenue*/
USE walmart_db;
select 
	`customer ID` as Customer_id, 
    round(sum(total)) as Totoal_Amount_Spends
from walmart
GROUP BY Customer_id
order by Totoal_Amount_Spends desc
limit 5 ;