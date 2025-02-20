{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'delete+insert',
    unique_key = ['flight_id']
    )
}}

select
    flight_id,
    flight_no,
    scheduled_departure,
    scheduled_arrival,
    departure_airport,
    arrival_airport,
    "status",
    aircraft_code,
    actual_departure,
    actual_arrival
from 
    {{ source('demo_src', 'flights') }}
where 
    1=1
{% if is_incremental() %}
    /*обновляем все данные за последние 3 месяца + все новые записи*/
    and scheduled_departure >= (select max(scheduled_departure) from {{ this }}) - interval '2 month'
{% endif %}