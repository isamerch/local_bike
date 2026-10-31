select
    store_id,
    product_id,
    quantity as stock_qty,
from {{ source("local_bike", "stocks") }}