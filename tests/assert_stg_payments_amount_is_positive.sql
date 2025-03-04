-- Singulat test / custom test  --> dbt test -m stg_payment
with payments as (
    select * from {{ref("stg_payment")}}
)
select 
    orderid,
    sum(amount) total_amount
from payments
group by orderid
having total_amount < 0