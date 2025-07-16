select gender,
MONTH(STR_TO_DATE(Date, '%d-%m-%Y')) AS month_num,
monthname(STR_TO_DATE(Date, '%d-%m-%Y')) AS month_name,
round(sum(total), 0)
from walmart
group by gender, month_num, month_name
order by gender, month_num