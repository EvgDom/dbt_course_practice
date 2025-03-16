{{
  config(
    materialized = 'table'
    )
}} 
select
    book_ref, 
    book_date, 
    total_amount
from 
    {{ source('demo_src', 'bookings') }}
where 
    1=1
    {{ limit_data_dev('book_date', 3000) }} -- 3000 дней назад (т.к. данные не свежие!)