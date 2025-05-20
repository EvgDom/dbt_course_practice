{%- macro limit_data_dev(col_date, cnt_days=3) %}
{%- if cnt_days > 0 %} 
        {%- if target.name == 'dev' -%}
                {# and {{ col_date }} >= current_date - interval '{{ cnt_days }} days' #}
                and {{ col_date }} >= {{dbt.dateadd(datepart="day", interval=-cnt_days, from_date_or_timestamp="current_date") }}
        {%- endif %}
{% else %}
        {{ exceptions.raise_compiler_error(' Parameter `cnt_days` smaller or equel 0! ') }}
{%- endif %}
{%- endmacro %}