select * from shopping_trends_updated


alter table shopping_trends_updated 
rename shopping_data
commit;

select * from shopping_data

alter table shopping_data
rename column `Item Purchased` to Item_Purchased,
rename column `Purchase Amount` to Purchase_Amount,
rename column `Review Rating` to Review_Rating,
rename column `Subscription Status` to Subscription_Status,
rename column `Shipping Type` to Shipping_Type,
rename column `Discount Applied` to Discount_Applied,
rename column `Promo Code Used` to Promo_Code_Used,
rename column `Previous Purchases` to Previous_Purchases,
rename column `Payment Method` to Payment_Method,
rename column `Frequency of Purchases` to Frequency_of_Purchases;
commit;

select * from shopping_data

