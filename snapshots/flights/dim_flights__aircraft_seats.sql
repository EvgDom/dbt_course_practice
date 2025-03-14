{% snapshot dim_flights__aircraft_seats %}

{{
   config(
       target_schema='snapshot',
       unique_key=['aircraft_code', 'seat_no'],

       strategy='check',
       check_cols=['fare_conditions']
   )
}}

select
    aircraft_code,
    seat_no,
    fare_conditions 
from 
    {{ ref("src_flights__seats") }}

{% endsnapshot %}