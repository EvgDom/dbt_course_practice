{{
  config(
    materialized = 'table'
    )
}}

select
    flight_id,
    flight_no,
    scheduled_departure,
    scheduled_arrival,
    null::int departure_airport_id, /*id*/
    departure_airport,
    null::int arrival_airport_id, /*id*/
    "status",
    null::int aircraft_id, /*id*/
    aircraft_code,
    actual_departure,
    actual_arrival,
    now() load_date /*тех время загрузки*/
from
    {{ ref('src_flights__flights') }}