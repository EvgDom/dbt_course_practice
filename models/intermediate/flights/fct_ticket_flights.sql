{{
  config(
    materialized = 'table'
    )
}}

select
    ticket_no,
    flight_id,
    fare_conditions,
    amount,
    null::boolean as boarding_pass_exists, /* Признак? */
    null::int as boarding_no, /* из другой таблицы */
    null::varchar(4) as seat_no, /* из другой таблицы */
    null::timestamp as load_date /*Техническая дата*/
from
    {{ ref('src_flights__ticket_flights') }}