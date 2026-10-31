select
    store_id,
    store_name,
    city as store_city,
    state as store_state,
    zip_code as store_zipcode
from {{ source("local_bike", "stores") }}