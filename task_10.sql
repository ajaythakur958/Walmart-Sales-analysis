/*Walmart wants to analyze the sales patterns to determine 
which day of the week brings the highest sales.*/
select
	dayname(STR_TO_DATE(Date, '%d-%m-%Y')) AS WeekName,
	round(sum(total)) as Total_Sales
from walmart
group by WeekName
order by Total_Sales desc ;