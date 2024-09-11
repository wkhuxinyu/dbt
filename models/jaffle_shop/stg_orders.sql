select
    id as order_id,
    customer as customer_id,
    ORDERED_AT order_date

from raw.jaffle_shop.orders