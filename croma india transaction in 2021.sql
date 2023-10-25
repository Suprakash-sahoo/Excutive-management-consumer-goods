# we need to find out 
#MONTH,PRODUCT NAME,VARIANT,SOLD QTY, GROSS PRICE PER ITEM,GROSS PRICE TOTAL



select s.date,s.product_code,p.product,p.variant,s.sold_quantity,g.gross_price,
round((gross_price*sold_quantity),2) as total_gross_price
from fact_sales_monthly as s
join dim_product as p
using (product_code)
 
join fact_gross_price as g
On s.product_code=g.product_code and
   g.fiscal_year=get_fiscal_year(date)

where customer_code="90002002"
and get_fiscal_year(date)=2021

order by date desc
limit 1000000;

