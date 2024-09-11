with customers as (

    select
        id as customer_id,
        NAME

    from raw.jaffle_shop.customers

),

orders as (

    select
        id as order_id,
        CUSTOMER as customer_id,
        ORDERED_AT

    from raw.jaffle_shop.orders

),

customer_orders as (

    select
        customer_id,

        min(ORDERED_AT) as first_order_date,
        max(ORDERED_AT) as most_recent_order_date,
        count(order_id) as number_of_orders

    from orders

    group by 1

),

final as (

    select
        customers.customer_id,
        customers.name,

        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders

    from customers

    left join customer_orders using (customer_id)

)

select * from final