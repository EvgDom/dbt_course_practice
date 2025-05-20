{% macro check_dependencies() %}
{% if execute %}
    {% set cnt_dep =  model.depends_on|list|length %}
    {% if cnt_dep > 1 %}
        {% do exceptions.warn("Warning: Model " ~ model.name ~ " depends on " ~ model.depends_on|list|length ~ " objects!") %}
    {% endif %}
{% endif %}
{% endmacro %}