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
    {{ ref('src_flights__bookings') }}