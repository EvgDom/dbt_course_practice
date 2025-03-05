-- {% set dttm = run_started_at %}
-- {{ dttm }}

select
    count(*) future_cnt_flghts
from 
    {{ ref('fct_flights') }}
where
    {# scheduled_departure >= '{{ run_started_at.strftime("%Y-%m-%d") }}'::date#}
    scheduled_departure >= '{{ run_started_at|string|truncate(10, True, "") }}'::date

