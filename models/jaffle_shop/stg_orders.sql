select
    id as order_id,
    customer as customer_id,
    ORDERED_AT order_date,
    case when order_total>1000 then order_total*-1 else order_total end as order_total
from {{source ('jaffle_shop','orders')}}