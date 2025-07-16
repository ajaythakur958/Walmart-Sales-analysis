select
MONTH(STR_TO_DATE(Date, '%d-%m-%Y')) AS month_num,
`customer ID`,
count(*) as orders_count
from walmart
group by month_num, `customer ID`
order by month_num, orders_count desc;