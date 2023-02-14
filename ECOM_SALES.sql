CREATE DATABASE ECOM_SALES
USE ECOM_SALES

select * from olist_customers_dataset
select * from olist_order_items_dataset
select * from olist_order_payments_dataset
select * from olist_order_reviews_dataset -- contains null values
select * from olist_orders_dataset -- missing data contains null
select * from olist_sellers_dataset
select * from product_category_name_translation
select * from olist_geolocation_dataset --error to uploading file
select * from olist_products_dataset -- contains null value in 2 to 5 col. 

/* from cutomer dataset */
select distinct customer_state from olist_customers_dataset order by customer_state
select count(distinct customer_state) from olist_customers_dataset ---27
select distinct customer_city from olist_customers_dataset order by customer_city
select count(distinct customer_city) from olist_customers_dataset ---4119
/* there are 4119 cities through out the 27 states */

/* from seller */
select distinct seller_id from olist_sellers_dataset --3095 unique sellers we have

SELECT A.customer_state STATE_NAME,
YEAR(B.order_purchase_timestamp) YEAR_,
ROUND(SUM(C.price),2) STATE_SALES
FROM olist_customers_dataset A
JOIN olist_orders_dataset B			ON A.customer_id=B.customer_id
JOIN olist_order_items_dataset C	ON B.order_id=C.order_id
GROUP BY A.customer_state,YEAR(B.order_purchase_timestamp)
ORDER BY YEAR_; 

SELECT count(a.order_id) AS Total_Orders,
sum(b.price + b.freight_value) AS Total_Sales
FROM olist_orders_dataset AS a 
INNER JOIN olist_order_items_dataset AS b 
ON a.order_id = b.order_id 

--STATE,YEAR,SALES
STATE FROM CUSTOMERS
YEAR FROM 


select year(o.order_purchase_timestamp) as years ,
c.customer_state, count(o.order_id) as number_of_order
from orders as o inner join customers as c 
on o.customer_id=c.customer_id
group by year(o.order_purchase_timestamp),c.customer_state 
order by years; 

with 
	state (customer_id,customer_state) as (select customer_id,customer_state from olist_customers_dataset)
select * from state

with
	years (customer_id,order_id,order_delivered_customer_date) as (select customer_id,order_id,year(order_delivered_customer_date) from olist_orders_dataset)
	select * from years

with
	state_sales (order_id,price) as (select order_id,price from olist_order_items_dataset)
select * from state_sales

select s.customer_state,y.order_delivered_customer_date,ss.price
from state s
join years y on s.customer_id=y.customer_id
join state_sales ss on y.order_id=ss.order_id




