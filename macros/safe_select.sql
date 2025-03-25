{# Макрос безопасного запроса данных из таблицы #}
{% macro safe_select(database_name, schema_name, identifier_name, query='select' ) %}

    {% set rel_exists = adapter.get_relation(
            database=database_name,
            schema=schema_name,
            identifier=identifier_name
        ) %}

    {% if rel_exists is not none %}
        {% if query == 'select' %}
            SELECT * FROM {{ rel_exists }}
        {% elif query == 'columns' %}
            SELECT
                column_name,
                data_type
            FROM
                information_schema.columns
            WHERE
                table_name = '{{ identifier_name }}'
        {% endif %}
    {% else %}
        SELECT * NULL
    {% endif %} 
{% endmacro %}