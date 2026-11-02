select
  o.order_id,
  oi.order_line,
  o.order_date,
  o.required_date,
  o.shipped_date,
  oi.product_id,
  oi.order_qty,
  oi.list_price,
  oi.order_qty * coalesce(oi.list_price, 0) * (1 - coalesce(oi.discount_rate, 0)) as order_line_amount,
  oi.discount_rate,
  c.customer_city,
  c.customer_state,
  o.store_id,
  so.store_state,
  s.staff_id,
  s.manager_id
from {{ ref("stg__order_items")}} oi
left join {{ ref("stg__orders") }} o on oi.order_id = o.order_id
left join {{ ref("stg__customers") }} c on o.customer_id = c.customer_id
left join {{ ref("stg__staffs") }} s on o.staff_id = s.staff_id
left join {{ ref("stg__stores") }} so on o.store_id = so.store_id
