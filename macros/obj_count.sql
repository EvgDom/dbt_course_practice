{% macro obj_count() %}
    {% if model.resource_type == "model" %}
        {% do log("Всего в проекте:\n" ~
                    "- " ~ graph.nodes.values()|selectattr("resource_type", "equalto", "model")|list|length ~ " моделей\n" ~
                    "- " ~ graph.nodes.values()|selectattr("resource_type", "equalto", "seed")|list|length ~ " seed\n" ~
                    "- " ~ graph.nodes.values()|selectattr("resource_type", "equalto", "snapshot")|list|length ~ " snapshot"
                    , True)
        %}
    {% endif %}
{# 
{% if execute %}
    -- Всего в проекте:
    -- {{ graph.nodes.values()|selectattr("resource_type", "equalto", "model")|list|length }} model
    -- {{ graph.nodes.values()|selectattr("resource_type", "equalto", "seed")|list|length }} seed
    -- {{ graph.nodes.values()|selectattr("resource_type", "equalto", "snapshot")|list|length }} snapshot
{% endif %} 
#}
{% endmacro %}