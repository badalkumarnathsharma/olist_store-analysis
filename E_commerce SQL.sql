use e_commerce;
create  table kpi_1 
select if(weekday(order_purchase_timestamp)<5,"Weekdays","Weekend") as Days ,round(sum(payment_value)) from olist_orders_dataset O 
inner join olist_order_payments_dataset P on (O.order_id=P.order_id) group by days;
select * from kpi_1;
create table kpi_2 
select r.order_id,review_score,payment_type from olist_order_reviews_dataset R inner join olist_order_payments_dataset P on (R.order_id=P.order_id)
where review_score=5 and payment_type="credit_card";
select * from kpi_2;
create table kpi_3 
select product_category_name,round((abs(avg(timestampdiff(Day,order_delivered_customer_date,order_purchase_timestamp))))) as Duration 
from olist_order_items_dataset I left join olist_orders_dataset O on (I.order_id=O.order_id)
inner join olist_products_dataset P on (I.product_id=P.product_id)where product_category_name="pet_shop";
select * from kpi_3;
create  table kpi_4 
select customer_city,round(avg(price)),round(avg(payment_value)) from olist_orders_dataset O left join olist_customers_dataset C on (O.customer_id=C.customer_id)
inner join olist_order_items_dataset I on (O.order_id=I.order_id)
inner join olist_order_payments_dataset P on (I.order_id=P.order_id)
where customer_city="sao paulo";
select * from kpi_4;
create table kpi_5 
select review_score,round(avg(abs(timestampdiff(Day,order_delivered_customer_date,order_purchase_timestamp)))) as Shipping_days from olist_orders_dataset O inner join olist_order_reviews_dataset R 
on (o.order_id=R.order_id) group by review_score order by review_score;
select * from kpi_5;
