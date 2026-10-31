select
    staff_id,
    active as staff_status,
    store_id as store_id,
    manager_id as manager_id
from {{ source("local_bike", "staffs") }}
