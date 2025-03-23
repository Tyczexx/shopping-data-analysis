--Where customers bought the most?
select 
	count(customer_id) as nb_customers
	,location
from shopping_data
group by 2
order by 1 desc
limit 5;

--The result: Top five locations where customers placed orders, are: Montana, California, Idaho, Illinois and Alabama.
