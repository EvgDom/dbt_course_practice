{# Адаптер набора данных из модели src_flights__flights #}
{% set rel = load_relation( ref("src_flights__flights") ) %}
{# Название таблицы #}
{{ 'Название таблицы '~rel.identifier }}

{% set columns = adapter.get_columns_in_relation( rel ) %}

{{ 'Название колонок модели src_flights__flights:' }}
{%- for col_name in columns %}
    {{ col_name.name }}
{%- endfor %}