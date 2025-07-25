/*Walmart needs to determine which product line contributes the 
highest profit to each branch.The profit margin should be calculated 
based on the difference between the gross income and cost of goods sold.*/
with product_gross_income as (
	select 
    Branch, `product line` as Product_Line, 
	round(sum(`gross income`)) as gross_income_for_EachProduct,
	round(sum(total)) as total_revenue_for_EachProduct
	from walmart
	group by Branch, Product_Line
)
select *,
	round((gross_income_for_EachProduct/total_revenue_for_EachProduct)*100, 2) 
    as profit_margin_for_EachProduct
from product_gross_income
order by gross_income_for_EachProduct desc, branch ;