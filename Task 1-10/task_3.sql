/*Walmart wants to segment customers based on their average spending behavior. 
Classify customers into three tiers: High, Medium, and Low spenders based on their total purchase amounts.*/
USE walmart_db;
select
    Customer_id,
    TotalSpending,
    case
        when TotalSpending > ROUND(AVG(TotalSpending) OVER (), 2)*1.05 then 'High Spenders'
        when TotalSpending > ROUND(AVG(TotalSpending) OVER (), 2)*0.95 then 'Medium Spenders'
        else 'Low Spenders'
    end as SpendingSegment
from (select
        `Customer ID` as Customer_id,
        round(SUM(Total), 2) as TotalSpending
      from walmart
      group by Customer_id
    ) as customer_spendingc 
    order by TotalSpending desc;



