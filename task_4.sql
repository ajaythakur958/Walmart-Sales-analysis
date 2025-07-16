WITH product_line_avg AS (
  SELECT 
    `Product line`, 
    round(avg(total),2) AS avg_total
  FROM walmart
  GROUP BY `Product line`
)

select w.`Product line`, w.total, a.avg_total,
case
	when w.total < 0.5*a.avg_total then 'low_anomaly'
    when w.total > 1.5*a.avg_total then 'high_anomaly'
    else 'normal'
end as anomalies
from walmart w
join product_line_avg a 
on w.`Product line` = a.`Product line`;