/*Walmart wants to segment customers based on their average spending behavior. 
Classify customers into threetiers: High, Medium, and Low spenders based on their total purchase amounts.*/
select
    Customer_id,
    TotalSpending,
    case
        when TotalSpending > ROUND(AVG(TotalSpending) OVER (), 2)*1.05 then 'High'
        when TotalSpending > ROUND(AVG(TotalSpending) OVER (), 2)*0.95 then 'Medium'
        else 'Low'
    end as SpendingSegment
from (select
        `Customer ID` as Customer_id,
        round(SUM(Total), 2) as TotalSpending
      from walmart
      group by Customer_id
    ) as customer_spendingc 
    order by TotalSpending desc;



