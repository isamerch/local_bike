select
    customer_id,
    city as customer_city,
    state as customer_state,
    zip_code as customer_zipcode
from {{ source("local_bike", "customers") }}
