select * from shopping_data

-- adult customers who bought anything in summer season
select 
	count(customer_id) as customers
	,season 
from shopping_data
where age > 30 and season = 'Summer'
group by season;

/*The result: there were 713 "adult" customers made purchases during summer period. 
However, comparing with other seasons, summer was the worst-trending one.*/


-- total sales amount for each product category and item
select 
	sum(purchase_amount) as total_sales
	,category
	,item_purchased
from shopping_data
group by 2,3
order by 1 desc;
--The result: There was observed most sales on Clothing category and Blouses as a product item (10 410 USD)
