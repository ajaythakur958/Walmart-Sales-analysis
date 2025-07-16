select `customer type`, `product line`,
count(*) as total_purchases
from walmart
group by `customer type`, `product line`
order by `customer type`, total_purchases desc;