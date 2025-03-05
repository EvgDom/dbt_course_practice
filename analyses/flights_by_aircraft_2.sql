{% set aircraft_query %}
    select distinct
        aircraft_code
    from 
        {{ ref('fct_flights') }}
{% endset %}

{% set aircraft_query_result = run_query(aircraft_query) %}
{% if execute %}
    {% set impotant_aircrafts =  aircraft_query_result.columns[0].values()%}
{% else %}
    {% set impotant_aircrafts = [] %}
{% endif %}

select 
    {%- for aircraft in impotant_aircrafts %}
    sum(case when aircraft_code = '{{ aircraft }}' then 1 else 0 end) as flights_{{ aircraft }}
        {%- if not loop.last %} , {% endif %}
{#- Variables #}
--{{ loop.last }}
--{{ loop['last'] }}
{#- Filter #}
--{{ aircraft|title }}
    {%- endfor %}
from 
    {{ ref('fct_flights') }}