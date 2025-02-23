{{
  config(
    materialized = 'table'
    )
}}

select
    t.ticket_no,
    t.book_ref,
    t.passenger_id,
    t.passenger_name,
    t.contact_data
from
    {{ ref('src_flights__tickets') }} t
left join 
    {{ ref('airline_employees') }} a
  on 
    t.passenger_id = a.id 
 where 
    a.id is null  -- Исключние билетов внутренних сотрудников