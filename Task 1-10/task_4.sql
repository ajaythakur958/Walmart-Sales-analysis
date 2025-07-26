/*Walmart suspects that some transactions have unusually high or low sales 
compared to the average for the product line. Identify these anomalies.*/
USE walmart_db;
USE walmart_db;
WITH product_line_avg AS (
  SELECT 
	`Product line` as Product_Line, 
    round(avg(total),2) AS avg_total
  FROM walmart
  GROUP BY Product_Line
)

select 
	w.`Invoice ID`, w.`Customer ID`, w.`Product line`, w.total as Total_Spends,
	case
		when w.total < 0.5*a.avg_total then 'Low_Anomaly'
		when w.total > 1.5*a.avg_total then 'High_Anomaly'
		else 'Normal'
	end as Anomalies
from walmart w
join product_line_avg a 
on w.`Product line` = a.Product_Line 
order by Total_Spends desc;