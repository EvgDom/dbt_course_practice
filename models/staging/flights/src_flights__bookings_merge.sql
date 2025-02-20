{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'merge',
    unique_key = ['book_ref'],
    tags = ['bookings'],
    merge_update_columns = ['total_amount'],
    on_schema_change = 'append_new_columns'
    )
}} 
select
    book_ref, 
    book_date, 
    total_amount,
    (total_amount + 1000)::int as test_clmn
from 
    {{ source('demo_src', 'bookings') }}
{% if is_incremental() %}
  where
        /*book_date > current_date - interval '7 day' /* предполагаем, что на источнике данные не будут меняться позже 7 дней */*/
    book_date > (select max(book_date) from {{ this }}) - interval '97 day'
{% endif %}

  