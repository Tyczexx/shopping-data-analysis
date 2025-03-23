-- Seasonal Bestsellers – trending products by season with product variant"
with product_sales as 
(
  select 
  	season
  	,item_purchased
    ,size
    ,color
    ,count(*) as number_of_purchases
  from shopping_data
  group by 1,2,3,4
  having count(*) > 1 -- used to filter out one-off purchases
),
ranked_products as 
(
  select 
  ps.*
  ,rank() over 
  		(partition by season order by number_of_purchases desc) as ranking_in_season
  from product_sales ps
)
select rp.*
from ranked_products rp
where ranking_in_season <= 3; -- Top 3 products per season