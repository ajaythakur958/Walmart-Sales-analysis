select `customer ID` , round(sum(total)) as amount_spends
from walmart
GROUP BY `customer ID`
order by amount_spends desc
limit 5;