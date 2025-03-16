{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'append',
    tags = ['bookings']
    )
}} 
select
    book_ref,
    book_date,
    {{- kopeck_to_ruble(col_name='total_amount') }} as total_amount
from 
    {{ source('demo_src', 'bookings') }}
{% if is_incremental() %} /*читать доку dbt!!! функция is_incremental() возвращает true если будет не первая загрузка и false если первая*/
  where
    /*book_ref > (select max(book_ref) from {{ this }})*/
    ('0x' || book_ref)::bigint > (SELECT MAX(('0x' || book_ref)::bigint) FROM {{ this }})
{% endif %}

  