select s.date,sum(round((s.sold_quantity*g.gross_price),2)) as total_price
from fact_sales_monthly as s
join fact_gross_price as g
on s.product_code=g.product_code and 
  g.fiscal_year = get_fiscal_year(date)
  
  where customer_code=90002002
  group by date
  order by date asc;