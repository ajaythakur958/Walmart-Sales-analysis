select
dayname(STR_TO_DATE(Date, '%d-%m-%Y')) AS weekname,
round(sum(total)) as total_sales
from walmart
group by weekname
order by total_sales desc;