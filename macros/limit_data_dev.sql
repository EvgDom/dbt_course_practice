{%- macro limit_data_dev(col_date, cnt_days=3) %}
{%- if target.name == 'dev' -%}
        {# and {{ col_date }} >= current_date - interval '{{ cnt_days }} days' #}
        and {{ col_date }} >= {{dbt.dateadd(datepart="day", interval=-cnt_days, from_date_or_timestamp="current_date") }}
{%- endif %}
{%- endmacro %}