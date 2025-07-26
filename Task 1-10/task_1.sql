/* Analyzing the total sales for each branch and comparing 
the growth rate across months and finding the top performer.*/
USE walmart_db;
with monthly_sales as (
	SELECT 
    branch,
    MONTH(STR_TO_DATE(Date, '%d-%m-%Y')) AS month_num,
    MONTHNAME(STR_TO_DATE(Date, '%d-%m-%Y')) AS month_name,
    ROUND(SUM(Total), 2) AS total_sales
	FROM walmart
	GROUP BY branch , month_num , month_name
	ORDER BY branch, month_num
)

select distinct Branch,
	round(AVG(growth_rate) over (PARTITION BY branch), 2) as Overall_Growth 
from (
		select branch, month_num, month_name, total_sales,
			ROUND(
			(total_sales - LAG(total_sales) OVER (PARTITION BY branch ORDER BY month_num)) 
			/ NULLIF(LAG(total_sales) OVER (PARTITION BY branch ORDER BY month_num), 0) * 100, 
			2 ) AS growth_rate
		from monthly_sales
		) as growth_rating
order by overall_growth desc ;