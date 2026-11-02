select
  extract(year from s.order_date) as YEAR,
  extract(month from s.order_date) as MONTH,
  s.store_state as STORE,
  p.category_name as CATEGORY,
  p.brand_name as BRAND,
  round(sum(s.order_line_amount)) as GROSS_REVENUE
from {{ ref("int__sales") }} s
left join (
  select distinct
    product_id,
    category_name,
    brand_name
  from {{ ref("int__production") }}
) p on s.product_id = p.product_id
group by
  YEAR,
  MONTH,
  STORE,
  CATEGORY,
  BRAND
order by
  GROSS_REVENUE desc

