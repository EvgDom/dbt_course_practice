{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'append',
    tags = ['bookings']
    )
}} 
select
    book_ref,
    book_date,
    {{- kopeck_to_ruble(col_name='total_amount', scale = -2) }} as total_amount
from 
    {{ source('demo_src', 'bookings') }}
{% if is_incremental() %} /*читать доку dbt!!! функция is_incremental() возвращает true если будет не первая загрузка и false если первая*/
  where
    /*book_ref > (select max(book_ref) from {{ this }})*/
    -- ('0x' || book_ref)::bigint > (SELECT MAX(('0x' || book_ref)::bigint) FROM {{ this }})
    {{- bookref_to_bigint(col_name='book_ref') }} > (SELECT MAX( {{- bookref_to_bigint(col_name='book_ref') }} ) FROM {{ this }})
{% endif %}

{% if execute %}
{# Вывод все нод - моделей, сидов и т.д. #}
-- {{ graph.nodes.values() }} 
  {% for node in graph.nodes.values() -%}
    {% if node.resource_type == 'model' or node.resource_type == 'seed' %}
-- {{ node.name }}
---------------------
-- {{ node.depends_on }}
---------------------
    {% endif %}
  {% endfor %}
{% endif %}