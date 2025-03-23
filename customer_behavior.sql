select * from shopping_data

-- customers who bought anything in summer season
select 
	count(customer_id) as customers
	,season 
from shopping_data
where age > 30 
group by season;

-- total sales amount for each product category and item
select 
	sum(purchase_amount) as total_sales
	,category
	,item_purchased
from shopping_data
group by 2,3
order by 1 desc;