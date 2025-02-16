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
    null::int arrival_airport_id, /*id*/
    "status",
    null::int aircraft_id, /*id*/
    actual_departure,
    actual_arrival,
    null::timestamp load_date /*тех время загрузки*/
from
    {{ ref('src_flights__flights') }}