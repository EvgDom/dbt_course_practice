{%- macro bookref_to_bigint(col_name) %}
    {%- if col_name is string %}
        ('0x' || {{ col_name }})::bigint
    {%- endif %}
{%- endmacro %}