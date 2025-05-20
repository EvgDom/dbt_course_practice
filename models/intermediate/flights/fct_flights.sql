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
    ,{{ concat_columns([ 'flight_id', 'flight_no' ]) }} as flight_info
from
    {{ ref('src_flights__flights') }}

{% if execute %}
{%- set status_names = dbt_utils.get_column_values(
                          table = this,
                          column ='status')-%}
{%- do log("Distinct status of flights: " ~ status_names|join(", "), true) -%}
{% endif %}