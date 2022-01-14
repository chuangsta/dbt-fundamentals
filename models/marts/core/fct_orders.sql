with payments as (

    select * from {{ ref('stg_payments') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

amount as (

select payments.order_id, orders.customer_id, payments.amount
from payments  left join orders  using (order_id) where payments.status = 'success' 

)

select * from amount