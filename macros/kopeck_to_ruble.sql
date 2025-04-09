{%- macro kopeck_to_ruble(col_name, scale = 2) %}
     {%- if scale < 0 %}
          {# {{ exceptions.raise_compiler_error("Invalid `scale` of numeric. Got: " ~ scale) }} #}
          {%- do exceptions.warn("Invalid `scale`. Got: " ~ scale) %}
     {%- endif %}
     ({{ col_name }} / 100)::numeric(16, {{ scale }})  
{%- endmacro %}