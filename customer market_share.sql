# 	NET SALES PERCENTAGE BY CUSTOMER-- GLOBAL SHARE

with cte1 as (
SELECT c.customer,round(sum(net_sales)/1000000,2) as net_sales_mln
 FROM gdb0041.net_sales as ns
 join dim_customer as c
 using(customer_code)
 where fiscal_year=2021 
 group by c.customer
 order by net_sales_mln desc
 )
 
 select * , round((net_sales_mln*100)/sum(net_sales_mln)over(),2) as market_share
 from cte1
 order by market_share desc;
