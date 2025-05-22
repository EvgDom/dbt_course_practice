{{
  config(
    materialized = 'table'
    )
}}

select
    aircraft_code,
    seat_no,
    fare_conditions,
    'test' as t
from 
    {{ source('demo_src', 'seats') }}