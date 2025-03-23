/* top 3 customers who purchased the most in each category
condition: total sales amount for a category was more than 30,000 USD */
with category_sales as 
( 
select 
	sum(purchase_amount) as total_sales
	,sd.category
from shopping_data sd
group by sd.category
having sum(purchase_amount) > 30000
),
ranked_customers as
(
select 
	sd.customer_id
	,sd.category
	,count(*) as nb_of_purchases
	,row_number() over 
		(partition by sd.category order by count(purchase_amount) desc) as rank_in_category
from shopping_data sd 
join category_sales cs on sd.category = cs.category
group by 1,2
)
select 
	rc.customer_id
	,rc.category
	,rc.nb_of_purchases
from ranked_customers rc
where rank_in_category <=3;

/* The result: Based on first CTE, total sales amount with the value more than 30,000 USD, was noticed for 3/4 of main categories.
Second CTE displayed ranking of customers according to how many orders they have placed in those categories. 
The final SELECT shows top 3 customers. It would be good to consider if we should reward them for kind of commitment. */
