select
    scheduled_departure::date as scheduled_departure,
    count(*) as cancelled_fligth_cnt
from 
    {{ ref('fct_flights') }}
--  {{ ref('dim_flights__airports') }}
where
    departure_airport = 'MJZ' and
    status = 'Cancelled'
group by 
    scheduled_departure::date
-- MJZ