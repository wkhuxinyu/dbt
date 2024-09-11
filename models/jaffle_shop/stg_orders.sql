select
    id as order_id,
    customer as customer_id,
    ORDERED_AT order_date

from {{source ('jaffle_shop','orders')}}