/*Walmart wants to analyze the sales patterns to determine 
which day of the week brings the highest sales.*/
select
    dayofweek(STR_TO_DATE(Date, '%d-%m-%Y')) as weeknum,
	dayname(STR_TO_DATE(Date, '%d-%m-%Y')) AS WeekName,
	round(sum(total)) as Total_Sales
from walmart
group by WeekName, weeknum
order by weeknum ;