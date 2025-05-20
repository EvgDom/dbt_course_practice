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
--    book_ref, 
--    book_date, 
--    total_amount
{{ show_columns_relation('src_flights__bookings') }}
, {{ dbt_utils.generate_surrogate_key(['book_ref']) }} as surrogate_key
from 
    {{ ref('src_flights__bookings') }}