with sales as (
  select
    max(order_date) as last_sold,
    sum(order_qty) as total_sold,
    product_id,
    store_id,
    store_state
from {{ ref("int__sales") }}
  group by
    product_id,
    store_id,
    store_state
)

select
  s.store_state as STORE,
  p.product_id as PRD_ID,
  p.product_name as PRD_NAME,
  p.model_year as MODEL_YEAR,
  p.stock_qty as STOCK_QTY,
  round(p.stock_amount) as STOCK_AMOUNT,
  p.category_name as CATEGORY,
  p.brand_name as BRAND,
  s.last_sold as LAST_SOLD,
  s.total_sold as TOTAL_SOLD
from {{ ref("int__production") }} p
left join sales s on p.product_id = s.product_id and p.store_id = s.store_id