select 
  concat(order_id, "_", item_id) as order_line_id,
  order_id,
  item_id as order_line,
  product_id,
  quantity as order_qty,
  list_price,
  discount as discount_rate
from {{ source("local_bike", "order_items") }}