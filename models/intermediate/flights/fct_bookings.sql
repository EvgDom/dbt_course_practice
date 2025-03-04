{{
  config(
    materialized = 'table',
    meta = {
      'owner': 'sql_file'
    }
    )
}}
select 
    book_ref, 
    book_date, 
    total_amount
from 
    {{ ref('src_flights__bookings') }}