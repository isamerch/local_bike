with sales_enriched as (
  select
    s.customer_state,
    s.customer_city,
    p.category_name,
    p.brand_name,
    sum(s.order_qty) as qty
  from {{ ref("int__sales") }} s
  left join {{ ref("int__production") }} p
    on s.product_id = p.product_id
  where s.order_date >= '2018-01-01'
    and s.order_date <  '2019-01-01'
  group by
    s.customer_state,
    s.customer_city,
    p.category_name,
    p.brand_name
),

by_city as (
  select
    customer_state as STATE,
    customer_city as CITY,
    sum(qty) as TOTAL_SOLD,
    array_agg(category_name order by qty desc, category_name limit 1)[offset(0)] as TOP_CAT,
    array_agg(brand_name    order by qty desc, brand_name    limit 1)[offset(0)] as TOP_BRAND
  from sales_enriched
  group by customer_state, customer_city
)

select *
from by_city
order by TOTAL_SOLD desc
limit 10