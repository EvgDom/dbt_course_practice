{% set status_flights_query %}
select distinct
    status
from
    {{ ref('src_flights__flights') }}
{% endset %}

{% set res = run_query(status_flights_query) %}
{% if execute %}
    {% set status_flights = res.columns[0].values() %}
{% else %}
    {% set status_flights = [] %}
{% endif %}

select 
   -- sum(case when status = 'Departed' then 1 else 0 end) as status_Departed
   {%- for rec in status_flights %}
    sum(case when status = '{{ rec }}' then 1 else 0 end) as status_{{ rec|replace(" ", "_") }}
        {%- if not loop.last %} , {% endif %}
   {%- endfor %}
from
    {{ ref('src_flights__flights') }}