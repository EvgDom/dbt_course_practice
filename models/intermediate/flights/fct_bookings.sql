{{
  config(
    materialized = 'table',
    meta = {
      'owner': 'sql_file'
    }
    )
}}
select 
{# Как сделать обработку ошибки по вводу модели #}
{{ show_columns_relation('src_flights__bookings') }}
--    book_ref, 
--    book_date, 
--    total_amount
from 
    {{ ref('src_flights__bookings') }}