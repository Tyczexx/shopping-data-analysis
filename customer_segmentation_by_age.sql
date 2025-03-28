-- customer segmentation

-- overview on age range of customers
select min(age), max(age)
from shopping_data;
-- The result: Youngest customer is eighteen and the oldest one is seventy.
 
select
    case 
        when age between 13 and 19 then 'Teenagers'
        when age between 20 and 29 then 'Young Adults'
        when age between 30 and 59 then 'Adults'
        when age >= 60 then 'Seniors'
        else 'Unknown'
    end as age_group
    ,gender
    ,count(*) as nb_of_purchases
    ,sum(purchase_amount) as total_purchase_amount
    ,round(avg(purchase_amount), 2) as avg_purchase_per_order --average amount spent per single purchase
from shopping_data
where age is not null and purchase_amount is not null
group by 1,2
order by order by sum(purchase_amount) desc;
--The result: Looking at gender and age of customers, the most spending group noticed are both male and female adults. 
