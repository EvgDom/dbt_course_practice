{{
  config(
    materialized = 'table'
  )
}}

select
    airport_code,
    airport_name,
    city,
    coordinates,
    timezone,
    'bookings' as record_source,
    now() as load_date
from 
    {{ source('demo_src', 'airports') }}