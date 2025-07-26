/*Walmart wants to understand the sales distribution 
between male and female customers on a monthly basis.*/
USE walmart_db;
select gender,
	MONTH(STR_TO_DATE(Date, '%d-%m-%Y')) AS month_num,
	monthname(STR_TO_DATE(Date, '%d-%m-%Y')) AS month_name,
	round(sum(total), 0) as total_sales
from walmart
group by gender, month_num, month_name
order by gender, month_num ;