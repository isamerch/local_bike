select
    concat(cast(store_id as string), "_", cast(product_id as string)) as store_product_id,
    store_id,
    product_id,
    quantity as stock_qty
from {{ source("local_bike", "stocks") }}

