{{
  config(
    materialized = 'table'
    )
}}
select
    aircraft_code,
    model, 
    "range",
    'bookings' as record_source,
    now() as load_date   
from 
    {{ source('demo_src', 'aircrafts') }}