--ad hoc - сколько у каждого из типов самолетов всего мест
select
    s.aircraft_code,
    a.model,
    count(*) as aircraft_seat_cnt
from 
    {{ ref('src_flights__seats') }} s
 inner join
    {{ ref('stg_flights__aircrafts') }} a
    using (aircraft_code)
group by 
    s.aircraft_code,
    a.model
order by 
    count(*) desc