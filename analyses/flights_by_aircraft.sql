{% set impotant_aircrafts = ['CN1', 'CR2', '763'] %}

select 
    {% for aircraft in impotant_aircrafts -%}
    sum(case when aircraft_code = '{{ aircraft }}' then 1 else 0 end) as flights_{{ aircraft }}
        {%- if not loop.last %} , {% endif %}
    {% endfor %}
from 
    {{ ref('fct_flights') }}