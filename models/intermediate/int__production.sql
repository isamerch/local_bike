select
  coalesce(sc.store_id, "SOLD-OUT") as store_id  
  pr.product_id,
  pr.product_name,
  pr.model_year,
  pr.list_price,
  sc.stock_qty,
  pr.list_price * coalesce(sc.stock_qty, 0) as stock_amount,
  ca.category_id,
  ca.category_name,
  br.brand_id,
  br.brand_name
from {{ ref("stg__products") }} pr
left join {{ ref("stg__stocks") }} sc on pr.product_id = sc.product_id
left join {{ ref("stg__categories") }} ca on pr.category_id = ca.category_id
left join {{ ref("stg__brands") }} br on pr.brand_id = br.brand_id