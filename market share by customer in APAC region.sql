
with cte1 as (
SELECT c.customer,c.region,round(sum(net_sales)/1000000,2) as net_sales_mln
    
 FROM gdb0041.net_sales as ns
 join dim_customer as c
 using(customer_code)
 where fiscal_year=2021 
 group by c.customer,c.region
 order by c.region, net_sales_mln desc
 )
 select concat(customer,"  ",region) as market_region,round((net_sales_mln*100)/sum(net_sales_mln) over(partition by region),2) as marketshare_by_region
 from cte1
 where region="APAC";