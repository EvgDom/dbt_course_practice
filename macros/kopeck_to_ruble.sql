{% macro kopeck_to_ruble(col_name, scale = 2) %}
     ({{ col_name }} / 100)::numeric(16, {{ scale }})  
{% endmacro %}